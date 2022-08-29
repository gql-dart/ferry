// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'aliased_hero.data.gql.g.dart';

abstract class GAliasedHeroData
    implements Built<GAliasedHeroData, GAliasedHeroDataBuilder> {
  GAliasedHeroData._();

  factory GAliasedHeroData([Function(GAliasedHeroDataBuilder b) updates]) =
      _$GAliasedHeroData;

  static void _initializeBuilder(GAliasedHeroDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAliasedHeroData_empireHero? get empireHero;
  GAliasedHeroData_jediHero? get jediHero;
  static Serializer<GAliasedHeroData> get serializer =>
      _$gAliasedHeroDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAliasedHeroData.serializer, this)
          as Map<String, dynamic>);
  static GAliasedHeroData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAliasedHeroData.serializer, json);
}

abstract class GAliasedHeroData_empireHero
    implements
        Built<GAliasedHeroData_empireHero, GAliasedHeroData_empireHeroBuilder> {
  GAliasedHeroData_empireHero._();

  factory GAliasedHeroData_empireHero(
          [Function(GAliasedHeroData_empireHeroBuilder b) updates]) =
      _$GAliasedHeroData_empireHero;

  static void _initializeBuilder(GAliasedHeroData_empireHeroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  BuiltList<_i2.GEpisode> get from;
  static Serializer<GAliasedHeroData_empireHero> get serializer =>
      _$gAliasedHeroDataEmpireHeroSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAliasedHeroData_empireHero.serializer, this) as Map<String, dynamic>);
  static GAliasedHeroData_empireHero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAliasedHeroData_empireHero.serializer, json);
}

abstract class GAliasedHeroData_jediHero
    implements
        Built<GAliasedHeroData_jediHero, GAliasedHeroData_jediHeroBuilder> {
  GAliasedHeroData_jediHero._();

  factory GAliasedHeroData_jediHero(
          [Function(GAliasedHeroData_jediHeroBuilder b) updates]) =
      _$GAliasedHeroData_jediHero;

  static void _initializeBuilder(GAliasedHeroData_jediHeroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  BuiltList<_i2.GEpisode> get from;
  static Serializer<GAliasedHeroData_jediHero> get serializer =>
      _$gAliasedHeroDataJediHeroSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAliasedHeroData_jediHero.serializer, this)
          as Map<String, dynamic>);
  static GAliasedHeroData_jediHero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAliasedHeroData_jediHero.serializer, json);
}
