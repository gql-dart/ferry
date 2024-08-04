// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart'
    as _i1;

part 'enum_from_external_schema.var.gql.g.dart';

abstract class GQueryHeroByEpisodeVars
    implements Built<GQueryHeroByEpisodeVars, GQueryHeroByEpisodeVarsBuilder> {
  GQueryHeroByEpisodeVars._();

  factory GQueryHeroByEpisodeVars(
          [void Function(GQueryHeroByEpisodeVarsBuilder b) updates]) =
      _$GQueryHeroByEpisodeVars;

  _i1.GEpisode get episode;
  static Serializer<GQueryHeroByEpisodeVars> get serializer =>
      _$gQueryHeroByEpisodeVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GQueryHeroByEpisodeVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GQueryHeroByEpisodeVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GQueryHeroByEpisodeVars.serializer,
        json,
      );
}
