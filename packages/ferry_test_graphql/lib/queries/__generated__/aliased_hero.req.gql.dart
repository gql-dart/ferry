// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql/queries/__generated__/aliased_hero.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/queries/__generated__/aliased_hero.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/queries/__generated__/aliased_hero.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'aliased_hero.req.gql.g.dart';

abstract class GAliasedHeroReq
    implements
        Built<GAliasedHeroReq, GAliasedHeroReqBuilder>,
        _i1.OperationRequest<_i2.GAliasedHeroData, _i3.GAliasedHeroVars> {
  GAliasedHeroReq._();

  factory GAliasedHeroReq([Function(GAliasedHeroReqBuilder b) updates]) =
      _$GAliasedHeroReq;

  static void _initializeBuilder(GAliasedHeroReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AliasedHero',
    )
    ..executeOnListen = true;
  @override
  _i3.GAliasedHeroVars get vars;
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
  _i2.GAliasedHeroData? Function(
    _i2.GAliasedHeroData?,
    _i2.GAliasedHeroData?,
  )? get updateResult;
  @override
  _i2.GAliasedHeroData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAliasedHeroData? parseData(Map<String, dynamic> json) =>
      _i2.GAliasedHeroData.fromJson(json);
  static Serializer<GAliasedHeroReq> get serializer =>
      _$gAliasedHeroReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAliasedHeroReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAliasedHeroReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAliasedHeroReq.serializer,
        json,
      );
}
