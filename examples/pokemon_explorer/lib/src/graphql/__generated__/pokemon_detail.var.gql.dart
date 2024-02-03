// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/__generated__/serializers.gql.dart' as _i1;

part 'pokemon_detail.var.gql.g.dart';

abstract class GPokemonDetailVars
    implements Built<GPokemonDetailVars, GPokemonDetailVarsBuilder> {
  GPokemonDetailVars._();

  factory GPokemonDetailVars(
          [void Function(GPokemonDetailVarsBuilder b) updates]) =
      _$GPokemonDetailVars;

  String get id;
  static Serializer<GPokemonDetailVars> get serializer =>
      _$gPokemonDetailVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailVars.serializer,
        json,
      );
}
