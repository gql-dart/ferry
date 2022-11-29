// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_author.var.gql.g.dart';

abstract class GCreateAuthorVars
    implements Built<GCreateAuthorVars, GCreateAuthorVarsBuilder> {
  GCreateAuthorVars._();

  factory GCreateAuthorVars([Function(GCreateAuthorVarsBuilder b) updates]) =
      _$GCreateAuthorVars;

  String get firstName;
  String get lastName;
  static Serializer<GCreateAuthorVars> get serializer =>
      _$gCreateAuthorVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAuthorVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateAuthorVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAuthorVars.serializer,
        json,
      );
}
