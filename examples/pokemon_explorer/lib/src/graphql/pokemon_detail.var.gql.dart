// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokemon_explorer/serializers.gql.dart' as _i1;

part 'pokemon_detail.var.gql.g.dart';

abstract class GPokemonDetailVars
    implements Built<GPokemonDetailVars, GPokemonDetailVarsBuilder> {
  GPokemonDetailVars._();

  factory GPokemonDetailVars([Function(GPokemonDetailVarsBuilder b) updates]) =
      _$GPokemonDetailVars;

  @nullable
  String get id;
  static Serializer<GPokemonDetailVars> get serializer =>
      _$gPokemonDetailVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonDetailVars.serializer, this);
  static GPokemonDetailVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonDetailVars.serializer, json);
}
