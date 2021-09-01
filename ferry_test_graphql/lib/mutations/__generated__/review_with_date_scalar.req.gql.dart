// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql/mutations/__generated__/review_with_date_scalar.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/mutations/__generated__/review_with_date_scalar.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/mutations/__generated__/review_with_date_scalar.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'review_with_date_scalar.req.gql.g.dart';

abstract class GReviewWithDateReq
    implements
        Built<GReviewWithDateReq, GReviewWithDateReqBuilder>,
        _i1.OperationRequest<_i2.GReviewWithDateData, _i3.GReviewWithDateVars> {
  GReviewWithDateReq._();

  factory GReviewWithDateReq([Function(GReviewWithDateReqBuilder b) updates]) =
      _$GReviewWithDateReq;

  static void _initializeBuilder(GReviewWithDateReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'ReviewWithDate')
    ..executeOnListen = true;
  _i3.GReviewWithDateVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GReviewWithDateData? Function(
      _i2.GReviewWithDateData?, _i2.GReviewWithDateData?)? get updateResult;
  _i2.GReviewWithDateData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GReviewWithDateData? parseData(Map<String, dynamic> json) =>
      _i2.GReviewWithDateData.fromJson(json);
  static Serializer<GReviewWithDateReq> get serializer =>
      _$gReviewWithDateReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GReviewWithDateReq.serializer, this)
          as Map<String, dynamic>);
  static GReviewWithDateReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReviewWithDateReq.serializer, json);
}
