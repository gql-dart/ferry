// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:pokemon_explorer/serializers.gql.dart' as _i6;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.ast.gql.dart'
    as _i5;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.data.gql.dart'
    as _i2;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.var.gql.dart'
    as _i3;

part 'pokemon_detail.req.gql.g.dart';

abstract class GPokemonDetail
    implements
        Built<GPokemonDetail, GPokemonDetailBuilder>,
        _i1.OperationRequest<_i2.GPokemonDetailData, _i3.GPokemonDetailVars> {
  GPokemonDetail._();

  factory GPokemonDetail([Function(GPokemonDetailBuilder b) updates]) =
      _$GPokemonDetail;

  static void _initializeBuilder(GPokemonDetailBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'PokemonDetail');
  _i3.GPokemonDetailVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GPokemonDetailData Function(
      _i2.GPokemonDetailData, _i2.GPokemonDetailData) get updateResult;
  @nullable
  _i2.GPokemonDetailData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GPokemonDetailData parseData(Map<String, dynamic> json) =>
      _i2.GPokemonDetailData.fromJson(json);
  static Serializer<GPokemonDetail> get serializer =>
      _$gPokemonDetailSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GPokemonDetail.serializer, this);
  static GPokemonDetail fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPokemonDetail.serializer, json);
}
