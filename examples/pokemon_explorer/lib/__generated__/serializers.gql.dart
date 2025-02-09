// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;
import 'package:pokemon_explorer/__generated__/schema.schema.gql.dart'
    show GCacheControlScope, GUpload;
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.data.gql.dart'
    show
        GAllPokemonData,
        GAllPokemonData_pokemons,
        GAllPokemonData_pokemons_results,
        GAllPokemonData_pokemons_results_height,
        GAllPokemonData_pokemons_results_weight;
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.req.gql.dart'
    show GAllPokemonReq;
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.var.gql.dart'
    show GAllPokemonVars;
import 'package:pokemon_explorer/src/graphql/__generated__/pokemon_card_fragment.data.gql.dart'
    show
        GNestedFragmentData,
        GPokemonCardData,
        GPokemonCardData_height,
        GPokemonCardData_weight;
import 'package:pokemon_explorer/src/graphql/__generated__/pokemon_card_fragment.req.gql.dart'
    show GNestedFragmentReq, GPokemonCardReq;
import 'package:pokemon_explorer/src/graphql/__generated__/pokemon_card_fragment.var.gql.dart'
    show GNestedFragmentVars, GPokemonCardVars;
import 'package:pokemon_explorer/src/graphql/__generated__/pokemon_detail.data.gql.dart'
    show
        GPokemonDetailData,
        GPokemonDetailData_pokemon,
        GPokemonDetailData_pokemon_height,
        GPokemonDetailData_pokemon_stats,
        GPokemonDetailData_pokemon_weight;
import 'package:pokemon_explorer/src/graphql/__generated__/pokemon_detail.req.gql.dart'
    show GPokemonDetailReq;
import 'package:pokemon_explorer/src/graphql/__generated__/pokemon_detail.var.gql.dart'
    show GPokemonDetailVars;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAllPokemonData,
  GAllPokemonData_pokemons,
  GAllPokemonData_pokemons_results,
  GAllPokemonData_pokemons_results_height,
  GAllPokemonData_pokemons_results_weight,
  GAllPokemonReq,
  GAllPokemonVars,
  GCacheControlScope,
  GNestedFragmentData,
  GNestedFragmentReq,
  GNestedFragmentVars,
  GPokemonCardData,
  GPokemonCardData_height,
  GPokemonCardData_weight,
  GPokemonCardReq,
  GPokemonCardVars,
  GPokemonDetailData,
  GPokemonDetailData_pokemon,
  GPokemonDetailData_pokemon_height,
  GPokemonDetailData_pokemon_stats,
  GPokemonDetailData_pokemon_weight,
  GPokemonDetailReq,
  GPokemonDetailVars,
  GUpload,
])
final Serializers serializers = _serializersBuilder.build();
