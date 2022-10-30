// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/__generated__/serializers.gql.dart' as _i1;

part 'pokemon_card_fragment.var.gql.g.dart';

abstract class GNestedFragmentVars
    implements Built<GNestedFragmentVars, GNestedFragmentVarsBuilder> {
  GNestedFragmentVars._();

  factory GNestedFragmentVars(
      [Function(GNestedFragmentVarsBuilder b) updates]) = _$GNestedFragmentVars;

  static Serializer<GNestedFragmentVars> get serializer =>
      _$gNestedFragmentVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNestedFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNestedFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNestedFragmentVars.serializer,
        json,
      );
}

abstract class GPokemonCardVars
    implements Built<GPokemonCardVars, GPokemonCardVarsBuilder> {
  GPokemonCardVars._();

  factory GPokemonCardVars([Function(GPokemonCardVarsBuilder b) updates]) =
      _$GPokemonCardVars;

  static Serializer<GPokemonCardVars> get serializer =>
      _$gPokemonCardVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCardVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPokemonCardVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCardVars.serializer,
        json,
      );
}
