// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'review_by_id.req.gql.g.dart';

abstract class GReviewsByIDReq
    implements
        Built<GReviewsByIDReq, GReviewsByIDReqBuilder>,
        _i1.OperationRequest<_i2.GReviewsByIDData, _i3.GReviewsByIDVars> {
  GReviewsByIDReq._();

  factory GReviewsByIDReq([Function(GReviewsByIDReqBuilder b) updates]) =
      _$GReviewsByIDReq;

  static void _initializeBuilder(GReviewsByIDReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ReviewsByID',
    )
    ..executeOnListen = true;
  @override
  _i3.GReviewsByIDVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GReviewsByIDData? Function(
    _i2.GReviewsByIDData?,
    _i2.GReviewsByIDData?,
  )? get updateResult;
  @override
  _i2.GReviewsByIDData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GReviewsByIDData? parseData(Map<String, dynamic> json) =>
      _i2.GReviewsByIDData.fromJson(json);
  static Serializer<GReviewsByIDReq> get serializer =>
      _$gReviewsByIDReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReviewsByIDReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewsByIDReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReviewsByIDReq.serializer,
        json,
      );
}
