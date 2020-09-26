// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:ferry_test_graphql/mutations/variables/create_review.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/mutations/variables/create_review.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/mutations/variables/create_review.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:uuid/uuid.dart' as _i6;

part 'create_review.req.gql.g.dart';

abstract class GCreateReviewReq
    implements
        Built<GCreateReviewReq, GCreateReviewReqBuilder>,
        _i1.OperationRequest<_i2.GCreateReviewData, _i3.GCreateReviewVars> {
  GCreateReviewReq._();

  factory GCreateReviewReq([Function(GCreateReviewReqBuilder b) updates]) =
      _$GCreateReviewReq;

  static void _initializeBuilder(GCreateReviewReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'CreateReview')
    ..requestId = _i6.Uuid().v1()
    ..executeOnListen = true;
  _i3.GCreateReviewVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GCreateReviewData Function(_i2.GCreateReviewData, _i2.GCreateReviewData)
      get updateResult;
  @nullable
  _i2.GCreateReviewData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GCreateReviewData parseData(Map<String, dynamic> json) =>
      _i2.GCreateReviewData.fromJson(json);
  static Serializer<GCreateReviewReq> get serializer =>
      _$gCreateReviewReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GCreateReviewReq.serializer, this);
  static GCreateReviewReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GCreateReviewReq.serializer, json);
}
