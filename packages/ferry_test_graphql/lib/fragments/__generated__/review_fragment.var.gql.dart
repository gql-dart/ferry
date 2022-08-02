// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'review_fragment.var.gql.g.dart';

abstract class GReviewFragmentVars
    implements Built<GReviewFragmentVars, GReviewFragmentVarsBuilder> {
  GReviewFragmentVars._();

  factory GReviewFragmentVars(
      [Function(GReviewFragmentVarsBuilder b) updates]) = _$GReviewFragmentVars;

  static Serializer<GReviewFragmentVars> get serializer =>
      _$gReviewFragmentVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReviewFragmentVars.serializer, this)
          as Map<String, dynamic>);
  static GReviewFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewFragmentVars.serializer, json);
}
