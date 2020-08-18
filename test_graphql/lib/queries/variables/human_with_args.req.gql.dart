// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:test_graphql/queries/variables/human_with_args.ast.gql.dart'
    as _i5;
import 'package:test_graphql/queries/variables/human_with_args.data.gql.dart'
    as _i2;
import 'package:test_graphql/queries/variables/human_with_args.var.gql.dart'
    as _i3;
import 'package:test_graphql/schema/serializers.gql.dart' as _i6;

part 'human_with_args.req.gql.g.dart';

abstract class GHumanWithArgs
    implements
        Built<GHumanWithArgs, GHumanWithArgsBuilder>,
        _i1.OperationRequest<_i2.GHumanWithArgsData, _i3.GHumanWithArgsVars> {
  GHumanWithArgs._();

  factory GHumanWithArgs([Function(GHumanWithArgsBuilder b) updates]) =
      _$GHumanWithArgs;

  static void _initializeBuilder(GHumanWithArgsBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'HumanWithArgs');
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
  @override
  _i2.GHumanWithArgsData parseData(Map<String, dynamic> json) =>
      _i2.GHumanWithArgsData.fromJson(json);
  static Serializer<GHumanWithArgs> get serializer =>
      _$gHumanWithArgsSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GHumanWithArgs.serializer, this);
  static GHumanWithArgs fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GHumanWithArgs.serializer, json);
}
