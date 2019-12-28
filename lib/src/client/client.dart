import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:gql/execution.dart';

import '../cache/core/cache.dart';
import './query_ref.dart';
import './graphql_response.dart';
import './query_event.dart';

/// Customize how the query response is merged into the cache. Useful
/// when merging mutation results that add items to a list, etc.
/// Note: if a callback is provided, [updateCache]
/// is also run immediately with the [optimisticResponse].
typedef UpdateCacheHandler<T, TVariables extends JsonSerializable>
    = void Function(dynamic proxy, GraphQLResponse<T, TVariables> response,
        Map<String, dynamic> updateHandlerContext);

class GQLClient {
  final Link link;

  final FetchPolicy defaultFetchPolicy;

  // NOTE: function is untyped due to issues with deep casting
  // See https://github.com/leafpetersen/cast/issues/1.
  final Map<dynamic, Function> updateCacheHandlers;

  final controller = StreamController<QueryEvent>.broadcast();
  Stream<GraphQLResponse> stream;

  GQLClient(
      {@required this.link,
      this.updateCacheHandlers = const {},
      this.defaultFetchPolicy = FetchPolicy.NetworkOnly}) {
    stream = controller.stream.transform(_resolve);
  }

  QueryRef<T, TVariables> ref<T, TVariables extends JsonSerializable>(
      GraphQLQuery<T, TVariables> query) {
    return QueryRef<T, TVariables>(
      client: this,
      initialQuery: query,
    );
  }

  Stream<GraphQLResponse> _networkResponseStream(QueryEvent queryEvent) {
    return link
        // Fetch from network
        .request(Request(
          operation: Operation(
              document: queryEvent.query.document,
              operationName: queryEvent.query.operationName,
              variables: queryEvent.query.getVariablesMap()),
        ))
        // Map result to GraphQLResponse
        .map((response) => GraphQLResponse(
              triggeringEvent: queryEvent,
              data: response.data == null
                  ? null
                  : queryEvent.query.parse(response.data),
              errors: response.errors,
            ));
  }

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

  /// Groups the events by their originating [QueryRef] into seperate streams,
  /// gets the response for each substream, then merges their responses back
  /// together.
  StreamTransformer<QueryEvent, GraphQLResponse> get _resolve =>
      StreamTransformer.fromBind((queryEventStream) => queryEventStream
          .groupBy((event) => event.refId)
          .flatMap((eventsForRef) => eventsForRef.transform(_getResponse)));

  /// Fetches response from cache or network (or both).
  StreamTransformer<QueryEvent, GraphQLResponse> get _getResponse =>
      StreamTransformer.fromBind(
          (queryEventStream) => queryEventStream.switchMap((queryEvent) {
                final fetchPolicy =
                    queryEvent.fetchPolicy ?? defaultFetchPolicy;
                switch (fetchPolicy) {
                  case FetchPolicy.NetworkOnly:
                    return _networkResponseStream(queryEvent)
                        .doOnData(_cacheResponse);
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
              }));
}
