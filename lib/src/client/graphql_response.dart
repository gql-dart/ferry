import 'package:meta/meta.dart';
import 'package:gql/execution.dart';
import 'package:json_annotation/json_annotation.dart';

import './query_event.dart';

/// Encapsulates a GraphQL query/mutation response, with typed
/// input and responses, and errors.
@immutable
class GraphQLResponse<T, TVariables extends JsonSerializable> {
  /// The event that resulted in this response
  final QueryEvent<T, TVariables> triggeringEvent;

  /// Whether or not the result is derived from an optimistic response
  final bool optimistic;

  /// The typed data of this response.
  final T data;

  /// The list of errors in this response.
  final List<GraphQLError> errors;

  /// If this response has any error.
  bool get hasErrors => errors != null && errors.isNotEmpty;

  /// Instantiates a GraphQL response.
  const GraphQLResponse({
    @required this.triggeringEvent,
    this.optimistic = false,
    this.data,
    this.errors,
  });

  /// Creates a shallow copy
  GraphQLResponse.from(GraphQLResponse response)
      : triggeringEvent = response.triggeringEvent,
        optimistic = response.optimistic,
        data = response.data,
        errors = response.errors;
}
