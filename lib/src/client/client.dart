import 'dart:async';
import 'package:gql/ast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:artemis/schema/graphql_response.dart';

class MutationRef<T, U extends JsonSerializable> {
  Future<GraphQLResponse<T>> run;
}

class QueryRef<T, U extends JsonSerializable> {
  Stream<GraphQLResponse<T>> get stream {}
  Future<GraphQLResponse<T>> get future {
    return stream.first;
  }

  Future<GraphQLResponse<T>> refetch([U variables]) {}
  Future<GraphQLResponse<T>> fetchMore(
      {DocumentNode document,
      U variables,
      T Function(T previousResult, T result) updateQuery}) {}
  void startPolling(Duration pollInterval) {}
  void stopPolling() {}
}

class QueryOptions {
  final Duration pollInterval;

  QueryOptions({this.pollInterval});
}

class ClientOperation {
  final String id;
  final GraphQLQuery query;

  ClientOperation({this.id, this.query});
}

class Client {
  final PublishSubject<ClientOperation> _operationStream = PublishSubject();

  // TODO: use UUID - counter won't work offline
  int _queryIdCounter = 1;
  String _generateId() {
    return (_queryIdCounter++).toString();
  }

  QueryRef<T, U> query<T, U extends JsonSerializable>(GraphQLQuery<T, U> query,
      [QueryOptions options]) {
    final id = _generateId();
    // TODO: create the stream
    final operation = _operationStream.where((operation) => operation.id == id);
    _operationStream.add(ClientOperation(id: id, query: query));
    return operation;
    return QueryRef<T, U>();
  }

  MutationRef<T, U> mutation<T, U extends JsonSerializable>(
      GraphQLQuery<T, U> mutation) {
    return MutationRef<T, U>();
  }
}
