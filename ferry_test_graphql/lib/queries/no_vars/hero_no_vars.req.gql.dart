// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:ferry_test_graphql/queries/no_vars/hero_no_vars.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/queries/no_vars/hero_no_vars.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/queries/no_vars/hero_no_vars.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:uuid/uuid.dart' as _i6;

part 'hero_no_vars.req.gql.g.dart';

abstract class GHeroNoVarsReq
    implements
        Built<GHeroNoVarsReq, GHeroNoVarsReqBuilder>,
        _i1.OperationRequest<_i2.GHeroNoVarsData, _i3.GHeroNoVarsVars> {
  GHeroNoVarsReq._();

  factory GHeroNoVarsReq([Function(GHeroNoVarsReqBuilder b) updates]) =
      _$GHeroNoVarsReq;

  static void _initializeBuilder(GHeroNoVarsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'HeroNoVars')
    ..requestId = _i6.Uuid().v1()
    ..executeOnListen = true;
  _i3.GHeroNoVarsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GHeroNoVarsData Function(_i2.GHeroNoVarsData, _i2.GHeroNoVarsData)
      get updateResult;
  @nullable
  _i2.GHeroNoVarsData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GHeroNoVarsData parseData(Map<String, dynamic> json) =>
      _i2.GHeroNoVarsData.fromJson(json);
  static Serializer<GHeroNoVarsReq> get serializer =>
      _$gHeroNoVarsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GHeroNoVarsReq.serializer, this);
  static GHeroNoVarsReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GHeroNoVarsReq.serializer, json);
}
