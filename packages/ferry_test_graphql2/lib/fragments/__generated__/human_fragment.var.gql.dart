// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'human_fragment.var.gql.g.dart';

abstract class GHumanFragmentVars
    implements Built<GHumanFragmentVars, GHumanFragmentVarsBuilder> {
  GHumanFragmentVars._();

  factory GHumanFragmentVars(
          [void Function(GHumanFragmentVarsBuilder b) updates]) =
      _$GHumanFragmentVars;

  String? get after;
  static Serializer<GHumanFragmentVars> get serializer =>
      _$gHumanFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanFragmentVars.serializer,
        json,
      );
}
