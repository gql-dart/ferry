// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:pokemon_explorer2/graphql/__generated__/all_pokemon.ast.gql.dart'
    as _i6;
import 'package:pokemon_explorer2/graphql/__generated__/all_pokemon.data.gql.dart'
    as _i2;
import 'package:pokemon_explorer2/graphql/__generated__/all_pokemon.var.gql.dart'
    as _i3;
import 'package:pokemon_explorer2/graphql/__generated__/pokemon_card_fragment.ast.gql.dart'
    as _i7;

class GAllPokemonReq
    implements _i1.OperationRequest<_i2.GAllPokemonData, _i3.GAllPokemonVars> {
  GAllPokemonReq({
    required this.vars,
    _i4.Operation? operation,
    this.requestId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.updateCacheHandlerContext,
    this.fetchPolicy,
    this.executeOnListen = true,
    this.context,
  }) : operation = operation ?? _operation;

  final _i3.GAllPokemonVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GAllPokemonData? Function(
    _i2.GAllPokemonData?,
    _i2.GAllPokemonData?,
  )? updateResult;

  final _i2.GAllPokemonData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.AllPokemon,
    _i7.PokemonCard,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'AllPokemon',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GAllPokemonData? parseData(Map<String, dynamic> json) =>
      _i2.GAllPokemonData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GAllPokemonData data) => data.toJson();

  _i1.OperationRequest<_i2.GAllPokemonData, _i3.GAllPokemonVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GAllPokemonReq(
      vars: vars,
      operation: transform(operation),
      requestId: requestId,
      updateResult: updateResult,
      optimisticResponse: optimisticResponse,
      updateCacheHandlerKey: updateCacheHandlerKey,
      updateCacheHandlerContext: updateCacheHandlerContext,
      fetchPolicy: fetchPolicy,
      executeOnListen: executeOnListen,
      context: context,
    );
  }
}
