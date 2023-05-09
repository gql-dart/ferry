// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'review_fragment.var.gql.g.dart';

abstract class GReviewFragmentVars
    implements Built<GReviewFragmentVars, GReviewFragmentVarsBuilder> {
  GReviewFragmentVars._();

  factory GReviewFragmentVars(
      [Function(GReviewFragmentVarsBuilder b) updates]) = _$GReviewFragmentVars;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewFragmentVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GReviewFragmentVars> get serializer =>
      GReviewFragmentVarsSerializer();
}

class GReviewFragmentVarsSerializer
    extends StructuredSerializer<GReviewFragmentVars> {
  final String wireName = 'GReviewFragmentVars';

  final Iterable<Type> types = const [
    GReviewFragmentVars,
    _$GReviewFragmentVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GReviewFragmentVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    return result;
  }

  GReviewFragmentVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GReviewFragmentVarsBuilder();
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
