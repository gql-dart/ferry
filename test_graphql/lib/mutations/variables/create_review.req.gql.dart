// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:test_graphql/mutations/variables/create_review.ast.gql.dart'
    as _i5;
import 'package:test_graphql/mutations/variables/create_review.data.gql.dart'
    as _i2;
import 'package:test_graphql/mutations/variables/create_review.var.gql.dart'
    as _i3;
import 'package:test_graphql/schema/serializers.gql.dart' as _i6;

part 'create_review.req.gql.g.dart';

abstract class GCreateReview
    implements
        Built<GCreateReview, GCreateReviewBuilder>,
        _i1.OperationRequest<_i2.GCreateReviewData, _i3.GCreateReviewVars> {
  GCreateReview._();

  factory GCreateReview([Function(GCreateReviewBuilder b) updates]) =
      _$GCreateReview;

  static void _initializeBuilder(GCreateReviewBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'CreateReview');
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
  @override
  _i2.GCreateReviewData parseData(Map<String, dynamic> json) =>
      _i2.GCreateReviewData.fromJson(json);
  static Serializer<GCreateReview> get serializer => _$gCreateReviewSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GCreateReview.serializer, this);
  static GCreateReview fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCreateReview.serializer, json);
}
