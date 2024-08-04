// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'enum_from_external_schema.data.gql.g.dart';

abstract class GQueryHeroByEpisodeData
    implements Built<GQueryHeroByEpisodeData, GQueryHeroByEpisodeDataBuilder> {
  GQueryHeroByEpisodeData._();

  factory GQueryHeroByEpisodeData(
          [void Function(GQueryHeroByEpisodeDataBuilder b) updates]) =
      _$GQueryHeroByEpisodeData;

  static void _initializeBuilder(GQueryHeroByEpisodeDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQueryHeroByEpisodeData_hero? get hero;
  static Serializer<GQueryHeroByEpisodeData> get serializer =>
      _$gQueryHeroByEpisodeDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GQueryHeroByEpisodeData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GQueryHeroByEpisodeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GQueryHeroByEpisodeData.serializer,
        json,
      );
}

abstract class GQueryHeroByEpisodeData_hero
    implements
        Built<GQueryHeroByEpisodeData_hero,
            GQueryHeroByEpisodeData_heroBuilder> {
  GQueryHeroByEpisodeData_hero._();

  factory GQueryHeroByEpisodeData_hero(
          [void Function(GQueryHeroByEpisodeData_heroBuilder b) updates]) =
      _$GQueryHeroByEpisodeData_hero;

  static void _initializeBuilder(GQueryHeroByEpisodeData_heroBuilder b) =>
      b..G__typename = 'Character';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GQueryHeroByEpisodeData_hero> get serializer =>
      _$gQueryHeroByEpisodeDataHeroSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GQueryHeroByEpisodeData_hero.serializer,
        this,
      ) as Map<String, dynamic>);

  static GQueryHeroByEpisodeData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GQueryHeroByEpisodeData_hero.serializer,
        json,
      );
}
