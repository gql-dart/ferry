// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'human_with_args.var.gql.g.dart';

abstract class GHumanWithArgsVars
    implements Built<GHumanWithArgsVars, GHumanWithArgsVarsBuilder> {
  GHumanWithArgsVars._();

  factory GHumanWithArgsVars([Function(GHumanWithArgsVarsBuilder b) updates]) =
      _$GHumanWithArgsVars;

  String get id;
  String? get friendsAfter;
  static Serializer<GHumanWithArgsVars> get serializer =>
      _$gHumanWithArgsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanWithArgsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHumanWithArgsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanWithArgsVars.serializer,
        json,
      );
}
