// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:pokemon_explorer/serializers.gql.dart' as _i6;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.ast.gql.dart'
    as _i4;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.data.gql.dart'
    as _i2;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.var.gql.dart'
    as _i3;

part 'pokemon_card_fragment.req.gql.g.dart';

abstract class GNestedFragment
    implements
        Built<GNestedFragment, GNestedFragmentBuilder>,
        _i1.FragmentRequest<_i2.GNestedFragmentData, _i3.GNestedFragmentVars> {
  GNestedFragment._();

  factory GNestedFragment([Function(GNestedFragmentBuilder b) updates]) =
      _$GNestedFragment;

  static void _initializeBuilder(GNestedFragmentBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'NestedFragment';
  _i3.GNestedFragmentVars get vars;
  _i5.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GNestedFragmentData parseData(Map<String, dynamic> json) =>
      _i2.GNestedFragmentData.fromJson(json);
  static Serializer<GNestedFragment> get serializer =>
      _$gNestedFragmentSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GNestedFragment.serializer, this);
  static GNestedFragment fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GNestedFragment.serializer, json);
}

abstract class GPokemonCard
    implements
        Built<GPokemonCard, GPokemonCardBuilder>,
        _i1.FragmentRequest<_i2.GPokemonCardData, _i3.GPokemonCardVars> {
  GPokemonCard._();

  factory GPokemonCard([Function(GPokemonCardBuilder b) updates]) =
      _$GPokemonCard;

  static void _initializeBuilder(GPokemonCardBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'PokemonCard';
  _i3.GPokemonCardVars get vars;
  _i5.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPokemonCardData parseData(Map<String, dynamic> json) =>
      _i2.GPokemonCardData.fromJson(json);
  static Serializer<GPokemonCard> get serializer => _$gPokemonCardSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GPokemonCard.serializer, this);
  static GPokemonCard fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPokemonCard.serializer, json);
}
