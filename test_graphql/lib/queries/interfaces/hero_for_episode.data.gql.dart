// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i3;
import 'package:gql_code_builder/src/utils/built_faker.dart' as _i2;
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'hero_for_episode.data.gql.g.dart';

abstract class GHeroForEpisodeData
    implements Built<GHeroForEpisodeData, GHeroForEpisodeDataBuilder> {
  GHeroForEpisodeData._();

  factory GHeroForEpisodeData(
      [Function(GHeroForEpisodeDataBuilder b) updates]) = _$GHeroForEpisodeData;

  @nullable
  GHeroForEpisodeData_hero get hero;
  static Serializer<GHeroForEpisodeData> get serializer =>
      _$gHeroForEpisodeDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroForEpisodeData.serializer, this);
  static GHeroForEpisodeData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroForEpisodeData.serializer, json);
}

@BuiltValue(instantiable: false)
abstract class GHeroForEpisodeData_hero implements _i2.BuiltFaker {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  @BuiltValueSerializer(custom: true)
  static Serializer<GHeroForEpisodeData_hero> get serializer =>
      _i3.InlineFragmentSerializer<GHeroForEpisodeData_hero>(
          'GHeroForEpisodeData_hero',
          GHeroForEpisodeData_hero__base,
          [GHeroForEpisodeData_hero__asDroid]);
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroForEpisodeData_hero.serializer, this);
  static GHeroForEpisodeData_hero fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroForEpisodeData_hero.serializer, json);
}

abstract class GHeroForEpisodeData_hero__base
    implements
        Built<GHeroForEpisodeData_hero__base,
            GHeroForEpisodeData_hero__baseBuilder>,
        GHeroForEpisodeData_hero {
  GHeroForEpisodeData_hero__base._();

  factory GHeroForEpisodeData_hero__base(
          [Function(GHeroForEpisodeData_hero__baseBuilder b) updates]) =
      _$GHeroForEpisodeData_hero__base;

  static void _initializeBuilder(GHeroForEpisodeData_hero__baseBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GHeroForEpisodeData_hero__base> get serializer =>
      _$gHeroForEpisodeDataHeroBaseSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GHeroForEpisodeData_hero__base.serializer, this);
  static GHeroForEpisodeData_hero__base fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroForEpisodeData_hero__base.serializer, json);
}

abstract class GHeroForEpisodeData_hero__asDroid
    implements
        Built<GHeroForEpisodeData_hero__asDroid,
            GHeroForEpisodeData_hero__asDroidBuilder>,
        GHeroForEpisodeData_hero,
        GDroidFragment {
  GHeroForEpisodeData_hero__asDroid._();

  factory GHeroForEpisodeData_hero__asDroid(
          [Function(GHeroForEpisodeData_hero__asDroidBuilder b) updates]) =
      _$GHeroForEpisodeData_hero__asDroid;

  static void _initializeBuilder(GHeroForEpisodeData_hero__asDroidBuilder b) =>
      b..G__typename = 'Droid';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  @nullable
  String get primaryFunction;
  static Serializer<GHeroForEpisodeData_hero__asDroid> get serializer =>
      _$gHeroForEpisodeDataHeroAsDroidSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GHeroForEpisodeData_hero__asDroid.serializer, this);
  static GHeroForEpisodeData_hero__asDroid fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroForEpisodeData_hero__asDroid.serializer, json);
}

abstract class GDroidFragment {
  String get G__typename;
  String get primaryFunction;
  Map<String, dynamic> toJson();
}

abstract class GDroidFragmentData
    implements
        Built<GDroidFragmentData, GDroidFragmentDataBuilder>,
        GDroidFragment {
  GDroidFragmentData._();

  factory GDroidFragmentData([Function(GDroidFragmentDataBuilder b) updates]) =
      _$GDroidFragmentData;

  static void _initializeBuilder(GDroidFragmentDataBuilder b) =>
      b..G__typename = 'Droid';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  String get primaryFunction;
  static Serializer<GDroidFragmentData> get serializer =>
      _$gDroidFragmentDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GDroidFragmentData.serializer, this);
  static GDroidFragmentData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDroidFragmentData.serializer, json);
}
