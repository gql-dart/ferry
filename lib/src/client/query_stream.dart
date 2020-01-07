import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:artemis/schema/graphql_query.dart';

import './graphql_response.dart';
import './query_event.dart';
import './client.dart';

final _uuid = Uuid();

class QueryStream<T, TVariables extends JsonSerializable>
    extends Stream<GraphQLResponse<T, TVariables>> {
  final String id = _uuid.v4();
  final GQLClient _client;
  final GraphQLQuery<T, TVariables> initialQuery;
  final QueryOptions<T, TVariables> initialOptions;

  Stream<GraphQLResponse<T, TVariables>> _stream;

  QueryStream(GQLClient client, GraphQLQuery<T, TVariables> initialQuery,
      [QueryOptions<T, TVariables> initialOptions])
      : _client = client,
        initialQuery = initialQuery,
        initialOptions = initialOptions,
        super() {
    _stream = _client.responseStream
        .where((response) => response.triggeringEvent.queryStreamId == id)
        // Emit initial event. Must delay to ensure it gets picked up by this stream.
        .doOnListen(() async {
          await Future.delayed(Duration.zero);
          _client.queryEventController.add(QueryEvent<T, TVariables>(
              id: _uuid.v4(),
              queryStreamId: id,
              query: initialQuery,
              options: initialOptions));
        })
        // Register stream with client as active
        .doOnListen(() {
          _client.activeQueryStreams[id] = this;
        })
        // Deregister stream with client
        .doOnCancel(() => _client.activeQueryStreams.remove(id))
        // We must manually cast using a shallow copy to avoid a runtime error
        // See https://github.com/leafpetersen/cast/issues/1.
        .map((response) => GraphQLResponse<T, TVariables>.from(response))
        .transform(_updatedResultStream);
  }

  @override
  StreamSubscription<GraphQLResponse<T, TVariables>> listen(
    onData, {
    onError,
    onDone,
    cancelOnError,
  }) =>
      _stream.listen(onData,
          onError: onError, onDone: onDone, cancelOnError: cancelOnError);

  /// Updates the result based on [QueryEvent.updateResult] callback
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
                return result.triggeringEvent.options?.updateResult == null
                    ? result
                    : GraphQLResponse<T, TVariables>(
                        data: result.triggeringEvent.options?.updateResult(
                          previousResult.data,
                          result.data,
                        ),
                        errors: result.errors,
                        triggeringEvent: result.triggeringEvent);
              }));

  Stream<GraphQLResponse<T, TVariables>> reQuery(
      {GraphQLQuery<T, TVariables> query,
      QueryOptions<T, TVariables> queryOptions}) {
    final event = QueryEvent<T, TVariables>(
        id: _uuid.v4(),
        queryStreamId: id,
        query: query ?? initialQuery,
        options: initialOptions);

    return this
        .where((result) => result.triggeringEvent == event)
        .doOnListen(() {
      _client.queryEventController.add(event);
    });
  }
}
