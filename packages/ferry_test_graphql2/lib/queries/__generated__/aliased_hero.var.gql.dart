// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'aliased_hero.var.gql.g.dart';

abstract class GAliasedHeroVars
    implements Built<GAliasedHeroVars, GAliasedHeroVarsBuilder> {
  GAliasedHeroVars._();

  factory GAliasedHeroVars([Function(GAliasedHeroVarsBuilder b) updates]) =
      _$GAliasedHeroVars;

  _i1.GEpisode get ep;
  static Serializer<GAliasedHeroVars> get serializer =>
      _$gAliasedHeroVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GAliasedHeroVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAliasedHeroVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GAliasedHeroVars.serializer,
        json,
      );
}
