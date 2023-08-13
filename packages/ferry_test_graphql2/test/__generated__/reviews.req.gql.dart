// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'asset:ferry_test_graphql2/test/__generated__/reviews.ast.gql.dart'
    as _i5;
import 'asset:ferry_test_graphql2/test/__generated__/reviews.data.gql.dart'
    as _i2;
import 'asset:ferry_test_graphql2/test/__generated__/reviews.var.gql.dart'
    as _i3;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'reviews.req.gql.g.dart';

abstract class GReviewsReq
    implements
        Built<GReviewsReq, GReviewsReqBuilder>,
        _i1.OperationRequest<_i2.GReviewsData, _i3.GReviewsVars> {
  GReviewsReq._();

  factory GReviewsReq([Function(GReviewsReqBuilder b) updates]) = _$GReviewsReq;

  static void _initializeBuilder(GReviewsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Reviews',
    )
    ..executeOnListen = true;
  @override
  _i3.GReviewsVars get vars;
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
  _i2.GReviewsData? Function(
    _i2.GReviewsData?,
    _i2.GReviewsData?,
  )? get updateResult;
  @override
  _i2.GReviewsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GReviewsData? parseData(Map<String, dynamic> json) =>
      _i2.GReviewsData.fromJson(json);
  static Serializer<GReviewsReq> get serializer => _$gReviewsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReviewsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReviewsReq.serializer,
        json,
      );
}
