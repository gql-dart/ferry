// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:pokemon_explorer/serializers.gql.dart' as _i7;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.ast.gql.dart'
    as _i5;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.data.gql.dart'
    as _i2;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.var.gql.dart'
    as _i3;
import 'package:uuid/uuid.dart' as _i6;

part 'pokemon_detail.req.gql.g.dart';

abstract class GPokemonDetailReq
    implements
        Built<GPokemonDetailReq, GPokemonDetailReqBuilder>,
        _i1.OperationRequest<_i2.GPokemonDetailData, _i3.GPokemonDetailVars> {
  GPokemonDetailReq._();

  factory GPokemonDetailReq([Function(GPokemonDetailReqBuilder b) updates]) =
      _$GPokemonDetailReq;

  static void _initializeBuilder(GPokemonDetailReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'PokemonDetail')
    ..requestId = _i6.Uuid().v1()
    ..executeOnListen = true;
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
  @nullable
  bool get executeOnListen;
  @override
  _i2.GPokemonDetailData parseData(Map<String, dynamic> json) =>
      _i2.GPokemonDetailData.fromJson(json);
  static Serializer<GPokemonDetailReq> get serializer =>
      _$gPokemonDetailReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GPokemonDetailReq.serializer, this);
  static GPokemonDetailReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GPokemonDetailReq.serializer, json);
}
