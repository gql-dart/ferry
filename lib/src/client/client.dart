import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql/execution.dart';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:artemis/artemis.dart';

final uuid = Uuid();

class MutationRef<T, U extends JsonSerializable> {
  Future<GraphQLResponse<T, U>> run;
}

class QueryRef<T, U extends JsonSerializable> {
  final String id = uuid.v4();
  final Client _client;
  final GraphQLQuery<T, U> _initialQuery;
  final Duration pollingDuration;

  StreamController<QueryEvent<T, U>> _controller;
  Stream<GraphQLResponse<T, U>> stream;

  QueryRef(Client client, GraphQLQuery<T, U> query, {this.pollingDuration})
      : _client = client,
        _initialQuery = query,
        super() {
    /// Initialize the StreamController
    ///
    /// the onCancel callback calls dispose to close the controller when there
    /// are no longer any active listeners
    _controller = StreamController(onListen: _onListen);

    /// Initialize the stream
    stream = _initStream();
  }

  void _onListen() {
    _controller.add(QueryEvent<T, U>(queryId: this.id, query: _initialQuery));
  }

  /// Creates the stream
  Stream<GraphQLResponse<T, U>> _initStream() {
    final responseStream =
        _controller.stream.switchMap((queryEvent) => _client.link
            .request(Request(
              operation: Operation(
                document: queryEvent.query.document,
                operationName: queryEvent.query.operationName,
                variables: queryEvent.query.getVariablesMap(),
              ),
            ))
            .map((response) => GraphQLResponse<T, U>(
                  triggeringEvent: queryEvent,
                  data: response.data == null
                      ? null
                      : queryEvent.query.parse(response.data),
                  errors: response.errors,
                )));

    final updatedResultStream = responseStream
        .startWith(null)
        .shareReplay(maxSize: 1)
        .pairwise()
        .map((results) {
      final previousResult = results.elementAt(0);
      final result = results.elementAt(1);
      if (result.triggeringEvent.updateResult != null) {
        return GraphQLResponse(
            data: result.triggeringEvent
                .updateResult(previousResult.data, result.data),
            errors: result.errors,
            triggeringEvent: result.triggeringEvent);
      } else {
        return result;
      }
    });

    return updatedResultStream;
  }

  Future<GraphQLResponse<T, U>> refetch(
      {GraphQLQuery<T, U> query,
      T Function(T previousResult, T result) updateResult}) {
    final queryEvent = QueryEvent<T, U>(
        queryId: this.id,
        query: query ?? _initialQuery,
        updateResult: updateResult);

    // TODO: is there a better way to immediately add the queryEvent than using a future?
    Future.delayed((Duration.zero)).then((_) => _controller.add(queryEvent));

    return stream
        .firstWhere((response) => response.triggeringEvent == queryEvent);
  }

  void startPolling(Duration pollInterval) {}
  void stopPolling() {}
}

/// Encapsulates a GraphQL query/mutation response, with typed
/// input and responses, and errors.
@immutable
class GraphQLResponse<T, U extends JsonSerializable> {
  /// The event that resulted in this response
  final QueryEvent<T, U> triggeringEvent;

  /// The typed data of this response.
  final T data;

  /// The list of errors in this response.
  final List<GraphQLError> errors;

  /// If this response has any error.
  bool get hasErrors => errors != null && errors.isNotEmpty;

  /// Instantiates a GraphQL response.
  const GraphQLResponse({
    @required this.triggeringEvent,
    this.data,
    this.errors,
  });
}

@immutable
class QueryEvent<T, U extends JsonSerializable> {
  final String queryId;
  final GraphQLQuery<T, U> query;
  final T Function(T previousResult, T result) updateResult;

  const QueryEvent(
      {@required this.queryId, @required this.query, this.updateResult});
}

class Client {
  final Link link;
  final StreamController<QueryEvent> _queryEventStream = PublishSubject();

  Client({@required this.link});

  QueryRef<T, U> query<T, U extends JsonSerializable>(GraphQLQuery<T, U> query,
      {Duration pollInterval}) {
    return QueryRef<T, U>(this, query);
  }

  MutationRef<T, U> mutation<T, U extends JsonSerializable>(
      GraphQLQuery<T, U> mutation) {
    return MutationRef<T, U>();
  }
}
