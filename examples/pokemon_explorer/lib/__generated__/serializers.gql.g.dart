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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
