// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'hero_no_vars.data.gql.g.dart';

abstract class GHeroNoVarsData
    implements Built<GHeroNoVarsData, GHeroNoVarsDataBuilder> {
  GHeroNoVarsData._();

  factory GHeroNoVarsData([Function(GHeroNoVarsDataBuilder b) updates]) =
      _$GHeroNoVarsData;

  @nullable
  GHeroNoVarsData_hero get hero;
  static Serializer<GHeroNoVarsData> get serializer =>
      _$gHeroNoVarsDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroNoVarsData.serializer, this);
  static GHeroNoVarsData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroNoVarsData.serializer, json);
}

abstract class GHeroNoVarsData_hero
    implements Built<GHeroNoVarsData_hero, GHeroNoVarsData_heroBuilder> {
  GHeroNoVarsData_hero._();

  factory GHeroNoVarsData_hero(
          [Function(GHeroNoVarsData_heroBuilder b) updates]) =
      _$GHeroNoVarsData_hero;

  static void _initializeBuilder(GHeroNoVarsData_heroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GHeroNoVarsData_hero> get serializer =>
      _$gHeroNoVarsDataHeroSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroNoVarsData_hero.serializer, this);
  static GHeroNoVarsData_hero fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroNoVarsData_hero.serializer, json);
}
