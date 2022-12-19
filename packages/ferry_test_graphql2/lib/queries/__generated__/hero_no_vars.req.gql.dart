// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql2/queries/__generated__/hero_no_vars.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql2/queries/__generated__/hero_no_vars.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/queries/__generated__/hero_no_vars.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'hero_no_vars.req.gql.g.dart';

abstract class GHeroNoVarsReq
    implements
        Built<GHeroNoVarsReq, GHeroNoVarsReqBuilder>,
        _i1.OperationRequest<_i2.GHeroNoVarsData, _i3.GHeroNoVarsVars> {
  GHeroNoVarsReq._();

  factory GHeroNoVarsReq([Function(GHeroNoVarsReqBuilder b) updates]) =
      _$GHeroNoVarsReq;

  static void _initializeBuilder(GHeroNoVarsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'HeroNoVars',
    )
    ..executeOnListen = true;
  @override
  _i3.GHeroNoVarsVars get vars;
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
  _i2.GHeroNoVarsData? Function(
    _i2.GHeroNoVarsData?,
    _i2.GHeroNoVarsData?,
  )? get updateResult;
  @override
  _i2.GHeroNoVarsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GHeroNoVarsData? parseData(Map<String, dynamic> json) =>
      _i2.GHeroNoVarsData.fromJson(json);
  static Serializer<GHeroNoVarsReq> get serializer =>
      _$gHeroNoVarsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHeroNoVarsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroNoVarsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHeroNoVarsReq.serializer,
        json,
      );
}
