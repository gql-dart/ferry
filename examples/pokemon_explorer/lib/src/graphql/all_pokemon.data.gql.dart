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
  BuiltList<GAllPokemonData_queryPokemon> get queryPokemon;
  static Serializer<GAllPokemonData> get serializer =>
      _$gAllPokemonDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAllPokemonData.serializer, this);
  static GAllPokemonData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAllPokemonData.serializer, json);
}

abstract class GAllPokemonData_queryPokemon
    implements
        Built<GAllPokemonData_queryPokemon,
            GAllPokemonData_queryPokemonBuilder>,
        _i2.GPokemonCard {
  GAllPokemonData_queryPokemon._();

  factory GAllPokemonData_queryPokemon(
          [Function(GAllPokemonData_queryPokemonBuilder b) updates]) =
      _$GAllPokemonData_queryPokemon;

  static void _initializeBuilder(GAllPokemonData_queryPokemonBuilder b) =>
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
  static Serializer<GAllPokemonData_queryPokemon> get serializer =>
      _$gAllPokemonDataQueryPokemonSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GAllPokemonData_queryPokemon.serializer, this);
  static GAllPokemonData_queryPokemon fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAllPokemonData_queryPokemon.serializer, json);
}
