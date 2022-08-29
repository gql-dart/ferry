// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'hero_with_fragments.var.gql.g.dart';

abstract class GHeroWithFragmentsVars
    implements Built<GHeroWithFragmentsVars, GHeroWithFragmentsVarsBuilder> {
  GHeroWithFragmentsVars._();

  factory GHeroWithFragmentsVars(
          [Function(GHeroWithFragmentsVarsBuilder b) updates]) =
      _$GHeroWithFragmentsVars;

  _i1.GEpisode? get episode;
  static Serializer<GHeroWithFragmentsVars> get serializer =>
      _$gHeroWithFragmentsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GHeroWithFragmentsVars.serializer, this)
          as Map<String, dynamic>);
  static GHeroWithFragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GHeroWithFragmentsVars.serializer, json);
}

abstract class GheroDataVars
    implements Built<GheroDataVars, GheroDataVarsBuilder> {
  GheroDataVars._();

  factory GheroDataVars([Function(GheroDataVarsBuilder b) updates]) =
      _$GheroDataVars;

  static Serializer<GheroDataVars> get serializer => _$gheroDataVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GheroDataVars.serializer, this)
          as Map<String, dynamic>);
  static GheroDataVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GheroDataVars.serializer, json);
}

abstract class GcomparisonFieldsVars
    implements Built<GcomparisonFieldsVars, GcomparisonFieldsVarsBuilder> {
  GcomparisonFieldsVars._();

  factory GcomparisonFieldsVars(
          [Function(GcomparisonFieldsVarsBuilder b) updates]) =
      _$GcomparisonFieldsVars;

  int? get first;
  static Serializer<GcomparisonFieldsVars> get serializer =>
      _$gcomparisonFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GcomparisonFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GcomparisonFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GcomparisonFieldsVars.serializer, json);
}
