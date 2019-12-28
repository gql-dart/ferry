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
    stream = client.stream
        .where((response) => response.triggeringEvent.refId == id)
        // We must manually cast using a shallow copy to avoid a runtime error
        .map((response) => GraphQLResponse<T, TVariables>.from(response))
        .transform(_updateResultTransformer);
  }

  /// Updates result based on `QueryEvent.updateResult` callback
  StreamTransformer<GraphQLResponse<T, TVariables>,
          GraphQLResponse<T, TVariables>>
      get _updateResultTransformer =>
          StreamTransformer.fromBind((responseStream) => responseStream
                  .startWith(null)
                  .shareReplay(maxSize: 1)
                  .pairwise()
                  .map((results) {
                final previousResult = results.first;
                final result = results.last;
                if (result.triggeringEvent.updateResult != null) {
                  return GraphQLResponse<T, TVariables>(
                      data: result.triggeringEvent.updateResult(
                        previousResult.data,
                        result.data,
                      ),
                      errors: result.errors,
                      triggeringEvent: result.triggeringEvent);
                } else {
                  return result;
                }
              }));

  Future<GraphQLResponse<T, TVariables>> execute({
    GraphQLQuery<T, TVariables> query,
    T Function(T previousResult, T result) updateResult,
    Map<String, dynamic> updateHandlerContext,
    Map<String, Object> optimisticResponse,
    dynamic updateCacheHandlerKey,
  }) async {
    final event = QueryEvent(
        refId: id,
        query: query ?? initialQuery,
        updateResult: updateResult,
        optimisticResponse: optimisticResponse,
        updateHandlerContext: updateHandlerContext,
        updateCacheHandlerKey: updateCacheHandlerKey);

    Future.delayed(Duration.zero).then((_) {
      _client.controller.add(event);
    });

    return stream.firstWhere((result) => result.triggeringEvent == event);
  }
}
