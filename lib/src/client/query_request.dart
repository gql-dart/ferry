import 'package:gql_exec/gql_exec.dart';
import "package:collection/collection.dart";

import './fetch_policy.dart';

abstract class QueryRequest<T> implements Request {
  const QueryRequest({
    this.operation,
    this.variables,
    this.context,
    this.queryId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.fetchPolicy,
  });

  // Request API

  final Operation operation;

  final Map<String, dynamic> variables;

  final Context context;

  QueryRequest<T> withContextEntry<TEntry extends ContextEntry>(TEntry entry) =>
      this.copyWith(context: context.withEntry(entry));

  QueryRequest<T> updateContextEntry<TEntry extends ContextEntry>(
    ContextUpdater<TEntry> update,
  ) =>
      this.copyWith(context: context.updateEntry(update));

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

  // Additional members

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
  final String updateCacheHandlerKey;

  /// The [FetchPolicy] to be used when executing this query
  final FetchPolicy fetchPolicy;

  /// Parses data into a concrete type for the given query
  T parseData(Map<String, dynamic> json);

  /// Copies this [QueryRequest], altering the members passed in
  QueryRequest copyWith({
    Operation operation,
    Map<String, dynamic> variables,
    Context context,
    String queryId,
    T Function(T previousResult, T result) updateResult,
    Map<String, dynamic> optimisticResponse,
    String updateCacheHandlerKey,
    FetchPolicy fetchPolicy,
  });

  // TODO: add toJson / fromJson here and to req_builder
}
