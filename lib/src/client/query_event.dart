import 'package:meta/meta.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:gql/execution.dart';

import './gql_response.dart';

class QueryEvent<T, TVariables extends JsonSerializable> {
  final GraphQLQuery query;
  final Context context;

  /// The optimistic result, generally used when running a mutation
  final Map<String, Object> optimisticResponse;

  /// Customize how the query response is merged into the cache. Useful
  /// when merging mutation results that add items to a list, etc.
  /// Note: if a callback is provided, `updateCache`
  /// is also run immediately with the `optimisticResponse`.
  final void Function(dynamic proxy, GraphQLResponse<T, TVariables> response)
      updateCache;

  /// Optional function to update the result based on the previous result. Useful
  /// for pagination.
  final T Function(T previousResult, T result) updateResult;

  QueryEvent(
      {this.query,
      this.context,
      this.optimisticResponse,
      this.updateCache,
      this.updateResult});
}
