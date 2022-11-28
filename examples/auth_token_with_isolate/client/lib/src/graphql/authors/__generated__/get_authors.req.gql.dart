// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i6;
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.ast.gql.dart'
    as _i5;
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.data.gql.dart'
    as _i2;
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'get_authors.req.gql.g.dart';

abstract class GGetAuthorsReq
    implements
        Built<GGetAuthorsReq, GGetAuthorsReqBuilder>,
        _i1.OperationRequest<_i2.GGetAuthorsData, _i3.GGetAuthorsVars> {
  GGetAuthorsReq._();

  factory GGetAuthorsReq([Function(GGetAuthorsReqBuilder b) updates]) =
      _$GGetAuthorsReq;

  static void _initializeBuilder(GGetAuthorsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetAuthors',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetAuthorsVars get vars;
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
  _i2.GGetAuthorsData? Function(
    _i2.GGetAuthorsData?,
    _i2.GGetAuthorsData?,
  )? get updateResult;
  @override
  _i2.GGetAuthorsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetAuthorsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetAuthorsData.fromJson(json);
  static Serializer<GGetAuthorsReq> get serializer =>
      _$gGetAuthorsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetAuthorsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAuthorsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetAuthorsReq.serializer,
        json,
      );
}
