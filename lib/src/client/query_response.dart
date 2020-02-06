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
  final List<GraphQLError> errors;

  // TODO: is there a better way to implement loading?
  bool get loading => errors == null && data == null;

  /// If this response has any error.
  bool get hasErrors => errors != null && errors.isNotEmpty;

  /// Instantiates a GraphQL response.
  const QueryResponse({
    @required this.queryRequest,
    this.optimistic = false,
    this.data,
    this.errors,
  });

  /// Creates a shallow copy
  QueryResponse.from(QueryResponse response)
      : queryRequest = response.queryRequest,
        optimistic = response.optimistic,
        data = response.data,
        errors = response.errors;
}
