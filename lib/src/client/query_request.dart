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
      this.context,
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

  /// Optional function to update the result based on the previous result. Useful
  /// for pagination.
  final T Function(T previousResult, T result) updateResult;

  /// The optimistic result, generally used when running a mutation
  final Map<String, dynamic> optimisticResponse;

  /// The key that maps to a [UpdateCacheHandler], defined on the client
  final dynamic updateCacheHandlerKey;

  /// An arbitrary object (must be JSON serializable) to pass data that can be
  /// used in [UpdateCacheHandler]s or [updateResult].
  final Map<String, dynamic> context;

  final FetchPolicy fetchPolicy;

  T parseData(Map<String, dynamic> json);

  // TODO: add toJson / fromJson here and to req_builder
}
