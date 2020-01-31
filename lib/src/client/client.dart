import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';

import './query_response.dart';
import './query_request.dart';
import '../cache/cache.dart';
import './fetch_policy.dart';
import './network_error.dart';
import '../helpers/operation_type.dart';

/// Customize how the query response is merged into the cache. Useful
/// when merging mutation results that add items to a list, etc.
/// Note: if a callback is provided, [updateCache]
/// is also run immediately with the [optimisticResponse].
typedef UpdateCacheHandler<T, TVariables extends JsonSerializable> = void
    Function(
  dynamic proxy,
  QueryResponse<T> response,
  Map<String, dynamic> updateHandlerContext,
);

const _defaultFetchPolicies = {
  OperationType.query: FetchPolicy.CacheFirst,
  OperationType.mutation: FetchPolicy.NetworkOnly,
  OperationType.subscription: FetchPolicy.NetworkOnly,
};

class GQLClientOptions {
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  final Map<String, TypePolicy> typePolicies;
  // NOTE: function is untyped due to issues with deep casting
  // See https://github.com/leafpetersen/cast/issues/1.
  final Map<dynamic, Function> updateCacheHandlers;
  final bool addTypename;

  GQLClientOptions({
    this.updateCacheHandlers = const {},
    this.typePolicies,
    this.addTypename = true,
    Map<OperationType, FetchPolicy> defaultFetchPolicies = const {},
  }) : defaultFetchPolicies = {
          ..._defaultFetchPolicies,
          ...defaultFetchPolicies,
        };
}

class GQLClient {
  final Link link;
  final GQLCache cache;
  final GQLClientOptions options;

  /// Keeps track of network connection status. For offline mutations to work,
  /// you must update this value when the network status changes.
  final isConnected = BehaviorSubject<bool>.seeded(true);

  final queryController = StreamController<QueryRequest>.broadcast();

  GQLClient({
    @required this.link,
    @required this.cache,
    GQLClientOptions options,
  }) : options = options ?? GQLClientOptions();

  // TODO: set loading synchronously and with each time a new request is received
  Stream<QueryResponse<T>> responseStream<T>(QueryRequest<T> request) {
    return queryController.stream
        // Filter for only the relevent queries
        .whereType<QueryRequest<T>>()
        .where((req) => req.queryId == request.queryId)
        // Optionally add typename
        .map(_addTypename)
        // Get the results
        .switchMap((req) => _optimisticResponseStream(req))
        // Update the result based on previous, if applicable
        .transform(StreamTransformer.fromBind(_updateResultStream));
  }

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

  /// Creates a response stream, starting with an optimistic [QueryResponse]
  /// if a [QueryRequest.optimisticResponse] is proviced, then remmoves the
  /// optimistic patch from the cache once the network response is received.
  Stream<QueryResponse<T>> _optimisticResponseStream<T>(
          QueryRequest<T> queryRequest) =>
      queryRequest.optimisticResponse == null
          ? _responseStream(queryRequest)
          : _responseStream(queryRequest)
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

  /// Determines how to resolve a query based on the [FetchPolicy] and caches
  /// responses from the network if required by the policy.
  Stream<QueryResponse<T>> _responseStream<T>(QueryRequest<T> queryRequest) {
    final fetchPolicy = queryRequest.fetchPolicy ??
        options.defaultFetchPolicies[operationType(queryRequest)];
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
                      .switchMap((_) => _responseStreamFromCache(queryRequest)),
            );
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
  Stream<QueryResponse<T>> _responseStreamFromNetwork<T>(
          QueryRequest<T> queryRequest) =>
      link
          .request(
        Request(
            operation: Operation(
                document: queryRequest.operation.document,
                operationName: queryRequest.operation.operationName),
            variables: queryRequest.variables),
      )
          .transform(
        StreamTransformer.fromHandlers(handleError: (error, stackTrace, sink) {
          sink.add(
            QueryResponse(
                queryRequest: queryRequest,
                errors: [NetworkError(error, stackTrace)]),
          );
        }),
      ).map(
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
  Stream<QueryResponse<T>> _responseStreamFromCache<T>(
          QueryRequest<T> queryRequest) =>
      cache
          .watchQuery(
            document: queryRequest.operation.document,
            operationName: queryRequest.operation.operationName,
            variables: queryRequest.variables,
          )
          .map(
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
        queryId: response.queryRequest.queryId,
        document: response.queryRequest.operation.document,
        operationName: response.queryRequest.operation.operationName,
        variables: response.queryRequest.variables,
        data: response.data?.data,
        optimistic: response.optimistic,
      );
  }
}
