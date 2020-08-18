// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'hero_no_vars.var.gql.g.dart';

abstract class GHeroNoVarsVars
    implements Built<GHeroNoVarsVars, GHeroNoVarsVarsBuilder> {
  GHeroNoVarsVars._();

  factory GHeroNoVarsVars([Function(GHeroNoVarsVarsBuilder b) updates]) =
      _$GHeroNoVarsVars;

  static Serializer<GHeroNoVarsVars> get serializer =>
      _$gHeroNoVarsVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroNoVarsVars.serializer, this);
  static GHeroNoVarsVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroNoVarsVars.serializer, json);
}
