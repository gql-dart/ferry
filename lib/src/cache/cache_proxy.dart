import 'package:gql_exec/gql_exec.dart';
import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './cache.dart';

class CacheProxy {
  final Cache _cache;
  final bool _optimistic;
  final String _queryId;

  CacheProxy(
    Cache cache,
    bool optimistic,
    String queryId,
  )   : _cache = cache,
        _optimistic = optimistic,
        _queryId = queryId;

  Map<String, dynamic> readQuery(
    Request request, {
    bool optimistic,
  }) =>
      _cache.readQuery(request, optimistic: optimistic ?? false);

  Map<String, dynamic> readFragment({
    @required DocumentNode fragment,
    @required Map<String, dynamic> idFields,
    String fragmentName,
    Map<String, dynamic> variables,
    bool optimistic,
  }) =>
      _cache.readFragment(
        fragment: fragment,
        idFields: idFields,
        fragmentName: fragmentName,
        variables: variables,
        optimistic: optimistic ?? false,
      );

  void writeQuery(
    Request request,
    Map<String, dynamic> data, {
    String queryId,
  }) =>
      _cache.writeQuery(
        request,
        data,
        optimistic: _optimistic,
        queryId: queryId,
      );

  void writeFragment({
    @required DocumentNode fragment,
    @required Map<String, dynamic> idFields,
    @required Map<String, dynamic> data,
    String fragmentName,
    Map<String, dynamic> variables,
    String queryId,
  }) =>
      _cache.writeFragment(
        fragment: fragment,
        idFields: idFields,
        data: data,
        fragmentName: fragmentName,
        variables: variables,
        optimistic: _optimistic,
        queryId: queryId,
      );
}
