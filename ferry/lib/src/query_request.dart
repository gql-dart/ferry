import 'package:gql_exec/gql_exec.dart';

import './fetch_policy.dart';

abstract class QueryRequest<TData, TVars> {
  TVars get vars;

  Operation get operation;

  Request get execRequest;

  /// The unique identifier for this query.
  ///
  /// If the same [queryId] is passed to multiple [Query]s, it will be
  /// treated as a refetch of the same query. If an [updateResult] callback is
  /// passed, the results will be merged according to the callback.
  String get queryId;

  /// Optional function to update the result based on the previous result. Useful
  /// for pagination.
  TData Function(TData previousResult, TData result) get updateResult;

  /// The optimistic result, generally used when running a mutation
  TData get optimisticResponse;

  /// The key that maps to a [UpdateCacheHandler], defined on the client
  String get updateCacheHandlerKey;

  /// An arbitrary JSON object that can be used to pass data to the [UpdateCacheHandler]
  Map<String, dynamic> get updateCacheHandlerContext;

  /// The [FetchPolicy] to be used when executing this query
  FetchPolicy get fetchPolicy;

  /// Parses data into a concrete type for the given query
  ///
  /// This is a simple wrapper on the static fromJson method on the generated class.
  TData parseData(Map<String, dynamic> json);
}
