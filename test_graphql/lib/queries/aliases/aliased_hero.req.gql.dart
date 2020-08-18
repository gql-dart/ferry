// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:test_graphql/queries/aliases/aliased_hero.ast.gql.dart' as _i5;
import 'package:test_graphql/queries/aliases/aliased_hero.data.gql.dart' as _i2;
import 'package:test_graphql/queries/aliases/aliased_hero.var.gql.dart' as _i3;
import 'package:test_graphql/schema/serializers.gql.dart' as _i6;

part 'aliased_hero.req.gql.g.dart';

abstract class GAliasedHero
    implements
        Built<GAliasedHero, GAliasedHeroBuilder>,
        _i1.OperationRequest<_i2.GAliasedHeroData, _i3.GAliasedHeroVars> {
  GAliasedHero._();

  factory GAliasedHero([Function(GAliasedHeroBuilder b) updates]) =
      _$GAliasedHero;

  static void _initializeBuilder(GAliasedHeroBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'AliasedHero');
  _i3.GAliasedHeroVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GAliasedHeroData Function(_i2.GAliasedHeroData, _i2.GAliasedHeroData)
      get updateResult;
  @nullable
  _i2.GAliasedHeroData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GAliasedHeroData parseData(Map<String, dynamic> json) =>
      _i2.GAliasedHeroData.fromJson(json);
  static Serializer<GAliasedHero> get serializer => _$gAliasedHeroSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GAliasedHero.serializer, this);
  static GAliasedHero fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAliasedHero.serializer, json);
}
