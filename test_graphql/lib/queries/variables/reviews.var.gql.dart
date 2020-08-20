// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:test_graphql/schema/serializers.gql.dart' as _i2;

part 'reviews.var.gql.g.dart';

abstract class GReviewsVars
    implements Built<GReviewsVars, GReviewsVarsBuilder> {
  GReviewsVars._();

  factory GReviewsVars([Function(GReviewsVarsBuilder b) updates]) =
      _$GReviewsVars;

  @nullable
  _i1.GEpisode get episode;
  static Serializer<GReviewsVars> get serializer => _$gReviewsVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GReviewsVars.serializer, this);
  static GReviewsVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GReviewsVars.serializer, json);
}
