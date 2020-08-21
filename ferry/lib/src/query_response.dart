import 'package:meta/meta.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';
import "package:collection/collection.dart";

import './query_request.dart';

enum DataSource {
  /// A placeholder response source which can be used when waiting for another source
  None,

  /// Data originated from the client's [Link]
  Link,

  /// Data originated from the [Cache]
  Cache,

  /// Data originated from a user-provided [QueryRequest.optimisticResponse]
  Optimistic,
}

/// Encapsulates a GraphQL query/mutation response, with typed
/// input and responses, and errors.
@immutable
class QueryResponse<TData, TVars> {
  /// The event that resulted in this response
  final QueryRequest<TData, TVars> queryRequest;

  /// The origin of the response.
  final DataSource dataSource;

  /// The typed data of this response.
  final TData data;

  /// The list of errors in this response.
  final List<GraphQLError> graphqlErrors;

  /// Any error returned by [Link]
  final LinkException linkException;

  // TODO: is there a better way to implement loading?
  bool get loading => linkException == null && data == null;

  /// If this response has any error.
  bool get hasErrors =>
      linkException != null ||
      (graphqlErrors != null && graphqlErrors.isNotEmpty);

  /// Instantiates a GraphQL response.
  const QueryResponse({
    @required this.queryRequest,
    @required this.dataSource,
    this.data,
    this.graphqlErrors,
    this.linkException,
  });

  List<Object> _getChildren() => [
        queryRequest,
        data,
        graphqlErrors,
        linkException,
      ];

  @override
  bool operator ==(Object o) =>
      o is QueryResponse &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}
