// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i6;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'hero_with_fragments.req.gql.g.dart';

abstract class GHeroWithFragmentsReq
    implements
        Built<GHeroWithFragmentsReq, GHeroWithFragmentsReqBuilder>,
        _i1.OperationRequest<_i2.GHeroWithFragmentsData,
            _i3.GHeroWithFragmentsVars> {
  GHeroWithFragmentsReq._();

  factory GHeroWithFragmentsReq(
          [Function(GHeroWithFragmentsReqBuilder b) updates]) =
      _$GHeroWithFragmentsReq;

  static void _initializeBuilder(GHeroWithFragmentsReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'HeroWithFragments')
    ..executeOnListen = true;
  _i3.GHeroWithFragmentsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GHeroWithFragmentsData? Function(
          _i2.GHeroWithFragmentsData?, _i2.GHeroWithFragmentsData?)?
      get updateResult;
  _i2.GHeroWithFragmentsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GHeroWithFragmentsData? parseData(Map<String, dynamic> json) =>
      _i2.GHeroWithFragmentsData.fromJson(json);
  static Serializer<GHeroWithFragmentsReq> get serializer =>
      _$gHeroWithFragmentsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GHeroWithFragmentsReq.serializer, this)
          as Map<String, dynamic>);
  static GHeroWithFragmentsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GHeroWithFragmentsReq.serializer, json);
}

abstract class GheroDataReq
    implements
        Built<GheroDataReq, GheroDataReqBuilder>,
        _i1.FragmentRequest<_i2.GheroDataData, _i3.GheroDataVars> {
  GheroDataReq._();

  factory GheroDataReq([Function(GheroDataReqBuilder b) updates]) =
      _$GheroDataReq;

  static void _initializeBuilder(GheroDataReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'heroData';
  _i3.GheroDataVars get vars;
  _i7.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GheroDataData? parseData(Map<String, dynamic> json) =>
      _i2.GheroDataData.fromJson(json);
  static Serializer<GheroDataReq> get serializer => _$gheroDataReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GheroDataReq.serializer, this)
          as Map<String, dynamic>);
  static GheroDataReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GheroDataReq.serializer, json);
}

abstract class GcomparisonFieldsReq
    implements
        Built<GcomparisonFieldsReq, GcomparisonFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GcomparisonFieldsData,
            _i3.GcomparisonFieldsVars> {
  GcomparisonFieldsReq._();

  factory GcomparisonFieldsReq(
          [Function(GcomparisonFieldsReqBuilder b) updates]) =
      _$GcomparisonFieldsReq;

  static void _initializeBuilder(GcomparisonFieldsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'comparisonFields';
  _i3.GcomparisonFieldsVars get vars;
  _i7.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GcomparisonFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GcomparisonFieldsData.fromJson(json);
  static Serializer<GcomparisonFieldsReq> get serializer =>
      _$gcomparisonFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GcomparisonFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GcomparisonFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GcomparisonFieldsReq.serializer, json);
}
