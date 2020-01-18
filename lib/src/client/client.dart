import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:gql_exec/gql_exec.dart';

import './query_response.dart';
import './query_request.dart';
import '../cache/cache.dart';

/// Customize how the query response is merged into the cache. Useful
/// when merging mutation results that add items to a list, etc.
/// Note: if a callback is provided, [updateCache]
/// is also run immediately with the [optimisticResponse].
typedef UpdateCacheHandler<T, TVariables extends JsonSerializable>
    = void Function(dynamic proxy, QueryResponse<T, TVariables> response,
        Map<String, dynamic> updateHandlerContext);

class GQLClient {
  final Link link;
  final GQLCache cache;
  final FetchPolicy defaultFetchPolicy;
  final Map<String, TypePolicy> typePolicies;

  // NOTE: function is untyped due to issues with deep casting
  // See https://github.com/leafpetersen/cast/issues/1.
  final Map<dynamic, Function> updateCacheHandlers;

  /// Keeps track of network connection status. For offline mutations to work,
  /// you must update this value when the network status changes.
  final isConnected = BehaviorSubject<bool>.seeded(true);

  final queryController = StreamController<QueryRequest>.broadcast();

  GQLClient(
      {@required this.link,
      @required this.cache,
      this.updateCacheHandlers = const {},
      // TODO: change default back
      this.defaultFetchPolicy = FetchPolicy.CacheFirst,
      this.typePolicies});

  Stream<QueryResponse<T, TVariables>>
      responseStream<T, TVariables extends JsonSerializable>(
          QueryRequest<T, TVariables> requst) {
    return queryController.stream
        // Filter for only the relevent queries
        .whereType<QueryRequest<T, TVariables>>()
        .where((req) => req.queryId == requst.queryId)
        // Get the results
        .switchMap((req) => _optimisticResponseStream(req))
        // Update the result based on previous, if applicable
        .transform(StreamTransformer.fromBind(_updateResultStream));
  }

  Stream<QueryResponse<T, TVariables>>
      _updateResultStream<T, TVariables extends JsonSerializable>(
          Stream<QueryResponse<T, TVariables>> stream) {
    return stream.startWith(null).pairwise().map((results) {
      final previousResult = results.first;
      final result = results.last;
      return result.request.updateResult == null
          ? result
          : QueryResponse<T, TVariables>(
              data: result.request.updateResult(
                previousResult.data,
                result.data,
              ),
              errors: result.errors,
              request: result.request);
    });
  }

  /// Creates a response stream, starting with an optimistic [QueryResponse]
  /// if a [QueryRequest.optimisticResponse] is proviced, then remmoves the
  /// optimistic patch from the cache once the network response is received.
  Stream<QueryResponse<T, TVariables>>
      _optimisticResponseStream<T, TVariables extends JsonSerializable>(
              QueryRequest<T, TVariables> queryRequest) =>
          queryRequest.optimisticResponse == null
              ? _responseStream(queryRequest)
              : _responseStream(queryRequest)
                  .startWith(QueryResponse(
                      request: queryRequest,
                      data: queryRequest.query
                          .parse(queryRequest.optimisticResponse),
                      optimistic: true))
                  .doOnData((response) {
                  if (response.optimistic == false)
                    cache.removeOptimisticPatch(response.request.id);
                });

  /// Determines how to resolve a query based on the [FetchPolicy] and caches
  /// responses from the network if required by the policy.
  Stream<QueryResponse<T, TVariables>>
      _responseStream<T, TVariables extends JsonSerializable>(
          QueryRequest<T, TVariables> queryRequest) {
    final fetchPolicy = queryRequest.fetchPolicy ?? defaultFetchPolicy;
    switch (fetchPolicy) {
      case FetchPolicy.NoCache:
        return _responseStreamFromNetwork(queryRequest);
      case FetchPolicy.NetworkOnly:
        return _responseStreamFromNetwork(queryRequest).doOnData(_writeToCache);
      case FetchPolicy.CacheOnly:
        return _responseStreamFromCache(queryRequest);
      case FetchPolicy.CacheFirst:
        return _responseStreamFromCache(queryRequest).take(1).switchMap(
            (result) => result.data != null
                ? _responseStreamFromCache(queryRequest)
                : _responseStreamFromNetwork(queryRequest)
                    .doOnData(_writeToCache)
                    .switchMap((_) => _responseStreamFromCache(queryRequest)));
      case FetchPolicy.CacheAndNetwork:
        {
          final responseStreamFromNetwork =
              _responseStreamFromNetwork(queryRequest).shareValue();
          return _responseStreamFromCache(queryRequest)
              .where((response) => response.data != null)
              .takeUntil(responseStreamFromNetwork)
              .concatWith([
            responseStreamFromNetwork
                .doOnData(_writeToCache)
                .switchMap((_) => _responseStreamFromCache(queryRequest))
          ]);
        }
    }
  }

  /// Fetches the query from the network, mapping the result to a
  /// [QueryResponse].
  Stream<QueryResponse<T, TVariables>>
      _responseStreamFromNetwork<T, TVariables extends JsonSerializable>(
              QueryRequest<T, TVariables> queryRequest) =>
          link
              .request(Request(
                operation: Operation(
                    document: queryRequest.query.document,
                    operationName: queryRequest.query.operationName),
                variables: queryRequest.query.getVariablesMap(),
              ))
              .map((response) => QueryResponse(
                    request: queryRequest,
                    data: (response.data == null || response.data.isEmpty)
                        ? null
                        : queryRequest.query.parse(response.data),
                    errors: response.errors,
                  ));

  /// Fetches the query from the cache, mapping the result to a
  /// [QueryResponse].
  Stream<QueryResponse<T, TVariables>>
      _responseStreamFromCache<T, TVariables extends JsonSerializable>(
          QueryRequest<T, TVariables> queryRequest) {
    return cache
        .watchQuery(
          document: queryRequest.query.document,
          operationName: queryRequest.query.operationName,
          variables: queryRequest.query.getVariablesMap(),
        )
        .map((data) => QueryResponse(
              request: queryRequest,
              data: (data == null || data.isEmpty)
                  ? null
                  : queryRequest.query.parse(data),
            ));
  }

  /// Store data in cache
  void _writeToCache(QueryResponse response) {
    if (response.data != null)
      cache.writeQuery(
          eventId: response.request.id,
          document: response.request.query.document,
          operationName: response.request.query.operationName,
          variables: response.request.query.getVariablesMap(),
          data: response.data.toJson(),
          optimistic: response.optimistic);
  }
}
