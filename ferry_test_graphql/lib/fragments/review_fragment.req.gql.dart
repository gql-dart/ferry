// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql/fragments/review_fragment.ast.gql.dart'
    as _i4;
import 'package:ferry_test_graphql/fragments/review_fragment.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/fragments/review_fragment.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i6;
import 'package:gql/ast.dart' as _i5;

part 'review_fragment.req.gql.g.dart';

abstract class GReviewFragmentReq
    implements
        Built<GReviewFragmentReq, GReviewFragmentReqBuilder>,
        _i1.FragmentRequest<_i2.GReviewFragmentData, _i3.GReviewFragmentVars> {
  GReviewFragmentReq._();

  factory GReviewFragmentReq([Function(GReviewFragmentReqBuilder b) updates]) =
      _$GReviewFragmentReq;

  static void _initializeBuilder(GReviewFragmentReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'ReviewFragment';
  _i3.GReviewFragmentVars get vars;
  _i5.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReviewFragmentData parseData(Map<String, dynamic> json) =>
      _i2.GReviewFragmentData.fromJson(json);
  static Serializer<GReviewFragmentReq> get serializer =>
      _$gReviewFragmentReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GReviewFragmentReq.serializer, this);
  static GReviewFragmentReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReviewFragmentReq.serializer, json);
}
