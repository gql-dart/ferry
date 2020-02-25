import 'package:gql_exec/gql_exec.dart';
import "package:collection/collection.dart";

import './fetch_policy.dart';

abstract class QueryRequest<T> implements Request {
  QueryRequest({
    this.operation,
    this.variables,
    this.context,
    this.queryId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.updateCacheHandlerData,
    this.fetchPolicy,
  });

  Operation operation;

  final Map<String, dynamic> variables;

  final Context context;

  /// The unique identifier for this query.
  ///
  /// If the same [queryId] is passed to multiple [Query]s, it will be
  /// treated as a refetch of the same query. If an [updateResult] callback is
  /// passed, the results will be merged according to the callback.
  final String queryId;

  /// Optional function to update the result based on the previous result. Useful
  /// for pagination.
  final T Function(T previousResult, T result) updateResult;

  /// The optimistic result, generally used when running a mutation
  final Map<String, dynamic> optimisticResponse;

  /// The key that maps to a [UpdateCacheHandler], defined on the client
  final dynamic updateCacheHandlerKey;

  /// An arbitrary object (must be JSON serializable) to pass data that can be
  /// used in [UpdateCacheHandler]s.
  final Map<String, dynamic> updateCacheHandlerData;

  final FetchPolicy fetchPolicy;

  T parseData(Map<String, dynamic> json);

  /// Clone this request adding an [entry] to [context]
  Request withContextEntry<T extends ContextEntry>(T entry) => Request(
        operation: operation,
        context: context.withEntry<T>(entry),
      );

  /// Clone this request updating an [entry] in the [context]
  Request updateContextEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      Request(
        operation: operation,
        context: context.updateEntry<T>(update),
      );

  List<Object> _getChildren() => [
        operation,
        variables,
        context,
        queryId,
      ];

  @override
  bool operator ==(Object o) =>
      o is QueryRequest &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );

  // TODO: add toJson / fromJson here and to req_builder
}
