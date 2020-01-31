import 'package:gql_exec/gql_exec.dart';
import './fetch_policy.dart';

abstract class QueryRequest<T> {
  QueryRequest(
      {this.operation,
      this.variables,
      this.queryId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheContext,
      this.fetchPolicy});

  /// The unique identifier for this query.
  ///
  /// If the same [queryId] is passed to multiple [Query]s, it will be
  /// treated as a refetch of the same query. If an [updateResult] callback is
  /// passed, the results will be merged according to the callback.
  final String queryId;

  /// The GraphQL Query, Mutation, or Subscription to execute.
  Operation operation;

  final Map<String, dynamic> variables;

  // QUERY OPTIONS

  /// Optional function to update the result based on the previous result. Useful
  /// for pagination.
  final T Function(T previousResult, T result) updateResult;

  /// The optimistic result, generally used when running a mutation
  final Map<String, dynamic> optimisticResponse;

  /// The key that maps to a [UpdateCacheHandler], defined on the client
  final dynamic updateCacheHandlerKey;

  /// Object that gets passed This object gets passed as a parameter to [UpdateFunctionHandler] and [UpdateResultHandler].
  final Map<String, dynamic> updateCacheContext;

  final FetchPolicy fetchPolicy;

  T parseData(Map<String, dynamic> json);
}
