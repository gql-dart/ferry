// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_no_vars.var.gql.g.dart';

abstract class GHeroNoVarsVars
    implements Built<GHeroNoVarsVars, GHeroNoVarsVarsBuilder> {
  GHeroNoVarsVars._();

  factory GHeroNoVarsVars([Function(GHeroNoVarsVarsBuilder b) updates]) =
      _$GHeroNoVarsVars;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroNoVarsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroNoVarsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroNoVarsVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroNoVarsVars> get serializer =>
      GHeroNoVarsVarsSerializer();
}

class GHeroNoVarsVarsSerializer extends StructuredSerializer<GHeroNoVarsVars> {
  final String wireName = 'GHeroNoVarsVars';

  final Iterable<Type> types = const [GHeroNoVarsVars, _$GHeroNoVarsVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroNoVarsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    return result;
  }

  GHeroNoVarsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroNoVarsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        
      }
    }
    return builder.build();
  }
}
