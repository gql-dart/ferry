// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_inline_fragment.ast.gql.dart'
    as _i5;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_inline_fragment.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_inline_fragment.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'hero_with_inline_fragment.req.gql.g.dart';

abstract class GHeroForEpisodeReq
    implements
        Built<GHeroForEpisodeReq, GHeroForEpisodeReqBuilder>,
        _i1.OperationRequest<_i2.GHeroForEpisodeData, _i3.GHeroForEpisodeVars> {
  GHeroForEpisodeReq._();

  factory GHeroForEpisodeReq(
          [void Function(GHeroForEpisodeReqBuilder b) updates]) =
      _$GHeroForEpisodeReq;

  static void _initializeBuilder(GHeroForEpisodeReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'HeroForEpisode',
    )
    ..executeOnListen = true;

  @override
  _i3.GHeroForEpisodeVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GHeroForEpisodeData? Function(
    _i2.GHeroForEpisodeData?,
    _i2.GHeroForEpisodeData?,
  )? get updateResult;
  @override
  _i2.GHeroForEpisodeData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GHeroForEpisodeData? parseData(Map<String, dynamic> json) =>
      _i2.GHeroForEpisodeData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GHeroForEpisodeData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GHeroForEpisodeData, _i3.GHeroForEpisodeVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GHeroForEpisodeReq> get serializer =>
      _$gHeroForEpisodeReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHeroForEpisodeReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroForEpisodeReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHeroForEpisodeReq.serializer,
        json,
      );
}

abstract class GDroidFragmentReq
    implements
        Built<GDroidFragmentReq, GDroidFragmentReqBuilder>,
        _i1.FragmentRequest<_i2.GDroidFragmentData, _i3.GDroidFragmentVars> {
  GDroidFragmentReq._();

  factory GDroidFragmentReq(
          [void Function(GDroidFragmentReqBuilder b) updates]) =
      _$GDroidFragmentReq;

  static void _initializeBuilder(GDroidFragmentReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DroidFragment';

  @override
  _i3.GDroidFragmentVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GDroidFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GDroidFragmentData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GDroidFragmentData data) => data.toJson();

  static Serializer<GDroidFragmentReq> get serializer =>
      _$gDroidFragmentReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDroidFragmentReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDroidFragmentReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDroidFragmentReq.serializer,
        json,
      );
}
