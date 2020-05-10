// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:ferry/ferry.dart' as _i1;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.data.gql.dart'
    as _i2;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.op.gql.dart' as _i5;

class PokemonDetail extends _i1.QueryRequest<_i2.$PokemonDetail> {
  factory PokemonDetail(
          {_i3.PokemonDetailVarBuilder Function(_i3.PokemonDetailVarBuilder)
              buildVars,
          String queryId,
          _i2.$PokemonDetail Function(_i2.$PokemonDetail, _i2.$PokemonDetail)
              updateResult,
          Map<String, dynamic> optimisticResponse,
          updateCacheHandlerKey,
          _i4.Context context,
          _i1.FetchPolicy fetchPolicy}) =>
      PokemonDetail._(
          operation: _i5.PokemonDetail,
          variables: buildVars != null
              ? buildVars(_i3.PokemonDetailVarBuilder()).variables
              : const {},
          context: context != null ? context : const _i4.Context(),
          queryId: queryId,
          updateResult: updateResult,
          optimisticResponse: optimisticResponse,
          updateCacheHandlerKey: updateCacheHandlerKey,
          fetchPolicy: fetchPolicy);

  PokemonDetail._(
      {_i4.Operation operation,
      Map<String, dynamic> variables,
      _i4.Context context,
      String queryId,
      _i2.$PokemonDetail Function(_i2.$PokemonDetail, _i2.$PokemonDetail)
          updateResult,
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
  _i2.$PokemonDetail parseData(Map<String, dynamic> json) =>
      _i2.$PokemonDetail(json);
  @override
  PokemonDetail copyWith(
          {_i4.Operation operation,
          Map<String, dynamic> variables,
          _i4.Context context,
          String queryId,
          _i2.$PokemonDetail Function(_i2.$PokemonDetail, _i2.$PokemonDetail)
              updateResult,
          Map<String, dynamic> optimisticResponse,
          String updateCacheHandlerKey,
          _i1.FetchPolicy fetchPolicy}) =>
      PokemonDetail._(
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
