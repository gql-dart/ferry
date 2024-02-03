// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql2/mutations/__generated__/review_with_date_scalar.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql2/mutations/__generated__/review_with_date_scalar.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/mutations/__generated__/review_with_date_scalar.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'review_with_date_scalar.req.gql.g.dart';

abstract class GReviewWithDateReq
    implements
        Built<GReviewWithDateReq, GReviewWithDateReqBuilder>,
        _i1.OperationRequest<_i2.GReviewWithDateData, _i3.GReviewWithDateVars> {
  GReviewWithDateReq._();

  factory GReviewWithDateReq(
          [void Function(GReviewWithDateReqBuilder b) updates]) =
      _$GReviewWithDateReq;

  static void _initializeBuilder(GReviewWithDateReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ReviewWithDate',
    )
    ..executeOnListen = true;

  @override
  _i3.GReviewWithDateVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GReviewWithDateData? Function(
    _i2.GReviewWithDateData?,
    _i2.GReviewWithDateData?,
  )? get updateResult;
  @override
  _i2.GReviewWithDateData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GReviewWithDateData? parseData(Map<String, dynamic> json) =>
      _i2.GReviewWithDateData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GReviewWithDateData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GReviewWithDateData, _i3.GReviewWithDateVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GReviewWithDateReq> get serializer =>
      _$gReviewWithDateReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReviewWithDateReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewWithDateReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReviewWithDateReq.serializer,
        json,
      );
}
