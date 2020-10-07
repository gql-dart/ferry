// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:pokemon_explorer/serializers.gql.dart' as _i6;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.ast.gql.dart'
    as _i4;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.data.gql.dart'
    as _i2;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.var.gql.dart'
    as _i3;

part 'pokemon_card_fragment.req.gql.g.dart';

abstract class GNestedFragmentReq
    implements
        Built<GNestedFragmentReq, GNestedFragmentReqBuilder>,
        _i1.FragmentRequest<_i2.GNestedFragmentData, _i3.GNestedFragmentVars> {
  GNestedFragmentReq._();

  factory GNestedFragmentReq([Function(GNestedFragmentReqBuilder b) updates]) =
      _$GNestedFragmentReq;

  static void _initializeBuilder(GNestedFragmentReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'NestedFragment';
  _i3.GNestedFragmentVars get vars;
  _i5.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GNestedFragmentData parseData(Map<String, dynamic> json) =>
      _i2.GNestedFragmentData.fromJson(json);
  static Serializer<GNestedFragmentReq> get serializer =>
      _$gNestedFragmentReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GNestedFragmentReq.serializer, this);
  static GNestedFragmentReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GNestedFragmentReq.serializer, json);
}

abstract class GPokemonCardReq
    implements
        Built<GPokemonCardReq, GPokemonCardReqBuilder>,
        _i1.FragmentRequest<_i2.GPokemonCardData, _i3.GPokemonCardVars> {
  GPokemonCardReq._();

  factory GPokemonCardReq([Function(GPokemonCardReqBuilder b) updates]) =
      _$GPokemonCardReq;

  static void _initializeBuilder(GPokemonCardReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'PokemonCard';
  _i3.GPokemonCardVars get vars;
  _i5.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPokemonCardData parseData(Map<String, dynamic> json) =>
      _i2.GPokemonCardData.fromJson(json);
  static Serializer<GPokemonCardReq> get serializer =>
      _$gPokemonCardReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GPokemonCardReq.serializer, this);
  static GPokemonCardReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPokemonCardReq.serializer, json);
}
