import 'package:gql_client/gql_client.dart' as _i1;
import 'package:gql_example_flutter/src/graphql/pokemon_detail.data.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/graphql/pokemon_detail.var.gql.dart'
    as _i3;
import 'package:gql_example_flutter/src/graphql/pokemon_detail.op.gql.dart'
    as _i4;
import 'package:uuid/uuid.dart' as _i5;

class PokemonDetail extends _i1.QueryRequest<_i2.$PokemonDetail> {
  PokemonDetail(
      {_i3.PokemonDetailVarBuilder Function(_i3.PokemonDetailVarBuilder)
          buildVars,
      String queryId,
      _i2.$PokemonDetail Function(_i2.$PokemonDetail, _i2.$PokemonDetail)
          updateResult,
      Map<String, dynamic> optimisticResponse,
      updateCacheHandlerKey,
      Map<String, dynamic> context,
      _i1.FetchPolicy fetchPolicy})
      : super(
            operation: _i4.PokemonDetail,
            variables: buildVars != null
                ? buildVars(_i3.PokemonDetailVarBuilder()).variables
                : {},
            queryId: queryId != null ? queryId : _i5.Uuid().v4(),
            updateResult: updateResult,
            optimisticResponse: optimisticResponse,
            updateCacheHandlerKey: updateCacheHandlerKey,
            context: context,
            fetchPolicy: fetchPolicy);

  _i2.$PokemonDetail parseData(Map<String, dynamic> json) =>
      _i2.$PokemonDetail(json);
}
