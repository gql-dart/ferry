// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.ast.gql.dart'
    as _i5;
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.data.gql.dart'
    as _i2;
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.var.gql.dart'
    as _i3;
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'query_from_external_schema.req.gql.g.dart';

abstract class GHumanQueryReq
    implements
        Built<GHumanQueryReq, GHumanQueryReqBuilder>,
        _i1.OperationRequest<_i2.GHumanQueryData, _i3.GHumanQueryVars> {
  GHumanQueryReq._();

  factory GHumanQueryReq([void Function(GHumanQueryReqBuilder b) updates]) =
      _$GHumanQueryReq;

  static void _initializeBuilder(GHumanQueryReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'HumanQuery',
    )
    ..executeOnListen = true;

  @override
  _i3.GHumanQueryVars get vars;
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
  _i2.GHumanQueryData? Function(
    _i2.GHumanQueryData?,
    _i2.GHumanQueryData?,
  )? get updateResult;
  @override
  _i2.GHumanQueryData? get optimisticResponse;
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
  _i2.GHumanQueryData? parseData(Map<String, dynamic> json) =>
      _i2.GHumanQueryData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GHumanQueryData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GHumanQueryData, _i3.GHumanQueryVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GHumanQueryReq> get serializer =>
      _$gHumanQueryReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHumanQueryReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanQueryReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHumanQueryReq.serializer,
        json,
      );
}

abstract class GHumanFragReq
    implements
        Built<GHumanFragReq, GHumanFragReqBuilder>,
        _i1.FragmentRequest<_i2.GHumanFragData, _i3.GHumanFragVars> {
  GHumanFragReq._();

  factory GHumanFragReq([void Function(GHumanFragReqBuilder b) updates]) =
      _$GHumanFragReq;

  static void _initializeBuilder(GHumanFragReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'HumanFrag';

  @override
  _i3.GHumanFragVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GHumanFragData? parseData(Map<String, dynamic> json) =>
      _i2.GHumanFragData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GHumanFragData data) => data.toJson();

  static Serializer<GHumanFragReq> get serializer => _$gHumanFragReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHumanFragReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHumanFragReq.serializer,
        json,
      );
}
