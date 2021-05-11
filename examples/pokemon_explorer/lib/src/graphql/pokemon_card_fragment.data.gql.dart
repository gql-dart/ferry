// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/serializers.gql.dart' as _i1;

part 'pokemon_card_fragment.data.gql.g.dart';

abstract class GNestedFragment {
  String get G__typename;
  int get id;
  String get name;
  String get avatar;
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
  int get id;
  String get name;
  String get avatar;
  static Serializer<GNestedFragmentData> get serializer =>
      _$gNestedFragmentDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GNestedFragmentData.serializer, this)
          as Map<String, dynamic>);
  static GNestedFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GNestedFragmentData.serializer, json);
}

abstract class GPokemonCard implements GNestedFragment {
  String get G__typename;
  int get id;
  String get name;
  String get avatar;
  GPokemonCard_height? get height;
  GPokemonCard_weight? get weight;
  Map<String, dynamic> toJson();
}

abstract class GPokemonCard_height {
  String get G__typename;
  String? get in_meter;
  Map<String, dynamic> toJson();
}

abstract class GPokemonCard_weight {
  String get G__typename;
  String? get in_kg;
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
  int get id;
  String get name;
  String get avatar;
  GPokemonCardData_height? get height;
  GPokemonCardData_weight? get weight;
  static Serializer<GPokemonCardData> get serializer =>
      _$gPokemonCardDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPokemonCardData.serializer, this)
          as Map<String, dynamic>);
  static GPokemonCardData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonCardData.serializer, json);
}

abstract class GPokemonCardData_height
    implements
        Built<GPokemonCardData_height, GPokemonCardData_heightBuilder>,
        GPokemonCard_height {
  GPokemonCardData_height._();

  factory GPokemonCardData_height(
          [Function(GPokemonCardData_heightBuilder b) updates]) =
      _$GPokemonCardData_height;

  static void _initializeBuilder(GPokemonCardData_heightBuilder b) =>
      b..G__typename = 'Height';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get in_meter;
  static Serializer<GPokemonCardData_height> get serializer =>
      _$gPokemonCardDataHeightSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPokemonCardData_height.serializer, this)
          as Map<String, dynamic>);
  static GPokemonCardData_height? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonCardData_height.serializer, json);
}

abstract class GPokemonCardData_weight
    implements
        Built<GPokemonCardData_weight, GPokemonCardData_weightBuilder>,
        GPokemonCard_weight {
  GPokemonCardData_weight._();

  factory GPokemonCardData_weight(
          [Function(GPokemonCardData_weightBuilder b) updates]) =
      _$GPokemonCardData_weight;

  static void _initializeBuilder(GPokemonCardData_weightBuilder b) =>
      b..G__typename = 'Weight';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get in_kg;
  static Serializer<GPokemonCardData_weight> get serializer =>
      _$gPokemonCardDataWeightSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPokemonCardData_weight.serializer, this)
          as Map<String, dynamic>);
  static GPokemonCardData_weight? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonCardData_weight.serializer, json);
}
