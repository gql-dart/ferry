import 'package:meta/meta.dart';
import 'package:gql_exec/gql_exec.dart';

import './query_request.dart';

/// Encapsulates a GraphQL query/mutation response, with typed
/// input and responses, and errors.
@immutable
class QueryResponse<T> {
  /// The event that resulted in this response
  final QueryRequest<T> queryRequest;

  /// Whether or not the result is derived from an optimistic response
  final bool optimistic;

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
    this.optimistic = false,
    this.data,
    this.graphqlErrors,
    this.networkError,
  });

  /// Creates a shallow copy
  QueryResponse.from(QueryResponse response)
      : queryRequest = response.queryRequest,
        optimistic = response.optimistic,
        data = response.data,
        graphqlErrors = response.graphqlErrors,
        networkError = response.networkError;
}
