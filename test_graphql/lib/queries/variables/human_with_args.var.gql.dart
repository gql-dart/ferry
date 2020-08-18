// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'human_with_args.var.gql.g.dart';

abstract class GHumanWithArgsVars
    implements Built<GHumanWithArgsVars, GHumanWithArgsVarsBuilder> {
  GHumanWithArgsVars._();

  factory GHumanWithArgsVars([Function(GHumanWithArgsVarsBuilder b) updates]) =
      _$GHumanWithArgsVars;

  String get id;
  static Serializer<GHumanWithArgsVars> get serializer =>
      _$gHumanWithArgsVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHumanWithArgsVars.serializer, this);
  static GHumanWithArgsVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHumanWithArgsVars.serializer, json);
}
