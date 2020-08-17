// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/serializers.gql.dart' as _i1;

part 'pokemon_card_fragment.data.gql.g.dart';

abstract class GNestedFragment {
  String get G__typename;
  String get id;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GNestedFragmentData
    implements
        Built<GNestedFragmentData, GNestedFragmentDataBuilder>,
        GNestedFragment {
  GNestedFragmentData._();

  factory GNestedFragmentData(
      [Function(GNestedFragmentDataBuilder b) updates]) = _$GNestedFragmentData;

  static void _initializeBuilder(GNestedFragmentDataBuilder b) =>
      b..G__typename = 'Pokemon';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  @nullable
  String get name;
  static Serializer<GNestedFragmentData> get serializer =>
      _$gNestedFragmentDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GNestedFragmentData.serializer, this);
  static GNestedFragmentData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GNestedFragmentData.serializer, json);
}

abstract class GPokemonCard implements GNestedFragment {
  String get G__typename;
  String get id;
  String get name;
  int get maxHP;
  String get image;
  Map<String, dynamic> toJson();
}

abstract class GPokemonCardData
    implements
        Built<GPokemonCardData, GPokemonCardDataBuilder>,
        GPokemonCard,
        GNestedFragment {
  GPokemonCardData._();

  factory GPokemonCardData([Function(GPokemonCardDataBuilder b) updates]) =
      _$GPokemonCardData;

  static void _initializeBuilder(GPokemonCardDataBuilder b) =>
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
  static Serializer<GPokemonCardData> get serializer =>
      _$gPokemonCardDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonCardData.serializer, this);
  static GPokemonCardData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonCardData.serializer, json);
}
