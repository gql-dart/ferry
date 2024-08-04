// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_external_schema/graphql/__generated__/enum_from_external_schema.ast.gql.dart'
    as _i5;
import 'package:ferry_test_external_schema/graphql/__generated__/enum_from_external_schema.data.gql.dart'
    as _i2;
import 'package:ferry_test_external_schema/graphql/__generated__/enum_from_external_schema.var.gql.dart'
    as _i3;
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'enum_from_external_schema.req.gql.g.dart';

abstract class GQueryHeroByEpisodeReq
    implements
        Built<GQueryHeroByEpisodeReq, GQueryHeroByEpisodeReqBuilder>,
        _i1.OperationRequest<_i2.GQueryHeroByEpisodeData,
            _i3.GQueryHeroByEpisodeVars> {
  GQueryHeroByEpisodeReq._();

  factory GQueryHeroByEpisodeReq(
          [void Function(GQueryHeroByEpisodeReqBuilder b) updates]) =
      _$GQueryHeroByEpisodeReq;

  static void _initializeBuilder(GQueryHeroByEpisodeReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'QueryHeroByEpisode',
    )
    ..executeOnListen = true;

  @override
  _i3.GQueryHeroByEpisodeVars get vars;
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
  _i2.GQueryHeroByEpisodeData? Function(
    _i2.GQueryHeroByEpisodeData?,
    _i2.GQueryHeroByEpisodeData?,
  )? get updateResult;
  @override
  _i2.GQueryHeroByEpisodeData? get optimisticResponse;
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
  _i2.GQueryHeroByEpisodeData? parseData(Map<String, dynamic> json) =>
      _i2.GQueryHeroByEpisodeData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GQueryHeroByEpisodeData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GQueryHeroByEpisodeData, _i3.GQueryHeroByEpisodeVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GQueryHeroByEpisodeReq> get serializer =>
      _$gQueryHeroByEpisodeReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GQueryHeroByEpisodeReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GQueryHeroByEpisodeReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GQueryHeroByEpisodeReq.serializer,
        json,
      );
}
