import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:gql/execution.dart';
import 'package:uuid/uuid.dart';

import './query_ref.dart';
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

  /// List of [QueryRef]s with active listeners. Can be used to refetch queries
  /// following a mutation.
  final activeRefs = <String, QueryRef>{};

  final queryEventController = StreamController<QueryEvent>.broadcast();

  Stream<GraphQLResponse> responseStream;

  GQLClient(
      {@required this.link,
      @required this.cache,
      this.updateCacheHandlers = const {},
      // TODO: change default back
      this.defaultFetchPolicy = FetchPolicy.NetworkOnly,
      this.typePolicies}) {
    responseStream = queryEventController.stream.transform(_resolve);
  }

  QueryRef<T, TVariables> ref<T, TVariables extends JsonSerializable>(
      GraphQLQuery<T, TVariables> query) {
    return QueryRef<T, TVariables>(
      client: this,
      initialQuery: query,
    );
  }

  /// Groups the events by their originating [QueryRef] into seperate streams,
  /// gets the response for each substream, then merges their responses back
  /// together.
  ///
  /// NOTE: If the [QueryEvent.refId] does not exist (for example, if
  /// the event is added directly to the [GQLClient.stream]), we must group
  /// by a uniqe ID to prevent events from being overwritten in the switchMap
  /// before they've resolved.
  StreamTransformer<QueryEvent, GraphQLResponse> get _resolve =>
      StreamTransformer.fromBind((queryEventStream) => queryEventStream
          .groupBy((event) => event.refId ?? _uuid.v4())
          .flatMap((eventsForRef) => eventsForRef.switchMap(
              (queryEvent) => _optimisticResponseStream(queryEvent))));

  /// Creates a response stream, starting with an optimistic [GraphQLResponse]
  /// if a [QueryEvent.optimisticResponse] is proviced, then remmoves the
  /// optimistic patch from the cache once the network response is received.
  Stream<GraphQLResponse> _optimisticResponseStream(QueryEvent queryEvent) =>
      queryEvent.optimisticResponse == null
          ? _responseStream(queryEvent)
          : _responseStream(queryEvent)
              .startWith(GraphQLResponse(
                  triggeringEvent: queryEvent,
                  data: queryEvent.query.parse(queryEvent.optimisticResponse),
                  optimistic: true))
              .doOnData((response) {
              if (response.optimistic == false)
                cache.removeOptimisticPatch(response.triggeringEvent.id);
            });

  /// Determines how to resolve a query based on the [FetchPolicy] and caches
  /// responses from the network if required by the policy.
  Stream<GraphQLResponse> _responseStream(QueryEvent queryEvent) {
    final fetchPolicy = queryEvent.fetchPolicy ?? defaultFetchPolicy;
    switch (fetchPolicy) {
      case FetchPolicy.NetworkOnly:
        return _networkResponseStream(queryEvent).doOnData(_cacheResponse);
      case FetchPolicy.NoCache:
        return _networkResponseStream(queryEvent);
      case FetchPolicy.CacheFirst:
        return _hasCachedData(queryEvent)
            ? _cacheResponseStream(queryEvent)
            : _networkResponseStream(queryEvent)
                .doOnData(_cacheResponse)
                .startWith(null)
                .switchMap((_) => _cacheResponseStream(queryEvent));
      case FetchPolicy.CacheOnly:
        return _cacheResponseStream(queryEvent);
      case FetchPolicy.CacheAndNetwork:
        return _networkResponseStream(queryEvent)
            .doOnData(_cacheResponse)
            .startWith(null)
            .switchMap((_) => _cacheResponseStream(queryEvent));
    }
  }

  /// Fetches the query from the network, mapping the result to a
  /// [GraphQLResponse].
  Stream<GraphQLResponse> _networkResponseStream(QueryEvent queryEvent) => link
      .request(Request(
        operation: Operation(
            document: queryEvent.query.document,
            operationName: queryEvent.query.operationName,
            variables: queryEvent.query.getVariablesMap()),
      ))
      .map((response) => GraphQLResponse(
            triggeringEvent: queryEvent,
            data: response.data == null
                ? null
                : queryEvent.query.parse(response.data),
            errors: response.errors,
          ));

  /// Fetches the query from the cache, mapping the result to a
  /// [GraphQLResponse].
  Stream<GraphQLResponse> _cacheResponseStream(QueryEvent queryEvent) {
    // TODO: implement
  }

  bool _hasCachedData(QueryEvent queryEvent) {
    // TODO: implement
  }

  /// Store data in cache
  void _cacheResponse(GraphQLResponse response) {
    // TODO: implement
  }
}
