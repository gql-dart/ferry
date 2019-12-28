import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:gql/execution.dart';

import '../cache/core/cache.dart';
import './query_ref.dart';
import './graphql_response.dart';
import './query_event.dart';

enum FetchPolicy {
  /// Return result from cache. Only fetch from network if cached result is not available.
  ///
  /// Default
  CacheFirst,

  /// Return result from cache first (if it exists), then return network result once it's available.
  CacheAndNetwork,

  /// Return result from network, fail if network call doesn't succeed, save to cache
  NetworkOnly,

  /// Return result from cache if available, fail otherwise.
  CacheOnly,

  /// Return result from network, fail if network call doesn't succeed, don't save to cache
  NoCache,
}

/// Customize how the query response is merged into the cache. Useful
/// when merging mutation results that add items to a list, etc.
/// Note: if a callback is provided, `updateCache`
/// is also run immediately with the `optimisticResponse`.
typedef UpdateCacheHandler<T, TVariables extends JsonSerializable>
    = void Function(dynamic proxy, GraphQLResponse<T, TVariables> response,
        Map<String, dynamic> updateHandlerContext);

class GQLClient {
  final Link link;

  final Map<dynamic, Function> updateCacheHandlers;

  final controller = StreamController<QueryEvent>.broadcast();
  Stream<GraphQLResponse> stream;

  GQLClient({@required this.link, this.updateCacheHandlers = const {}}) {
    stream = controller.stream.transform(_responseTransformer);
  }

  QueryRef<T, TVariables> ref<T, TVariables extends JsonSerializable>(
      GraphQLQuery<T, TVariables> query) {
    return QueryRef<T, TVariables>(
      client: this,
      initialQuery: query,
    );
  }

  /// Fetches the data
  StreamTransformer<QueryEvent, GraphQLResponse> get _responseTransformer =>
      StreamTransformer.fromBind(
          (queryEventStream) => queryEventStream.switchMap((queryEvent) => link
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
                  ))));
}
