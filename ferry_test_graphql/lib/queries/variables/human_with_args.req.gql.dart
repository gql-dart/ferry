// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql/queries/variables/human_with_args.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/queries/variables/human_with_args.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/queries/variables/human_with_args.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'human_with_args.req.gql.g.dart';

abstract class GHumanWithArgsReq
    implements
        Built<GHumanWithArgsReq, GHumanWithArgsReqBuilder>,
        _i1.OperationRequest<_i2.GHumanWithArgsData, _i3.GHumanWithArgsVars> {
  GHumanWithArgsReq._();

  factory GHumanWithArgsReq([Function(GHumanWithArgsReqBuilder b) updates]) =
      _$GHumanWithArgsReq;

  static void _initializeBuilder(GHumanWithArgsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'HumanWithArgs')
    ..executeOnListen = true;
  _i3.GHumanWithArgsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GHumanWithArgsData Function(
      _i2.GHumanWithArgsData, _i2.GHumanWithArgsData) get updateResult;
  @nullable
  _i2.GHumanWithArgsData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GHumanWithArgsData parseData(Map<String, dynamic> json) =>
      _i2.GHumanWithArgsData.fromJson(json);
  static Serializer<GHumanWithArgsReq> get serializer =>
      _$gHumanWithArgsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GHumanWithArgsReq.serializer, this);
  static GHumanWithArgsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GHumanWithArgsReq.serializer, json);
}
