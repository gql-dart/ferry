import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:gql/execution.dart';
import 'package:uuid/uuid.dart';

import './query_stream.dart';
import './graphql_response.dart';
import './query_event.dart';
import './cache.dart';

final _uuid = Uuid();

/// Customize how the query response is merged into the cache. Useful
/// when merging mutation results that add items to a list, etc.
/// Note: if a callback is provided, [updateCache]
/// is also run immediately with the [optimisticResponse].
typedef UpdateCacheHandler<T, TVariables extends JsonSerializable>
    = void Function(dynamic proxy, GraphQLResponse<T, TVariables> response,
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

  /// List of [QueryStream]s with active listeners. Can be used to refetch queries
  /// following a mutation.
  final activeQueryStreams = <String, QueryStream>{};

  final queryEventController = StreamController<QueryEvent>.broadcast();

  Stream<GraphQLResponse> responseStream;

  GQLClient(
      {@required this.link,
      @required this.cache,
      this.updateCacheHandlers = const {},
      // TODO: change default back
      this.defaultFetchPolicy = FetchPolicy.CacheFirst,
      this.typePolicies}) {
    responseStream = queryEventController.stream.transform(_resolve);
  }

  QueryStream<T, TVariables> query<T, TVariables extends JsonSerializable>(
      GraphQLQuery<T, TVariables> query,
      [QueryOptions options]) {
    return QueryStream<T, TVariables>(this, query, options);
  }

  /// Groups the events by their originating [QueryStream] into seperate streams,
  /// gets the response for each substream, then merges their responses back
  /// together.
  ///
  /// NOTE: If the [QueryEvent.queryStreamId] does not exist (for example, if
  /// the event is added directly to the [GQLClient.stream]), we must group
  /// by a uniqe ID to prevent events from being overwritten in the switchMap
  /// before they've resolved.
  StreamTransformer<QueryEvent, GraphQLResponse> get _resolve =>
      StreamTransformer.fromBind((queryEventStream) => queryEventStream
          .groupBy((event) => event.queryStreamId ?? _uuid.v4())
          .flatMap((queryStreamEvents) => queryStreamEvents.switchMap(
              (queryEvent) => _optimisticResponseStream(queryEvent))));

  /// Creates a response stream, starting with an optimistic [GraphQLResponse]
  /// if a [QueryEvent.optimisticResponse] is proviced, then remmoves the
  /// optimistic patch from the cache once the network response is received.
  Stream<GraphQLResponse> _optimisticResponseStream(QueryEvent queryEvent) =>
      queryEvent.options?.optimisticResponse == null
          ? _responseStream(queryEvent)
          : _responseStream(queryEvent)
              .startWith(GraphQLResponse(
                  triggeringEvent: queryEvent,
                  data: queryEvent.query
                      .parse(queryEvent.options?.optimisticResponse),
                  optimistic: true))
              .doOnData((response) {
              if (response.optimistic == false)
                cache.removeOptimisticPatch(response.triggeringEvent.id);
            });

  /// Determines how to resolve a query based on the [FetchPolicy] and caches
  /// responses from the network if required by the policy.
  Stream<GraphQLResponse> _responseStream(QueryEvent queryEvent) {
    final fetchPolicy = queryEvent.options?.fetchPolicy ?? defaultFetchPolicy;
    switch (fetchPolicy) {
      case FetchPolicy.NoCache:
        return _responseStreamFromNetwork(queryEvent);
      case FetchPolicy.NetworkOnly:
        return _responseStreamFromNetwork(queryEvent).doOnData(_writeToCache);
      case FetchPolicy.CacheOnly:
        return _responseStreamFromCache(queryEvent);
      case FetchPolicy.CacheFirst:
        return _responseStreamFromCache(queryEvent).take(1).switchMap(
            (result) => result.data != null
                ? _responseStreamFromCache(queryEvent)
                : _responseStreamFromNetwork(queryEvent)
                    .doOnData(_writeToCache)
                    .switchMap((_) => _responseStreamFromCache(queryEvent)));
      case FetchPolicy.CacheAndNetwork:
        {
          final responseStreamFromNetwork =
              _responseStreamFromNetwork(queryEvent).shareValue();
          return _responseStreamFromCache(queryEvent)
              .where((response) => response.data != null)
              .takeUntil(responseStreamFromNetwork)
              .concatWith([
            responseStreamFromNetwork
                .doOnData(_writeToCache)
                .switchMap((_) => _responseStreamFromCache(queryEvent))
          ]);
        }
    }
  }

  /// Fetches the query from the network, mapping the result to a
  /// [GraphQLResponse].
  Stream<GraphQLResponse> _responseStreamFromNetwork(QueryEvent queryEvent) =>
      link
          .request(Request(
            operation: queryEvent.operation,
          ))
          .map((response) => GraphQLResponse(
                triggeringEvent: queryEvent,
                data: (response.data == null || response.data.isEmpty)
                    ? null
                    : queryEvent.query.parse(response.data),
                errors: response.errors,
              ));

  /// Fetches the query from the cache, mapping the result to a
  /// [GraphQLResponse].
  Stream<GraphQLResponse> _responseStreamFromCache(QueryEvent queryEvent) {
    return cache
        .watchQuery(
          operation: queryEvent.operation,
        )
        .map((data) => GraphQLResponse(
              triggeringEvent: queryEvent,
              data: (data == null || data.isEmpty)
                  ? null
                  : queryEvent.query.parse(data),
            ));
  }

  /// Store data in cache
  void _writeToCache(GraphQLResponse response) {
    if (response.data == null) return;
    cache.writeQuery(
        eventId: response.triggeringEvent.id,
        operation: response.triggeringEvent.operation,
        data: response.data.toJson(),
        optimistic: response.optimistic);
  }
}
