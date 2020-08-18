// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:test_graphql/schema/serializers.gql.dart' as _i2;

part 'aliased_hero.var.gql.g.dart';

abstract class GAliasedHeroVars
    implements Built<GAliasedHeroVars, GAliasedHeroVarsBuilder> {
  GAliasedHeroVars._();

  factory GAliasedHeroVars([Function(GAliasedHeroVarsBuilder b) updates]) =
      _$GAliasedHeroVars;

  _i1.GEpisode get ep;
  static Serializer<GAliasedHeroVars> get serializer =>
      _$gAliasedHeroVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GAliasedHeroVars.serializer, this);
  static GAliasedHeroVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GAliasedHeroVars.serializer, json);
}
