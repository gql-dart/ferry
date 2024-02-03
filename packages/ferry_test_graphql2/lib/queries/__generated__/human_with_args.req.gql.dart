// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'human_with_args.req.gql.g.dart';

abstract class GHumanWithArgsReq
    implements
        Built<GHumanWithArgsReq, GHumanWithArgsReqBuilder>,
        _i1.OperationRequest<_i2.GHumanWithArgsData, _i3.GHumanWithArgsVars> {
  GHumanWithArgsReq._();

  factory GHumanWithArgsReq(
          [void Function(GHumanWithArgsReqBuilder b) updates]) =
      _$GHumanWithArgsReq;

  static void _initializeBuilder(GHumanWithArgsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'HumanWithArgs',
    )
    ..executeOnListen = true;

  @override
  _i3.GHumanWithArgsVars get vars;
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
  _i2.GHumanWithArgsData? Function(
    _i2.GHumanWithArgsData?,
    _i2.GHumanWithArgsData?,
  )? get updateResult;
  @override
  _i2.GHumanWithArgsData? get optimisticResponse;
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
  _i2.GHumanWithArgsData? parseData(Map<String, dynamic> json) =>
      _i2.GHumanWithArgsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GHumanWithArgsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GHumanWithArgsData, _i3.GHumanWithArgsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GHumanWithArgsReq> get serializer =>
      _$gHumanWithArgsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHumanWithArgsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanWithArgsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHumanWithArgsReq.serializer,
        json,
      );
}
