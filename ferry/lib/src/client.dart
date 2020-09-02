import 'package:ferry/src/helpers/apply_transformers.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';

import './operation_response.dart';
import './operation_request.dart';
import './fetch_policy.dart';
import './cache.dart';

import './plugins/plugin.dart';
import './plugins/update_result_plugin/update_result_plugin.dart';
import './plugins/add_typename_plugin/add_typename_plugin.dart';

final standardPlugins = [
  AddTypenamePlugin(),
  UpdateResultPlugin(),
];

const _defaultFetchPolicies = {
  OperationType.query: FetchPolicy.CacheFirst,
  OperationType.mutation: FetchPolicy.NetworkOnly,
  OperationType.subscription: FetchPolicy.CacheAndNetwork,
};

class Client {
  final Link link;
  final Cache cache;
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  final List<Plugin> plugins = standardPlugins;

  /// A stream controller that handles all [OperationRequest]s.
  final requestController = StreamController<OperationRequest>.broadcast();

  Client({
    @required this.link,
    Cache cache,
    Map<OperationType, FetchPolicy> defaultFetchPolicies = const {},
  })  : cache = cache ?? Cache(),
        defaultFetchPolicies = {
          ..._defaultFetchPolicies,
          ...defaultFetchPolicies
        };

  /// Provides a stream of [OperationResponse]s for the given [OperationRequest].
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool executeOnListen = true,
  }) {
    var initial = true;
    return requestController.stream
        // Filter for only the relevent queries
        .whereType<OperationRequest<TData, TVars>>()
        .where((req) => request.requestId == req.requestId)
        // Apply request transformers
        .transform(applyTransformers<OperationRequest<TData, TVars>>(
          plugins.map((plugin) => plugin.buildRequestTransformer()),
        ))
        // Fetch [OperationResponse] from network (and optionally cache results)
        // or fetch from cache, depending on the [FetchPolicy]. Switches to
        // the latest stream for a given [requestId].
        .switchMap((req) => _responseStream(req))
        // Apply response transformers
        .transform(applyTransformers<OperationResponse<TData, TVars>>(
          plugins.map((plugin) => plugin.buildResponseTransformer()),
        ))
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
    final fetchPolicy =
        operationRequest.fetchPolicy ?? defaultFetchPolicies[operationType];
    switch (fetchPolicy) {
      case FetchPolicy.NoCache:
        return _optimisticNetworkResponseStream(operationRequest);
      case FetchPolicy.NetworkOnly:
        return _optimisticNetworkResponseStream(operationRequest)
            .doOnData(_writeToCache);
      case FetchPolicy.CacheOnly:
        return _cacheResponseStream(operationRequest);
      case FetchPolicy.CacheFirst:
        return _cacheResponseStream(operationRequest).take(1).switchMap(
              (result) => result.data != null
                  ? _cacheResponseStream(operationRequest)
                  : _optimisticNetworkResponseStream(operationRequest)
                      .doOnData(_writeToCache)
                      .take(1)
                      .concatWith(
                          [_cacheResponseStream(operationRequest).skip(1)]),
            );
      case FetchPolicy.CacheAndNetwork:
        {
          final responseStreamFromNetwork =
              _optimisticNetworkResponseStream(operationRequest);

          final controller =
              StreamController<OperationResponse<TData, TVars>>();
          final networkStreamSubscription = responseStreamFromNetwork
              .listen(controller.add, onError: controller.addError);

          final sharedNetworkStream = controller.stream.shareValue();

          return _cacheResponseStream(operationRequest)
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
    return null;
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
                    if (response.dataSource != DataSource.Optimistic) {
                      cache.removeOptimisticPatch(
                        response.operationRequest.requestId,
                      );
                    }
                  },
                );

  /// Fetches the query from the network, mapping the result to a
  /// [OperationResponse].
  Stream<OperationResponse<TData, TVars>> _networkResponseStream<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) {
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
      cache.watchQuery(operationRequest).map(
            (data) => OperationResponse(
              operationRequest: operationRequest,
              data: data,
              dataSource: DataSource.Cache,
            ),
          );

  /// Writes data from [OperationResponse] to the cache
  void _writeToCache<TData, TVars>(
    OperationResponse<TData, TVars> response,
  ) {
    if (response.data != null) {
      cache.writeQuery(
        response.operationRequest,
        response.data,
        optimistic: response.dataSource == DataSource.Optimistic,
        requestId: response.operationRequest.requestId,
      );
    }
  }
}
