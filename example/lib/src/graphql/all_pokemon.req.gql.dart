import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_example_flutter/src/graphql/all_pokemon.data.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/graphql/all_pokemon.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_example_flutter/src/graphql/all_pokemon.op.gql.dart' as _i5;
import 'package:uuid/uuid.dart' as _i6;

class AllPokemon extends _i1.QueryRequest<_i2.$AllPokemon> {
  AllPokemon(
      {_i3.AllPokemonVarBuilder Function(_i3.AllPokemonVarBuilder) buildVars,
      String queryId,
      _i2.$AllPokemon Function(_i2.$AllPokemon, _i2.$AllPokemon) updateResult,
      Map<String, dynamic> optimisticResponse,
      updateCacheHandlerKey,
      Map<String, dynamic> updateCacheHandlerData,
      _i4.Context context,
      _i1.FetchPolicy fetchPolicy})
      : super(
            operation: _i5.AllPokemon,
            variables: buildVars != null
                ? buildVars(_i3.AllPokemonVarBuilder()).variables
                : const {},
            context: context != null ? context : const _i4.Context(),
            queryId: queryId != null ? queryId : _i6.Uuid().v4(),
            updateResult: updateResult,
            optimisticResponse: optimisticResponse,
            updateCacheHandlerKey: updateCacheHandlerKey,
            updateCacheHandlerData: updateCacheHandlerData,
            fetchPolicy: fetchPolicy);

  _i2.$AllPokemon parseData(Map<String, dynamic> json) => _i2.$AllPokemon(json);
}
