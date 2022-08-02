// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/__generated__/serializers.gql.dart' as _i1;
import 'package:pokemon_explorer/src/graphql/__generated__/pokemon_card_fragment.data.gql.dart'
    as _i2;

part 'all_pokemon.data.gql.g.dart';

abstract class GAllPokemonData
    implements Built<GAllPokemonData, GAllPokemonDataBuilder> {
  GAllPokemonData._();

  factory GAllPokemonData([Function(GAllPokemonDataBuilder b) updates]) =
      _$GAllPokemonData;

  static void _initializeBuilder(GAllPokemonDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAllPokemonData_pokemons? get pokemons;
  static Serializer<GAllPokemonData> get serializer =>
      _$gAllPokemonDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAllPokemonData.serializer, this)
          as Map<String, dynamic>);
  static GAllPokemonData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAllPokemonData.serializer, json);
}

abstract class GAllPokemonData_pokemons
    implements
        Built<GAllPokemonData_pokemons, GAllPokemonData_pokemonsBuilder> {
  GAllPokemonData_pokemons._();

  factory GAllPokemonData_pokemons(
          [Function(GAllPokemonData_pokemonsBuilder b) updates]) =
      _$GAllPokemonData_pokemons;

  static void _initializeBuilder(GAllPokemonData_pokemonsBuilder b) =>
      b..G__typename = 'PokemonList';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAllPokemonData_pokemons_results>? get results;
  static Serializer<GAllPokemonData_pokemons> get serializer =>
      _$gAllPokemonDataPokemonsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAllPokemonData_pokemons.serializer, this)
          as Map<String, dynamic>);
  static GAllPokemonData_pokemons? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAllPokemonData_pokemons.serializer, json);
}

abstract class GAllPokemonData_pokemons_results
    implements
        Built<GAllPokemonData_pokemons_results,
            GAllPokemonData_pokemons_resultsBuilder>,
        _i2.GPokemonCard {
  GAllPokemonData_pokemons_results._();

  factory GAllPokemonData_pokemons_results(
          [Function(GAllPokemonData_pokemons_resultsBuilder b) updates]) =
      _$GAllPokemonData_pokemons_results;

  static void _initializeBuilder(GAllPokemonData_pokemons_resultsBuilder b) =>
      b..G__typename = 'Pokemon';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get id;
  @override
  String get name;
  @override
  String get avatar;
  @override
  GAllPokemonData_pokemons_results_height? get height;
  @override
  GAllPokemonData_pokemons_results_weight? get weight;
  static Serializer<GAllPokemonData_pokemons_results> get serializer =>
      _$gAllPokemonDataPokemonsResultsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAllPokemonData_pokemons_results.serializer, this)
      as Map<String, dynamic>);
  static GAllPokemonData_pokemons_results? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAllPokemonData_pokemons_results.serializer, json);
}

abstract class GAllPokemonData_pokemons_results_height
    implements
        Built<GAllPokemonData_pokemons_results_height,
            GAllPokemonData_pokemons_results_heightBuilder>,
        _i2.GPokemonCard_height {
  GAllPokemonData_pokemons_results_height._();

  factory GAllPokemonData_pokemons_results_height(
      [Function(GAllPokemonData_pokemons_results_heightBuilder b)
          updates]) = _$GAllPokemonData_pokemons_results_height;

  static void _initializeBuilder(
          GAllPokemonData_pokemons_results_heightBuilder b) =>
      b..G__typename = 'Height';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get in_meter;
  static Serializer<GAllPokemonData_pokemons_results_height> get serializer =>
      _$gAllPokemonDataPokemonsResultsHeightSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAllPokemonData_pokemons_results_height.serializer, this)
      as Map<String, dynamic>);
  static GAllPokemonData_pokemons_results_height? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAllPokemonData_pokemons_results_height.serializer, json);
}

abstract class GAllPokemonData_pokemons_results_weight
    implements
        Built<GAllPokemonData_pokemons_results_weight,
            GAllPokemonData_pokemons_results_weightBuilder>,
        _i2.GPokemonCard_weight {
  GAllPokemonData_pokemons_results_weight._();

  factory GAllPokemonData_pokemons_results_weight(
      [Function(GAllPokemonData_pokemons_results_weightBuilder b)
          updates]) = _$GAllPokemonData_pokemons_results_weight;

  static void _initializeBuilder(
          GAllPokemonData_pokemons_results_weightBuilder b) =>
      b..G__typename = 'Weight';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get in_kg;
  static Serializer<GAllPokemonData_pokemons_results_weight> get serializer =>
      _$gAllPokemonDataPokemonsResultsWeightSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAllPokemonData_pokemons_results_weight.serializer, this)
      as Map<String, dynamic>);
  static GAllPokemonData_pokemons_results_weight? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAllPokemonData_pokemons_results_weight.serializer, json);
}
