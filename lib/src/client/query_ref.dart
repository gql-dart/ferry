import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:gql/execution.dart';

import './gql_response.dart';
import './query_event.dart';
import './client.dart';

final _uuid = Uuid();

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

class QueryRef<T, TVariables extends JsonSerializable> {
  final String id = _uuid.v4();
  final GQLClient client;
  final GraphQLQuery<T, TVariables> initialQuery;

  StreamController<QueryEvent<T, TVariables>> _controller;
  Stream<GraphQLResponse<T, TVariables>> stream;

  QueryRef({this.client, this.initialQuery}) {
    /// Initialize the streamcontroller, and close it when all listeners have canceled
    _controller = StreamController(onCancel: () => _controller.close());

    /// Initialize the stream based on the transformers
    stream = _controller.stream
        .transform(_responseTransformer)
        .transform(_updateResultTransformer);
  }

  Future<GraphQLResponse<T, TVariables>> execute(
      {GraphQLQuery<T, TVariables> query,
      Map<String, Object> optimisticResponse,
      Context context}) async {
    final event = QueryEvent(
        query: query ?? initialQuery,
        optimisticResponse: optimisticResponse,
        context: context);

    Future.delayed(Duration.zero).then((_) {
      _controller.add(event);
    });

    return stream.firstWhere((result) => result.triggeringEvent == event);
  }

  /// Fetches the data
  StreamTransformer<QueryEvent<T, TVariables>, GraphQLResponse<T, TVariables>>
      get _responseTransformer =>
          StreamTransformer.fromBind((queryEventStream) =>
              queryEventStream.switchMap((queryEvent) => client.link
                  .request(Request(
                      operation: Operation(
                          document: queryEvent.query.document,
                          operationName: queryEvent.query.operationName,
                          variables: queryEvent.query.getVariablesMap()),
                      context: queryEvent.context ?? const Context()))
                  .map((response) => GraphQLResponse<T, TVariables>(
                        triggeringEvent: queryEvent,
                        data: response.data == null
                            ? null
                            : queryEvent.query.parse(response.data),
                        errors: response.errors,
                      ))));

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
                  return GraphQLResponse(
                      data: result.triggeringEvent
                          .updateResult(previousResult.data, result.data),
                      errors: result.errors,
                      triggeringEvent: result.triggeringEvent);
                } else {
                  return result;
                }
              }));
}
