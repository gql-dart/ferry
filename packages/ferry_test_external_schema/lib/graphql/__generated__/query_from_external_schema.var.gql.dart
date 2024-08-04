// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'query_from_external_schema.var.gql.g.dart';

abstract class GHumanQueryVars
    implements Built<GHumanQueryVars, GHumanQueryVarsBuilder> {
  GHumanQueryVars._();

  factory GHumanQueryVars([void Function(GHumanQueryVarsBuilder b) updates]) =
      _$GHumanQueryVars;

  String get id;
  static Serializer<GHumanQueryVars> get serializer =>
      _$gHumanQueryVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanQueryVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanQueryVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanQueryVars.serializer,
        json,
      );
}

abstract class GHumanFragVars
    implements Built<GHumanFragVars, GHumanFragVarsBuilder> {
  GHumanFragVars._();

  factory GHumanFragVars([void Function(GHumanFragVarsBuilder b) updates]) =
      _$GHumanFragVars;

  static Serializer<GHumanFragVars> get serializer =>
      _$gHumanFragVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanFragVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanFragVars.serializer,
        json,
      );
}
