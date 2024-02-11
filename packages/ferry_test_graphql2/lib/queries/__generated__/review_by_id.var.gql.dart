// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'review_by_id.var.gql.g.dart';

abstract class GReviewsByIDVars
    implements Built<GReviewsByIDVars, GReviewsByIDVarsBuilder> {
  GReviewsByIDVars._();

  factory GReviewsByIDVars([void Function(GReviewsByIDVarsBuilder b) updates]) =
      _$GReviewsByIDVars;

  String get id;
  static Serializer<GReviewsByIDVars> get serializer =>
      _$gReviewsByIDVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewsByIDVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewsByIDVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewsByIDVars.serializer,
        json,
      );
}
