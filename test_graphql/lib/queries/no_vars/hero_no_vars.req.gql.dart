// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:test_graphql/queries/no_vars/hero_no_vars.ast.gql.dart' as _i5;
import 'package:test_graphql/queries/no_vars/hero_no_vars.data.gql.dart' as _i2;
import 'package:test_graphql/queries/no_vars/hero_no_vars.var.gql.dart' as _i3;
import 'package:test_graphql/schema/serializers.gql.dart' as _i6;

part 'hero_no_vars.req.gql.g.dart';

abstract class GHeroNoVars
    implements
        Built<GHeroNoVars, GHeroNoVarsBuilder>,
        _i1.OperationRequest<_i2.GHeroNoVarsData, _i3.GHeroNoVarsVars> {
  GHeroNoVars._();

  factory GHeroNoVars([Function(GHeroNoVarsBuilder b) updates]) = _$GHeroNoVars;

  static void _initializeBuilder(GHeroNoVarsBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'HeroNoVars');
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
  @override
  _i2.GHeroNoVarsData parseData(Map<String, dynamic> json) =>
      _i2.GHeroNoVarsData.fromJson(json);
  static Serializer<GHeroNoVars> get serializer => _$gHeroNoVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GHeroNoVars.serializer, this);
  static GHeroNoVars fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GHeroNoVars.serializer, json);
}
