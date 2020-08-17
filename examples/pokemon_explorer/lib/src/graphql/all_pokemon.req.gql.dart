// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:pokemon_explorer/serializers.gql.dart' as _i6;
import 'package:pokemon_explorer/src/graphql/all_pokemon.ast.gql.dart' as _i5;
import 'package:pokemon_explorer/src/graphql/all_pokemon.data.gql.dart' as _i2;
import 'package:pokemon_explorer/src/graphql/all_pokemon.var.gql.dart' as _i3;

part 'all_pokemon.req.gql.g.dart';

abstract class GAllPokemon
    implements
        Built<GAllPokemon, GAllPokemonBuilder>,
        _i1.OperationRequest<_i2.GAllPokemonData, _i3.GAllPokemonVars> {
  GAllPokemon._();

  factory GAllPokemon([Function(GAllPokemonBuilder b) updates]) = _$GAllPokemon;

  static void _initializeBuilder(GAllPokemonBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'AllPokemon');
  _i3.GAllPokemonVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GAllPokemonData Function(_i2.GAllPokemonData, _i2.GAllPokemonData)
      get updateResult;
  @nullable
  _i2.GAllPokemonData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GAllPokemonData parseData(Map<String, dynamic> json) =>
      _i2.GAllPokemonData.fromJson(json);
  static Serializer<GAllPokemon> get serializer => _$gAllPokemonSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GAllPokemon.serializer, this);
  static GAllPokemon fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAllPokemon.serializer, json);
}
