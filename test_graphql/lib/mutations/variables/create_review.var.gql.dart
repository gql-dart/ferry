// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:test_graphql/schema/serializers.gql.dart' as _i2;

part 'create_review.var.gql.g.dart';

abstract class GCreateReviewVars
    implements Built<GCreateReviewVars, GCreateReviewVarsBuilder> {
  GCreateReviewVars._();

  factory GCreateReviewVars([Function(GCreateReviewVarsBuilder b) updates]) =
      _$GCreateReviewVars;

  @nullable
  _i1.GEpisode get episode;
  _i1.GReviewInput get review;
  static Serializer<GCreateReviewVars> get serializer =>
      _$gCreateReviewVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GCreateReviewVars.serializer, this);
  static GCreateReviewVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GCreateReviewVars.serializer, json);
}
