// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'review_with_date_scalar.var.gql.g.dart';

abstract class GReviewWithDateVars
    implements Built<GReviewWithDateVars, GReviewWithDateVarsBuilder> {
  GReviewWithDateVars._();

  factory GReviewWithDateVars(
      [Function(GReviewWithDateVarsBuilder b) updates]) = _$GReviewWithDateVars;

  _i1.GEpisode? get episode;
  _i1.GReviewInput get review;
  DateTime? get createdAt;
  static Serializer<GReviewWithDateVars> get serializer =>
      _$gReviewWithDateVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GReviewWithDateVars.serializer, this)
          as Map<String, dynamic>);
  static GReviewWithDateVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GReviewWithDateVars.serializer, json);
}
