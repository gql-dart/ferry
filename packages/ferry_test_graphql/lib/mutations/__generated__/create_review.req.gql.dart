// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql/mutations/__generated__/create_review.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/mutations/__generated__/create_review.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/mutations/__generated__/create_review.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'create_review.req.gql.g.dart';

abstract class GCreateReviewReq
    implements
        Built<GCreateReviewReq, GCreateReviewReqBuilder>,
        _i1.OperationRequest<_i2.GCreateReviewData, _i3.GCreateReviewVars> {
  GCreateReviewReq._();

  factory GCreateReviewReq([Function(GCreateReviewReqBuilder b) updates]) =
      _$GCreateReviewReq;

  static void _initializeBuilder(GCreateReviewReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateReview',
    )
    ..executeOnListen = true;
  @override
  _i3.GCreateReviewVars get vars;
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
  _i2.GCreateReviewData? Function(
    _i2.GCreateReviewData?,
    _i2.GCreateReviewData?,
  )? get updateResult;
  @override
  _i2.GCreateReviewData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateReviewData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateReviewData.fromJson(json);
  static Serializer<GCreateReviewReq> get serializer =>
      _$gCreateReviewReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateReviewReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateReviewReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateReviewReq.serializer,
        json,
      );
}
