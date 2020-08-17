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
  GPokemonDetailData_getPokemon get getPokemon;
  static Serializer<GPokemonDetailData> get serializer =>
      _$gPokemonDetailDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonDetailData.serializer, this);
  static GPokemonDetailData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonDetailData.serializer, json);
}

abstract class GPokemonDetailData_getPokemon
    implements
        Built<GPokemonDetailData_getPokemon,
            GPokemonDetailData_getPokemonBuilder>,
        _i2.GPokemonCard {
  GPokemonDetailData_getPokemon._();

  factory GPokemonDetailData_getPokemon(
          [Function(GPokemonDetailData_getPokemonBuilder b) updates]) =
      _$GPokemonDetailData_getPokemon;

  static void _initializeBuilder(GPokemonDetailData_getPokemonBuilder b) =>
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
  GPokemonDetailData_getPokemon_weight get weight;
  @nullable
  GPokemonDetailData_getPokemon_height get height;
  static Serializer<GPokemonDetailData_getPokemon> get serializer =>
      _$gPokemonDetailDataGetPokemonSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonDetailData_getPokemon.serializer, this);
  static GPokemonDetailData_getPokemon fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPokemonDetailData_getPokemon.serializer, json);
}

abstract class GPokemonDetailData_getPokemon_weight
    implements
        Built<GPokemonDetailData_getPokemon_weight,
            GPokemonDetailData_getPokemon_weightBuilder> {
  GPokemonDetailData_getPokemon_weight._();

  factory GPokemonDetailData_getPokemon_weight(
          [Function(GPokemonDetailData_getPokemon_weightBuilder b) updates]) =
      _$GPokemonDetailData_getPokemon_weight;

  static void _initializeBuilder(
          GPokemonDetailData_getPokemon_weightBuilder b) =>
      b..G__typename = 'PokemonDimension';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GPokemonDetailData_getPokemon_weight> get serializer =>
      _$gPokemonDetailDataGetPokemonWeightSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonDetailData_getPokemon_weight.serializer, this);
  static GPokemonDetailData_getPokemon_weight fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GPokemonDetailData_getPokemon_weight.serializer, json);
}

abstract class GPokemonDetailData_getPokemon_height
    implements
        Built<GPokemonDetailData_getPokemon_height,
            GPokemonDetailData_getPokemon_heightBuilder> {
  GPokemonDetailData_getPokemon_height._();

  factory GPokemonDetailData_getPokemon_height(
          [Function(GPokemonDetailData_getPokemon_heightBuilder b) updates]) =
      _$GPokemonDetailData_getPokemon_height;

  static void _initializeBuilder(
          GPokemonDetailData_getPokemon_heightBuilder b) =>
      b..G__typename = 'PokemonDimension';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GPokemonDetailData_getPokemon_height> get serializer =>
      _$gPokemonDetailDataGetPokemonHeightSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonDetailData_getPokemon_height.serializer, this);
  static GPokemonDetailData_getPokemon_height fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GPokemonDetailData_getPokemon_height.serializer, json);
}
