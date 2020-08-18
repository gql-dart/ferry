// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:test_graphql/mutations/scalars/review_with_date.ast.gql.dart'
    as _i5;
import 'package:test_graphql/mutations/scalars/review_with_date.data.gql.dart'
    as _i2;
import 'package:test_graphql/mutations/scalars/review_with_date.var.gql.dart'
    as _i3;
import 'package:test_graphql/schema/serializers.gql.dart' as _i6;

part 'review_with_date.req.gql.g.dart';

abstract class GReviewWithDate
    implements
        Built<GReviewWithDate, GReviewWithDateBuilder>,
        _i1.OperationRequest<_i2.GReviewWithDateData, _i3.GReviewWithDateVars> {
  GReviewWithDate._();

  factory GReviewWithDate([Function(GReviewWithDateBuilder b) updates]) =
      _$GReviewWithDate;

  static void _initializeBuilder(GReviewWithDateBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'ReviewWithDate');
  _i3.GReviewWithDateVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GReviewWithDateData Function(
      _i2.GReviewWithDateData, _i2.GReviewWithDateData) get updateResult;
  @nullable
  _i2.GReviewWithDateData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GReviewWithDateData parseData(Map<String, dynamic> json) =>
      _i2.GReviewWithDateData.fromJson(json);
  static Serializer<GReviewWithDate> get serializer =>
      _$gReviewWithDateSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GReviewWithDate.serializer, this);
  static GReviewWithDate fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReviewWithDate.serializer, json);
}
