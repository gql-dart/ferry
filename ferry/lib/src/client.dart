import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';
import 'package:ferry_cache/ferry_cache.dart';

import './operation_response.dart';
import './operation_request.dart';
import './fetch_policy.dart';
import './cache_proxy.dart';
import './client_options.dart';

class Client {
  final Link link;
  final Cache cache;
  final ClientOptions options;

  /// Keeps track of network connection status. For offline mutations to work,
  /// you must update this value when the network status changes.
  // TODO: implement offline mutation cache
  final isConnected = BehaviorSubject<bool>.seeded(true);

  /// A stream controller that handles all [OperationRequest]s.
  final requestController = StreamController<OperationRequest>.broadcast();

  Client({
    @required this.link,
    Cache cache,
    ClientOptions options,
  })  : options = options ?? ClientOptions(),
        cache = cache ?? Cache();

  /// Provides a stream of [OperationResponse]s for the given [OperationRequest].
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool executeOnListen = true,
  }) {
    bool initial = true;
    return requestController.stream
        // Filter for only the relevent queries
        .whereType<OperationRequest<TData, TVars>>()
        .where((req) {
          if (request.requestId != null) {
            return request.requestId == req.requestId;
          } else {
            return request == req;
          }
        })
        // (if enabled) recursively add __typename field to every node in operation
        .map(_addTypename)
        // Fetch [OperationResponse] from network (and optionally cache results)
        // or fetch from cache, depending on the [FetchPolicy]. Switches to
        // the latest stream for a given [requestId].
        .switchMap((req) => _responseStream(req))
        // Update the result based on previous result for the given [requestId],
        // if applicable. This enables features like pagination.
        .transform(StreamTransformer.fromBind(_updateResultStream))
        // Trigger the [OperationRequest] on first listen
        .doOnListen(
          () async {
            if (initial && executeOnListen) {
              await Future.delayed(Duration.zero);
              requestController.add(request);
            }
            initial = false;
          },
        );
  }

  /// Adds `__typename` to each node of the operation when [ClientOptions.addTypename] is [true].
  OperationRequest<TData, TVars> _addTypename<TData, TVars>(
    OperationRequest<TData, TVars> request,
  ) =>
      options.addTypename
          // TODO: avoid casting to dynamic
          ? (request as dynamic).rebuild(
              (b) => b
                ..operation = Operation(
                  document: transform(
                    request.operation.document,
                    [AddTypenameVisitor()],
                  ),
                  operationName: request.operation.operationName,
                ),
            )
          : request;

  /// Determines how to resolve an operation based on the [FetchPolicy] and caches
  /// responses from the network if required by the policy.
  Stream<OperationResponse<TData, TVars>> _responseStream<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) {
    final operationType = operationRequest.operation.document.definitions
        .whereType<OperationDefinitionNode>()
        .firstWhere((operationNode) =>
            operationNode.name.value ==
            operationRequest.operation.operationName)
        .type;
    final fetchPolicy = operationRequest.fetchPolicy ??
        options.defaultFetchPolicies[operationType];
    switch (fetchPolicy) {
      case FetchPolicy.NoCache:
        return _optimisticNetworkResponseStream(operationRequest);
      case FetchPolicy.NetworkOnly:
        return _optimisticNetworkResponseStream(operationRequest)
            .doOnData(_writeToCache)
            .doOnData(_runUpdateCacheHandlers);
      case FetchPolicy.CacheOnly:
        return _cacheResponseStream(operationRequest)
            .doOnData(_runUpdateCacheHandlers);
      case FetchPolicy.CacheFirst:
        return _cacheResponseStream(operationRequest).take(1).switchMap(
              (result) => result.data != null
                  ? _cacheResponseStream(operationRequest)
                      .doOnData(_runUpdateCacheHandlers)
                  : _optimisticNetworkResponseStream(operationRequest)
                      .doOnData(_writeToCache)
                      .doOnData(_runUpdateCacheHandlers)
                      .take(1)
                      .concatWith(
                          [_cacheResponseStream(operationRequest).skip(1)]),
            );
      case FetchPolicy.CacheAndNetwork:
        {
          final responseStreamFromNetwork =
              _optimisticNetworkResponseStream(operationRequest);

          final StreamController<OperationResponse<TData, TVars>> controller =
              StreamController();
          final networkStreamSubscription = responseStreamFromNetwork
              .listen(controller.add, onError: controller.addError);

          final sharedNetworkStream = controller.stream.shareValue();

          return _cacheResponseStream(operationRequest)
              .doOnData(_runUpdateCacheHandlers)
              .where((response) => response.data != null)
              .takeUntil(sharedNetworkStream)
              .concatWith([
            sharedNetworkStream
                .doOnData(_writeToCache)
                .switchMap((networkResponse) => ConcatStream([
                      Stream.value(networkResponse),
                      _cacheResponseStream(operationRequest).skip(1),
                    ]))
          ]).doOnCancel(() {
            networkStreamSubscription.cancel();
          });
        }
    }
  }

  /// Creates a response stream, starting with an optimistic [OperationResponse]
  /// if a [OperationRequest.optimisticResponse] is provided, then removes the
  /// optimistic patch from the cache once the network response is received.
  Stream<OperationResponse<TData, TVars>>
      _optimisticNetworkResponseStream<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) =>
          operationRequest.optimisticResponse == null
              ? _networkResponseStream(operationRequest)
              : _networkResponseStream(operationRequest)
                  .startWith(
                  OperationResponse(
                    operationRequest: operationRequest,
                    data: operationRequest.optimisticResponse,
                    dataSource: DataSource.Optimistic,
                  ),
                )
                  .doOnData(
                  (response) {
                    if (response.dataSource != DataSource.Optimistic)
                      cache.removeOptimisticPatch(
                        response.operationRequest.requestId,
                      );
                  },
                );

  /// Fetches the query from the network, mapping the result to a
  /// [OperationResponse].
  Stream<OperationResponse<TData, TVars>> _networkResponseStream<TData, TVars>(
      OperationRequest<TData, TVars> operationRequest) {
    return link.request(operationRequest.execRequest).transform(
          StreamTransformer.fromHandlers(
            handleData: (response, sink) => sink.add(
              OperationResponse(
                operationRequest: operationRequest,
                data: (response.data == null || response.data.isEmpty)
                    ? null
                    : operationRequest.parseData(response.data),
                graphqlErrors: response.errors,
                dataSource: DataSource.Link,
              ),
            ),
            handleError: (error, stackTrace, sink) => sink.add(
              OperationResponse(
                operationRequest: operationRequest,
                linkException: error is LinkException
                    ? error
                    : ServerException(
                        originalException: error, parsedResponse: null),
                dataSource: DataSource.Link,
              ),
            ),
          ),
        );
  }

  /// Fetches the operation from the cache, mapping the result to a
  /// [OperationResponse].
  Stream<OperationResponse<TData, TVars>> _cacheResponseStream<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) =>
      cache.watchQuery(operationRequest.execRequest).map(
            (data) => OperationResponse(
              operationRequest: operationRequest,
              data: (data == null || data.isEmpty)
                  ? null
                  : operationRequest.parseData(data),
              dataSource: DataSource.Cache,
            ),
          );

  /// Writes data from [OperationResponse] to the cache
  void _writeToCache<TData, TVars>(OperationResponse<TData, TVars> response) {
    if (response.data != null)
      cache.writeQuery(
        response.operationRequest.execRequest,
        // TODO: avoid casting to dynamic
        (response.data as dynamic)?.toJson(),
        optimistic: response.dataSource == DataSource.Optimistic,
        requestId: response.operationRequest.requestId,
      );
  }

  /// Runs user-defined [UpdateCacheHandler]s with a [CacheProxy]
  void _runUpdateCacheHandlers<TData, TVars>(
    OperationResponse<TData, TVars> response,
  ) {
    final key = response.operationRequest.updateCacheHandlerKey;
    if (key == null) return;
    final handler =
        options.updateCacheHandlers[key] as UpdateCacheHandler<TData, TVars>;
    if (handler == null) throw Exception("No handler defined for key $key");
    handler(
      CacheProxy(
        cache,
        response.dataSource == DataSource.Optimistic,
        response.operationRequest.requestId,
      ),
      response,
    );
  }

  /// Updates previous result with new result.
  ///
  /// Useful for pagination.
  Stream<OperationResponse<TData, TVars>> _updateResultStream<TData, TVars>(
      Stream<OperationResponse<TData, TVars>> stream) {
    return stream.startWith(null).pairwise().map((results) {
      final previousResult = results.first;
      final result = results.last;
      return result.operationRequest.updateResult == null
          ? result
          : OperationResponse<TData, TVars>(
              data: result.operationRequest.updateResult(
                previousResult.data,
                result.data,
              ),
              linkException: result.linkException,
              graphqlErrors: result.graphqlErrors,
              operationRequest: result.operationRequest,
              dataSource: result.dataSource,
            );
    });
  }
}
