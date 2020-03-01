import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_example_flutter/src/graphql/all_pokemon.data.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/graphql/all_pokemon.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_example_flutter/src/graphql/all_pokemon.op.gql.dart' as _i5;

class AllPokemon extends _i1.QueryRequest<_i2.$AllPokemon> {
  factory AllPokemon(
          {_i3.AllPokemonVarBuilder Function(_i3.AllPokemonVarBuilder)
              buildVars,
          String queryId,
          _i2.$AllPokemon Function(_i2.$AllPokemon, _i2.$AllPokemon)
              updateResult,
          Map<String, dynamic> optimisticResponse,
          updateCacheHandlerKey,
          _i4.Context context,
          _i1.FetchPolicy fetchPolicy}) =>
      AllPokemon._(
          operation: _i5.AllPokemon,
          variables: buildVars != null
              ? buildVars(_i3.AllPokemonVarBuilder()).variables
              : const {},
          context: context != null ? context : const _i4.Context(),
          queryId: queryId,
          updateResult: updateResult,
          optimisticResponse: optimisticResponse,
          updateCacheHandlerKey: updateCacheHandlerKey,
          fetchPolicy: fetchPolicy);

  AllPokemon._(
      {_i4.Operation operation,
      Map<String, dynamic> variables,
      _i4.Context context,
      String queryId,
      _i2.$AllPokemon Function(_i2.$AllPokemon, _i2.$AllPokemon) updateResult,
      Map<String, dynamic> optimisticResponse,
      String updateCacheHandlerKey,
      _i1.FetchPolicy fetchPolicy})
      : super(
            operation: operation,
            variables: variables,
            context: context,
            queryId: queryId,
            updateResult: updateResult,
            optimisticResponse: optimisticResponse,
            updateCacheHandlerKey: updateCacheHandlerKey,
            fetchPolicy: fetchPolicy);

  @override
  _i2.$AllPokemon parseData(Map<String, dynamic> json) => _i2.$AllPokemon(json);
  @override
  AllPokemon copyWith(
          {_i4.Operation operation,
          Map<String, dynamic> variables,
          _i4.Context context,
          String queryId,
          _i2.$AllPokemon Function(_i2.$AllPokemon, _i2.$AllPokemon)
              updateResult,
          Map<String, dynamic> optimisticResponse,
          String updateCacheHandlerKey,
          _i1.FetchPolicy fetchPolicy}) =>
      AllPokemon._(
          operation: operation ?? this.operation,
          variables: variables ?? this.variables,
          context: context ?? this.context,
          queryId: queryId ?? this.queryId,
          updateResult: updateResult ?? this.updateResult,
          optimisticResponse: optimisticResponse ?? this.optimisticResponse,
          updateCacheHandlerKey:
              updateCacheHandlerKey ?? this.updateCacheHandlerKey,
          fetchPolicy: fetchPolicy ?? this.fetchPolicy);
}
