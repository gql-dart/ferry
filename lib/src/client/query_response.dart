import 'package:meta/meta.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:collection/collection.dart";

import './query_request.dart';

enum ResponseSource {
  /// A placeholder response source which can be used when waiting for another source
  None,

  /// Response originated from the client [Link]
  Network,

  /// Response originated from the [Cache]
  Cache,

  /// Response originated from the [QueryRequest.optimisticResponse]
  Optimistic,
}

/// Encapsulates a GraphQL query/mutation response, with typed
/// input and responses, and errors.
@immutable
class QueryResponse<T> {
  /// The event that resulted in this response
  final QueryRequest<T> queryRequest;

  /// The origin of the response.
  final ResponseSource source;

  /// The typed data of this response.
  final T data;

  /// The list of errors in this response.
  final List<GraphQLError> graphqlErrors;

  /// Any error returned by [Link]
  final Object networkError;

  // TODO: is there a better way to implement loading?
  bool get loading => networkError == null && data == null;

  /// If this response has any error.
  bool get hasErrors =>
      networkError != null && graphqlErrors != null && graphqlErrors.isNotEmpty;

  /// Instantiates a GraphQL response.
  const QueryResponse({
    @required this.queryRequest,
    @required this.source,
    this.data,
    this.graphqlErrors,
    this.networkError,
  });

  List<Object> _getChildren() => [
        queryRequest,
        data,
        graphqlErrors,
        networkError,
      ];

  @override
  bool operator ==(Object o) =>
      o is QueryResponse &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );

  /// Creates a shallow copy
  QueryResponse.from(QueryResponse response)
      : queryRequest = response.queryRequest,
        source = response.source,
        data = response.data,
        graphqlErrors = response.graphqlErrors,
        networkError = response.networkError;
}
