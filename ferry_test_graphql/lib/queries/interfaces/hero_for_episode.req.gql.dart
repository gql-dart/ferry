// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:ferry_test_graphql/queries/interfaces/hero_for_episode.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql/queries/interfaces/hero_for_episode.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/queries/interfaces/hero_for_episode.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i7;
import 'package:gql/ast.dart' as _i8;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:uuid/uuid.dart' as _i6;

part 'hero_for_episode.req.gql.g.dart';

abstract class GHeroForEpisodeReq
    implements
        Built<GHeroForEpisodeReq, GHeroForEpisodeReqBuilder>,
        _i1.OperationRequest<_i2.GHeroForEpisodeData, _i3.GHeroForEpisodeVars> {
  GHeroForEpisodeReq._();

  factory GHeroForEpisodeReq([Function(GHeroForEpisodeReqBuilder b) updates]) =
      _$GHeroForEpisodeReq;

  static void _initializeBuilder(GHeroForEpisodeReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'HeroForEpisode')
    ..requestId = _i6.Uuid().v1();
  _i3.GHeroForEpisodeVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GHeroForEpisodeData Function(
      _i2.GHeroForEpisodeData, _i2.GHeroForEpisodeData) get updateResult;
  @nullable
  _i2.GHeroForEpisodeData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GHeroForEpisodeData parseData(Map<String, dynamic> json) =>
      _i2.GHeroForEpisodeData.fromJson(json);
  static Serializer<GHeroForEpisodeReq> get serializer =>
      _$gHeroForEpisodeReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GHeroForEpisodeReq.serializer, this);
  static GHeroForEpisodeReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GHeroForEpisodeReq.serializer, json);
}

abstract class GDroidFragmentReq
    implements
        Built<GDroidFragmentReq, GDroidFragmentReqBuilder>,
        _i1.FragmentRequest<_i2.GDroidFragmentData, _i3.GDroidFragmentVars> {
  GDroidFragmentReq._();

  factory GDroidFragmentReq([Function(GDroidFragmentReqBuilder b) updates]) =
      _$GDroidFragmentReq;

  static void _initializeBuilder(GDroidFragmentReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DroidFragment';
  _i3.GDroidFragmentVars get vars;
  _i8.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GDroidFragmentData parseData(Map<String, dynamic> json) =>
      _i2.GDroidFragmentData.fromJson(json);
  static Serializer<GDroidFragmentReq> get serializer =>
      _$gDroidFragmentReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GDroidFragmentReq.serializer, this);
  static GDroidFragmentReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GDroidFragmentReq.serializer, json);
}
