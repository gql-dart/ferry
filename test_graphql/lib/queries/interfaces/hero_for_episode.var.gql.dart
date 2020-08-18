// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:test_graphql/schema/serializers.gql.dart' as _i2;

part 'hero_for_episode.var.gql.g.dart';

abstract class GHeroForEpisodeVars
    implements Built<GHeroForEpisodeVars, GHeroForEpisodeVarsBuilder> {
  GHeroForEpisodeVars._();

  factory GHeroForEpisodeVars(
      [Function(GHeroForEpisodeVarsBuilder b) updates]) = _$GHeroForEpisodeVars;

  _i1.GEpisode get ep;
  static Serializer<GHeroForEpisodeVars> get serializer =>
      _$gHeroForEpisodeVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GHeroForEpisodeVars.serializer, this);
  static GHeroForEpisodeVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GHeroForEpisodeVars.serializer, json);
}

abstract class GDroidFragmentVars
    implements Built<GDroidFragmentVars, GDroidFragmentVarsBuilder> {
  GDroidFragmentVars._();

  factory GDroidFragmentVars([Function(GDroidFragmentVarsBuilder b) updates]) =
      _$GDroidFragmentVars;

  static Serializer<GDroidFragmentVars> get serializer =>
      _$gDroidFragmentVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GDroidFragmentVars.serializer, this);
  static GDroidFragmentVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GDroidFragmentVars.serializer, json);
}
