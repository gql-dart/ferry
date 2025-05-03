// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i6;
import 'package:authors_example/src/graphql/authors/__generated__/create_author.ast.gql.dart'
    as _i5;
import 'package:authors_example/src/graphql/authors/__generated__/create_author.data.gql.dart'
    as _i2;
import 'package:authors_example/src/graphql/authors/__generated__/create_author.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'create_author.req.gql.g.dart';

abstract class GCreateAuthorReq
    implements
        Built<GCreateAuthorReq, GCreateAuthorReqBuilder>,
        _i1.OperationRequest<_i2.GCreateAuthorData, _i3.GCreateAuthorVars> {
  GCreateAuthorReq._();

  factory GCreateAuthorReq([void Function(GCreateAuthorReqBuilder b) updates]) =
      _$GCreateAuthorReq;

  static void _initializeBuilder(GCreateAuthorReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateAuthor',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateAuthorVars get vars;
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
  _i2.GCreateAuthorData? Function(
    _i2.GCreateAuthorData?,
    _i2.GCreateAuthorData?,
  )? get updateResult;
  @override
  _i2.GCreateAuthorData? get optimisticResponse;
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
  _i2.GCreateAuthorData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateAuthorData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GCreateAuthorData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GCreateAuthorData, _i3.GCreateAuthorVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GCreateAuthorReq> get serializer =>
      _$gCreateAuthorReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateAuthorReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAuthorReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateAuthorReq.serializer,
        json,
      );
}
