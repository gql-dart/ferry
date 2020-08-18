// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:test_graphql/queries/fragments/hero_with_fragments.ast.gql.dart'
    as _i5;
import 'package:test_graphql/queries/fragments/hero_with_fragments.data.gql.dart'
    as _i2;
import 'package:test_graphql/queries/fragments/hero_with_fragments.var.gql.dart'
    as _i3;
import 'package:test_graphql/schema/serializers.gql.dart' as _i6;

part 'hero_with_fragments.req.gql.g.dart';

abstract class GHeroWithFragments
    implements
        Built<GHeroWithFragments, GHeroWithFragmentsBuilder>,
        _i1.OperationRequest<_i2.GHeroWithFragmentsData,
            _i3.GHeroWithFragmentsVars> {
  GHeroWithFragments._();

  factory GHeroWithFragments([Function(GHeroWithFragmentsBuilder b) updates]) =
      _$GHeroWithFragments;

  static void _initializeBuilder(GHeroWithFragmentsBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'HeroWithFragments');
  _i3.GHeroWithFragmentsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GHeroWithFragmentsData Function(
      _i2.GHeroWithFragmentsData, _i2.GHeroWithFragmentsData) get updateResult;
  @nullable
  _i2.GHeroWithFragmentsData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GHeroWithFragmentsData parseData(Map<String, dynamic> json) =>
      _i2.GHeroWithFragmentsData.fromJson(json);
  static Serializer<GHeroWithFragments> get serializer =>
      _$gHeroWithFragmentsSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GHeroWithFragments.serializer, this);
  static GHeroWithFragments fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GHeroWithFragments.serializer, json);
}

abstract class GheroData
    implements
        Built<GheroData, GheroDataBuilder>,
        _i1.FragmentRequest<_i2.GheroDataData, _i3.GheroDataVars> {
  GheroData._();

  factory GheroData([Function(GheroDataBuilder b) updates]) = _$GheroData;

  static void _initializeBuilder(GheroDataBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'heroData';
  _i3.GheroDataVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GheroDataData parseData(Map<String, dynamic> json) =>
      _i2.GheroDataData.fromJson(json);
  static Serializer<GheroData> get serializer => _$gheroDataSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GheroData.serializer, this);
  static GheroData fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GheroData.serializer, json);
}

abstract class GcomparisonFields
    implements
        Built<GcomparisonFields, GcomparisonFieldsBuilder>,
        _i1.FragmentRequest<_i2.GcomparisonFieldsData,
            _i3.GcomparisonFieldsVars> {
  GcomparisonFields._();

  factory GcomparisonFields([Function(GcomparisonFieldsBuilder b) updates]) =
      _$GcomparisonFields;

  static void _initializeBuilder(GcomparisonFieldsBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'comparisonFields';
  _i3.GcomparisonFieldsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GcomparisonFieldsData parseData(Map<String, dynamic> json) =>
      _i2.GcomparisonFieldsData.fromJson(json);
  static Serializer<GcomparisonFields> get serializer =>
      _$gcomparisonFieldsSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GcomparisonFields.serializer, this);
  static GcomparisonFields fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GcomparisonFields.serializer, json);
}
