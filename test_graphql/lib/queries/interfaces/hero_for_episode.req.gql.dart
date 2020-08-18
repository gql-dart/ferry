// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:test_graphql/queries/interfaces/hero_for_episode.ast.gql.dart'
    as _i5;
import 'package:test_graphql/queries/interfaces/hero_for_episode.data.gql.dart'
    as _i2;
import 'package:test_graphql/queries/interfaces/hero_for_episode.var.gql.dart'
    as _i3;
import 'package:test_graphql/schema/serializers.gql.dart' as _i6;

part 'hero_for_episode.req.gql.g.dart';

abstract class GHeroForEpisode
    implements
        Built<GHeroForEpisode, GHeroForEpisodeBuilder>,
        _i1.OperationRequest<_i2.GHeroForEpisodeData, _i3.GHeroForEpisodeVars> {
  GHeroForEpisode._();

  factory GHeroForEpisode([Function(GHeroForEpisodeBuilder b) updates]) =
      _$GHeroForEpisode;

  static void _initializeBuilder(GHeroForEpisodeBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'HeroForEpisode');
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
  static Serializer<GHeroForEpisode> get serializer =>
      _$gHeroForEpisodeSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GHeroForEpisode.serializer, this);
  static GHeroForEpisode fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GHeroForEpisode.serializer, json);
}

abstract class GDroidFragment
    implements
        Built<GDroidFragment, GDroidFragmentBuilder>,
        _i1.FragmentRequest<_i2.GDroidFragmentData, _i3.GDroidFragmentVars> {
  GDroidFragment._();

  factory GDroidFragment([Function(GDroidFragmentBuilder b) updates]) =
      _$GDroidFragment;

  static void _initializeBuilder(GDroidFragmentBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DroidFragment';
  _i3.GDroidFragmentVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GDroidFragmentData parseData(Map<String, dynamic> json) =>
      _i2.GDroidFragmentData.fromJson(json);
  static Serializer<GDroidFragment> get serializer =>
      _$gDroidFragmentSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GDroidFragment.serializer, this);
  static GDroidFragment fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GDroidFragment.serializer, json);
}
