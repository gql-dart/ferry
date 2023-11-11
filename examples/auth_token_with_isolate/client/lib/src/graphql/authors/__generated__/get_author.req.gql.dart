// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i6;
import 'package:authors_example/src/graphql/authors/__generated__/get_author.ast.gql.dart'
    as _i5;
import 'package:authors_example/src/graphql/authors/__generated__/get_author.data.gql.dart'
    as _i2;
import 'package:authors_example/src/graphql/authors/__generated__/get_author.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'get_author.req.gql.g.dart';

abstract class GGetAuthorByIdReq
    implements
        Built<GGetAuthorByIdReq, GGetAuthorByIdReqBuilder>,
        _i1.OperationRequest<_i2.GGetAuthorByIdData, _i3.GGetAuthorByIdVars> {
  GGetAuthorByIdReq._();

  factory GGetAuthorByIdReq([Function(GGetAuthorByIdReqBuilder b) updates]) =
      _$GGetAuthorByIdReq;

  static void _initializeBuilder(GGetAuthorByIdReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetAuthorById',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetAuthorByIdVars get vars;
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
  _i2.GGetAuthorByIdData? Function(
    _i2.GGetAuthorByIdData?,
    _i2.GGetAuthorByIdData?,
  )? get updateResult;
  @override
  _i2.GGetAuthorByIdData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetAuthorByIdData? parseData(Map<String, dynamic> json) =>
      _i2.GGetAuthorByIdData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(dynamic data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GGetAuthorByIdData, _i3.GGetAuthorByIdVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GGetAuthorByIdReq> get serializer =>
      _$gGetAuthorByIdReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetAuthorByIdReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorByIdReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetAuthorByIdReq.serializer,
        json,
      );
}
