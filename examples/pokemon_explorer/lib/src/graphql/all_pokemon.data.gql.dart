// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/serializers.gql.dart' as _i1;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.data.gql.dart'
    as _i2;

part 'all_pokemon.data.gql.g.dart';

abstract class GAllPokemonData
    implements Built<GAllPokemonData, GAllPokemonDataBuilder> {
  GAllPokemonData._();

  factory GAllPokemonData([Function(GAllPokemonDataBuilder b) updates]) =
      _$GAllPokemonData;

  @nullable
  BuiltList<GAllPokemonData_pokemons> get pokemons;
  static Serializer<GAllPokemonData> get serializer =>
      _$gAllPokemonDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAllPokemonData.serializer, this);
  static GAllPokemonData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAllPokemonData.serializer, json);
}

abstract class GAllPokemonData_pokemons
    implements
        Built<GAllPokemonData_pokemons, GAllPokemonData_pokemonsBuilder>,
        _i2.GPokemonCard {
  GAllPokemonData_pokemons._();

  factory GAllPokemonData_pokemons(
          [Function(GAllPokemonData_pokemonsBuilder b) updates]) =
      _$GAllPokemonData_pokemons;

  static void _initializeBuilder(GAllPokemonData_pokemonsBuilder b) =>
      b..G__typename = 'Pokemon';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  static Serializer<GAllPokemonData_pokemons> get serializer =>
      _$gAllPokemonDataPokemonsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAllPokemonData_pokemons.serializer, this);
  static GAllPokemonData_pokemons fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAllPokemonData_pokemons.serializer, json);
}
