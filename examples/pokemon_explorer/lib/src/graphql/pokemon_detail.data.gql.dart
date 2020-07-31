// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/serializers.gql.dart' as _i1;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.data.gql.dart'
    as _i2;

part 'pokemon_detail.data.gql.g.dart';

abstract class GPokemonDetailData
    implements Built<GPokemonDetailData, GPokemonDetailDataBuilder> {
  GPokemonDetailData._();

  factory GPokemonDetailData([Function(GPokemonDetailDataBuilder b) updates]) =
      _$GPokemonDetailData;

  @nullable
  GPokemonDetailData_pokemon get pokemon;
  static Serializer<GPokemonDetailData> get serializer =>
      _$gPokemonDetailDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonDetailData.serializer, this);
  static GPokemonDetailData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonDetailData.serializer, json);
}

abstract class GPokemonDetailData_pokemon
    implements
        Built<GPokemonDetailData_pokemon, GPokemonDetailData_pokemonBuilder>,
        _i2.GPokemonCard {
  GPokemonDetailData_pokemon._();

  factory GPokemonDetailData_pokemon(
          [Function(GPokemonDetailData_pokemonBuilder b) updates]) =
      _$GPokemonDetailData_pokemon;

  static void _initializeBuilder(GPokemonDetailData_pokemonBuilder b) =>
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
  @nullable
  GPokemonDetailData_pokemon_weight get weight;
  @nullable
  GPokemonDetailData_pokemon_height get height;
  static Serializer<GPokemonDetailData_pokemon> get serializer =>
      _$gPokemonDetailDataPokemonSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonDetailData_pokemon.serializer, this);
  static GPokemonDetailData_pokemon fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPokemonDetailData_pokemon.serializer, json);
}

abstract class GPokemonDetailData_pokemon_weight
    implements
        Built<GPokemonDetailData_pokemon_weight,
            GPokemonDetailData_pokemon_weightBuilder> {
  GPokemonDetailData_pokemon_weight._();

  factory GPokemonDetailData_pokemon_weight(
          [Function(GPokemonDetailData_pokemon_weightBuilder b) updates]) =
      _$GPokemonDetailData_pokemon_weight;

  static void _initializeBuilder(GPokemonDetailData_pokemon_weightBuilder b) =>
      b..G__typename = 'PokemonDimension';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GPokemonDetailData_pokemon_weight> get serializer =>
      _$gPokemonDetailDataPokemonWeightSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonDetailData_pokemon_weight.serializer, this);
  static GPokemonDetailData_pokemon_weight fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPokemonDetailData_pokemon_weight.serializer, json);
}

abstract class GPokemonDetailData_pokemon_height
    implements
        Built<GPokemonDetailData_pokemon_height,
            GPokemonDetailData_pokemon_heightBuilder> {
  GPokemonDetailData_pokemon_height._();

  factory GPokemonDetailData_pokemon_height(
          [Function(GPokemonDetailData_pokemon_heightBuilder b) updates]) =
      _$GPokemonDetailData_pokemon_height;

  static void _initializeBuilder(GPokemonDetailData_pokemon_heightBuilder b) =>
      b..G__typename = 'PokemonDimension';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GPokemonDetailData_pokemon_height> get serializer =>
      _$gPokemonDetailDataPokemonHeightSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonDetailData_pokemon_height.serializer, this);
  static GPokemonDetailData_pokemon_height fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPokemonDetailData_pokemon_height.serializer, json);
}
