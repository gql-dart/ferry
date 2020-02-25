import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';

import './query_response.dart';
import './query_request.dart';
import '../cache/cache.dart';
import './fetch_policy.dart';
import '../helpers/operation_type.dart';
import '../cache/cache_proxy.dart';
import './client_options.dart';

class Client {
  final Link link;
  final Cache cache;
  final ClientOptions options;

  /// Keeps track of network connection status. For offline mutations to work,
  /// you must update this value when the network status changes.
  // TODO: implement offline mutation cache
  final isConnected = BehaviorSubject<bool>.seeded(true);

  /// Add a [QueryRequest] to the controller, then create a [responseStream]
  /// with the same [QueryRequest] to listen for [QueryResponse]s.
  final queryController = StreamController<QueryRequest>.broadcast();

  Client({
    @required this.link,
    Cache cache,
    ClientOptions options,
  })  : options = options ?? ClientOptions(),
        cache = cache ?? Cache();

  Stream<QueryResponse<T>> responseStream<T>(QueryRequest<T> request) {
    bool initial = true;
    return queryController.stream
        // Filter for only the relevent queries
        .whereType<QueryRequest<T>>()
        .where((req) => req.queryId == request.queryId)
        // (if enabled) recursively add __typename field to every node in query
        .map(_addTypename)
        // Fetch [QueryResponse] from network (and optionally cache results)
        // or fetch from cache, depending on the [FetchPolicy]. Switches to
        // the latest stream for a given [queryId].
        .switchMap((req) => _responseStream(req))
        // Update the result based on previous result for the given [queryId],
        // if applicable. This enables features like pagination.
        .transform(StreamTransformer.fromBind(_updateResultStream))
        // Trigger the [QueryRequest] on first listen
        .doOnListen(
      () async {
        if (initial) {
          await Future.delayed(Duration.zero);
          queryController.add(request);
        }
        initial = false;
      },
    );
  }

  /// Optionally adds [__typename] to each node of the operation
  QueryRequest<T> _addTypename<T>(QueryRequest<T> request) {
    if (!options.addTypename) return request;
    final document = transform(
      request.operation.document,
      [AddTypenameVisitor()],
    );
    return request
      ..operation = Operation(
        document: document,
        operationName: request.operation.operationName,
      );
  }

  /// Determines how to resolve a query based on the [FetchPolicy] and caches
  /// responses from the network if required by the policy.
  Stream<QueryResponse<T>> _responseStream<T>(QueryRequest<T> queryRequest) {
    final fetchPolicy = queryRequest.fetchPolicy ??
        options.defaultFetchPolicies[operationType(queryRequest)];
    switch (fetchPolicy) {
      case FetchPolicy.NoCache:
        return _optimisticNetworkResponseStream(queryRequest);
      case FetchPolicy.NetworkOnly:
        return _optimisticNetworkResponseStream(queryRequest)
            .doOnData(_writeToCache)
            .doOnData(_runUpdateCacheHandlers);
      case FetchPolicy.CacheOnly:
        return _cacheResponseStream(queryRequest)
            .doOnData(_runUpdateCacheHandlers);
      case FetchPolicy.CacheFirst:
        return _cacheResponseStream(queryRequest).take(1).switchMap(
              (result) => result.data != null
                  ? _cacheResponseStream(queryRequest)
                      .doOnData(_runUpdateCacheHandlers)
                  : _optimisticNetworkResponseStream(queryRequest)
                      .doOnData(_writeToCache)
                      .doOnData(_runUpdateCacheHandlers)
                      .switchMap((_) => _cacheResponseStream(queryRequest)),
            );
      case FetchPolicy.CacheAndNetwork:
        {
          final responseStreamFromNetwork =
              _optimisticNetworkResponseStream(queryRequest).shareValue();
          return _cacheResponseStream(queryRequest)
              .doOnData(_runUpdateCacheHandlers)
              .where((response) => response.data != null)
              .takeUntil(responseStreamFromNetwork)
              .concatWith([
            responseStreamFromNetwork
                .doOnData(_writeToCache)
                .switchMap((_) => _cacheResponseStream(queryRequest))
          ]);
        }
    }
  }

  /// Creates a response stream, starting with an optimistic [QueryResponse]
  /// if a [QueryRequest.optimisticResponse] is proviced, then remmoves the
  /// optimistic patch from the cache once the network response is received.
  Stream<QueryResponse<T>> _optimisticNetworkResponseStream<T>(
          QueryRequest<T> queryRequest) =>
      queryRequest.optimisticResponse == null
          ? _networkResponseStream(queryRequest)
          : _networkResponseStream(queryRequest)
              .startWith(
              QueryResponse(
                  queryRequest: queryRequest,
                  data: queryRequest.parseData(queryRequest.optimisticResponse),
                  optimistic: true),
            )
              .doOnData(
              (response) {
                if (response.optimistic == false)
                  cache.removeOptimisticPatch(response.queryRequest.queryId);
              },
            );

  /// Fetches the query from the network, mapping the result to a
  /// [QueryResponse].
  Stream<QueryResponse<T>> _networkResponseStream<T>(
          QueryRequest<T> queryRequest) =>
      link.request(queryRequest).map(
            (response) => QueryResponse(
              queryRequest: queryRequest,
              data: (response.data == null || response.data.isEmpty)
                  ? null
                  : queryRequest.parseData(response.data),
              errors: response.errors,
            ),
          );

  /// Fetches the query from the cache, mapping the result to a
  /// [QueryResponse].
  Stream<QueryResponse<T>> _cacheResponseStream<T>(
          QueryRequest<T> queryRequest) =>
      cache.watchQuery(queryRequest).map(
            (data) => QueryResponse(
              queryRequest: queryRequest,
              data: (data == null || data.isEmpty)
                  ? null
                  : queryRequest.parseData(data),
            ),
          );

  /// Store data in cache
  void _writeToCache(QueryResponse response) {
    if (response.data != null)
      cache.writeQuery(
        response.queryRequest,
        response.data.data,
        optimistic: response.optimistic,
        queryId: response.queryRequest.queryId,
      );
  }

  /// Run user-defined [UpdateCacheHandler]s with a [CacheProxy]
  void _runUpdateCacheHandlers<T>(QueryResponse<T> response) {
    final key = response.queryRequest.updateCacheHandlerKey;
    if (key == null) return;
    final handler = options.updateCacheHandlers[key] as UpdateCacheHandler<T>;
    if (handler == null) throw Exception("No handler defined for key $key");
    handler(
      CacheProxy(
        cache,
        response.optimistic,
        response.queryRequest.queryId,
      ),
      response,
    );
  }

  /// Updates previous result with new result.
  ///
  /// Useful for pagination.
  Stream<QueryResponse<T>> _updateResultStream<T>(
      Stream<QueryResponse<T>> stream) {
    return stream.startWith(null).pairwise().map((results) {
      final previousResult = results.first;
      final result = results.last;
      return result.queryRequest.updateResult == null
          ? result
          : QueryResponse<T>(
              data: result.queryRequest.updateResult(
                previousResult.data,
                result.data,
              ),
              errors: result.errors,
              queryRequest: result.queryRequest,
            );
    });
  }
}
