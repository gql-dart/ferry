// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql/queries/variables/reviews.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/queries/variables/reviews.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:uuid/uuid.dart' as _i6;

part 'reviews.req.gql.g.dart';

abstract class GReviewsReq
    implements
        Built<GReviewsReq, GReviewsReqBuilder>,
        _i1.OperationRequest<_i2.GReviewsData, _i3.GReviewsVars> {
  GReviewsReq._();

  factory GReviewsReq([Function(GReviewsReqBuilder b) updates]) = _$GReviewsReq;

  static void _initializeBuilder(GReviewsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Reviews')
    ..requestId = _i6.Uuid().v1()
    ..executeOnListen = true;
  _i3.GReviewsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GReviewsData Function(_i2.GReviewsData, _i2.GReviewsData)
      get updateResult;
  @nullable
  _i2.GReviewsData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GReviewsData parseData(Map<String, dynamic> json) =>
      _i2.GReviewsData.fromJson(json);
  static Serializer<GReviewsReq> get serializer => _$gReviewsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GReviewsReq.serializer, this);
  static GReviewsReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GReviewsReq.serializer, json);
}
