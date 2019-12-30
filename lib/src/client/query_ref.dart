import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:artemis/schema/graphql_query.dart';

import './graphql_response.dart';
import './query_event.dart';
import './client.dart';

final _uuid = Uuid();

class QueryRef<T, TVariables extends JsonSerializable> {
  final String id = _uuid.v4();
  final GQLClient _client;
  final GraphQLQuery<T, TVariables> initialQuery;

  Stream<GraphQLResponse<T, TVariables>> stream;

  QueryRef({GQLClient client, this.initialQuery}) : _client = client {
    stream = client.responseStream
        .where((response) => response.triggeringEvent.refId == id)
        // We must manually cast using a shallow copy to avoid a runtime error
        // See https://github.com/leafpetersen/cast/issues/1.
        .map((response) => GraphQLResponse<T, TVariables>.from(response))
        .transform(_updatedResultStream);
  }

  /// Updates the result based on `QueryEvent.updateResult` callback
  StreamTransformer<GraphQLResponse<T, TVariables>,
          GraphQLResponse<T, TVariables>>
      get _updatedResultStream =>
          StreamTransformer.fromBind((responseStream) => responseStream
                  .startWith(null)
                  .shareReplay(maxSize: 1)
                  .pairwise()
                  .map((results) {
                final previousResult = results.first;
                final result = results.last;
                return result.triggeringEvent.updateRefResult == null
                    ? result
                    : GraphQLResponse<T, TVariables>(
                        data: result.triggeringEvent.updateRefResult(
                          previousResult.data,
                          result.data,
                        ),
                        errors: result.errors,
                        triggeringEvent: result.triggeringEvent);
              }));

  Future<GraphQLResponse<T, TVariables>> execute({
    GraphQLQuery<T, TVariables> query,
    T Function(T previousResult, T result) updateRefResult,
    Map<String, dynamic> updateHandlerContext,
    Map<String, Object> optimisticResponse,
    dynamic updateCacheHandlerKey,
    FetchPolicy fetchPolicy,
  }) async {
    final event = QueryEvent(
        id: _uuid.v4(),
        refId: this.id,
        query: query ?? initialQuery,
        updateRefResult: updateRefResult,
        optimisticResponse: optimisticResponse,
        updateHandlerContext: updateHandlerContext,
        updateCacheHandlerKey: updateCacheHandlerKey,
        fetchPolicy: fetchPolicy);

    Future.delayed(Duration.zero).then((_) {
      _client.queryEventController.add(event);
    });

    return stream.firstWhere((result) =>
        result.triggeringEvent == event && result.optimistic == false);
  }
}
