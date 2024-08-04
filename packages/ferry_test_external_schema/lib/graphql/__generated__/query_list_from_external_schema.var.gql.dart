// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'query_list_from_external_schema.var.gql.g.dart';

abstract class GReviewsVars
    implements Built<GReviewsVars, GReviewsVarsBuilder> {
  GReviewsVars._();

  factory GReviewsVars([void Function(GReviewsVarsBuilder b) updates]) =
      _$GReviewsVars;

  static Serializer<GReviewsVars> get serializer => _$gReviewsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewsVars.serializer,
        json,
      );
}
