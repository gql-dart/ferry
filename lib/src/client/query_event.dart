import 'package:meta/meta.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
class QueryEvent<T, TVariables extends JsonSerializable> {
  /// The unique identifier of the originating `QueryRef`.
  final String refId;

  /// The GraphQL Query, Mutation, or Subscription to execute.
  final GraphQLQuery<T, TVariables> query;

  /// Optional function to update the result based on the previous result. Useful
  /// for pagination.
  final T Function(T previousResult, T result) updateResult;

  /// The optimistic result, generally used when running a mutation
  final Map<String, Object> optimisticResponse;

  /// The key that maps to a `UpdateCacheHandler`, defined on the client
  final dynamic updateCacheHandlerKey;

  /// Object that gets passed This object gets passed as a parameter to `UpdateFunctionHandler` and `UpdateResultHandler`.
  final Map<String, dynamic> updateHandlerContext;

  QueryEvent({
    this.refId,
    this.query,
    this.updateResult,
    this.updateHandlerContext,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
  });
}
