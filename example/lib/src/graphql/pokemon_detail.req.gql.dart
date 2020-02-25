import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_example_flutter/src/graphql/pokemon_detail.data.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/graphql/pokemon_detail.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_example_flutter/src/graphql/pokemon_detail.op.gql.dart'
    as _i5;
import 'package:uuid/uuid.dart' as _i6;

class PokemonDetail extends _i1.QueryRequest<_i2.$PokemonDetail> {
  PokemonDetail(
      {_i3.PokemonDetailVarBuilder Function(_i3.PokemonDetailVarBuilder)
          buildVars,
      String queryId,
      _i2.$PokemonDetail Function(_i2.$PokemonDetail, _i2.$PokemonDetail)
          updateResult,
      Map<String, dynamic> optimisticResponse,
      updateCacheHandlerKey,
      Map<String, dynamic> updateCacheHandlerData,
      _i4.Context context,
      _i1.FetchPolicy fetchPolicy})
      : super(
            operation: _i5.PokemonDetail,
            variables: buildVars != null
                ? buildVars(_i3.PokemonDetailVarBuilder()).variables
                : const {},
            context: context != null ? context : const _i4.Context(),
            queryId: queryId != null ? queryId : _i6.Uuid().v4(),
            updateResult: updateResult,
            optimisticResponse: optimisticResponse,
            updateCacheHandlerKey: updateCacheHandlerKey,
            updateCacheHandlerData: updateCacheHandlerData,
            fetchPolicy: fetchPolicy);

  _i2.$PokemonDetail parseData(Map<String, dynamic> json) =>
      _i2.$PokemonDetail(json);
}
