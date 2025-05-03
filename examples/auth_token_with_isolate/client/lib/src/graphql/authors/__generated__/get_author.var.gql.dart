// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_author.var.gql.g.dart';

abstract class GGetAuthorByIdVars
    implements Built<GGetAuthorByIdVars, GGetAuthorByIdVarsBuilder> {
  GGetAuthorByIdVars._();

  factory GGetAuthorByIdVars(
          [void Function(GGetAuthorByIdVarsBuilder b) updates]) =
      _$GGetAuthorByIdVars;

  String get id;
  static Serializer<GGetAuthorByIdVars> get serializer =>
      _$gGetAuthorByIdVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorByIdVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorByIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorByIdVars.serializer,
        json,
      );
}
