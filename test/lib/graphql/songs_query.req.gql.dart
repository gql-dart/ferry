import 'package:gql_client/gql_client.dart' as _i1;
import 'package:gql_client_test/graphql/songs_query.data.gql.dart' as _i2;
import 'package:gql_client_test/graphql/songs_query.var.gql.dart' as _i3;
import 'package:gql_client_test/graphql/songs_query.op.gql.dart' as _i4;
import 'package:uuid/uuid.dart' as _i5;

class SongsQuery extends _i1.QueryRequest<_i2.$SongsQuery> {
  SongsQuery(
      {_i3.SongsQueryVarBuilder Function(_i3.SongsQueryVarBuilder) buildVars,
      String queryId,
      _i2.$SongsQuery Function(_i2.$SongsQuery, _i2.$SongsQuery) updateResult,
      Map<String, dynamic> optimisticResponse,
      updateCacheHandlerKey,
      Map<String, dynamic> context,
      _i1.FetchPolicy fetchPolicy})
      : super(
            operation: _i4.SongsQuery,
            variables: buildVars != null
                ? buildVars(_i3.SongsQueryVarBuilder()).variables
                : {},
            queryId: queryId != null ? queryId : _i5.Uuid().v4(),
            updateResult: updateResult,
            optimisticResponse: optimisticResponse,
            updateCacheHandlerKey: updateCacheHandlerKey,
            context: context,
            fetchPolicy: fetchPolicy);

  _i2.$SongsQuery parseData(Map<String, dynamic> json) => _i2.$SongsQuery(json);
}
