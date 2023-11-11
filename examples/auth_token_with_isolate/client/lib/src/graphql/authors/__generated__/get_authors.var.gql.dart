// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_authors.var.gql.g.dart';

abstract class GGetAuthorsVars
    implements Built<GGetAuthorsVars, GGetAuthorsVarsBuilder> {
  GGetAuthorsVars._();

  factory GGetAuthorsVars([Function(GGetAuthorsVarsBuilder b) updates]) =
      _$GGetAuthorsVars;

  static Serializer<GGetAuthorsVars> get serializer =>
      _$gGetAuthorsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorsVars.serializer,
        json,
      );
}
