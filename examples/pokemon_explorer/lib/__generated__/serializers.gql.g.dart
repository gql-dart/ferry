// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAllPokemonData.serializer)
      ..add(GAllPokemonData_pokemons.serializer)
      ..add(GAllPokemonData_pokemons_results.serializer)
      ..add(GAllPokemonData_pokemons_results_height.serializer)
      ..add(GAllPokemonData_pokemons_results_weight.serializer)
      ..add(GAllPokemonReq.serializer)
      ..add(GAllPokemonVars.serializer)
      ..add(GCacheControlScope.serializer)
      ..add(GNestedFragmentData.serializer)
      ..add(GNestedFragmentReq.serializer)
      ..add(GNestedFragmentVars.serializer)
      ..add(GPokemonCardData.serializer)
      ..add(GPokemonCardData_height.serializer)
      ..add(GPokemonCardData_weight.serializer)
      ..add(GPokemonCardReq.serializer)
      ..add(GPokemonCardVars.serializer)
      ..add(GPokemonDetailData.serializer)
      ..add(GPokemonDetailData_pokemon.serializer)
      ..add(GPokemonDetailData_pokemon_height.serializer)
      ..add(GPokemonDetailData_pokemon_stats.serializer)
      ..add(GPokemonDetailData_pokemon_weight.serializer)
      ..add(GPokemonDetailReq.serializer)
      ..add(GPokemonDetailVars.serializer)
      ..add(GUpload.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GAllPokemonData_pokemons_results)
          ]),
          () => new ListBuilder<GAllPokemonData_pokemons_results?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GPokemonDetailData_pokemon_stats)
          ]),
          () => new ListBuilder<GPokemonDetailData_pokemon_stats?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
