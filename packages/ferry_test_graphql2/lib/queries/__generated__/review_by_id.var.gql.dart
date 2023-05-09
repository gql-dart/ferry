// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'review_by_id.var.gql.g.dart';

abstract class GReviewsByIDVars
    implements Built<GReviewsByIDVars, GReviewsByIDVarsBuilder> {
  GReviewsByIDVars._();

  factory GReviewsByIDVars([Function(GReviewsByIDVarsBuilder b) updates]) =
      _$GReviewsByIDVars;

  String get id;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewsByIDVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewsByIDVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewsByIDVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GReviewsByIDVars> get serializer =>
      GReviewsByIDVarsSerializer();
}

class GReviewsByIDVarsSerializer
    extends StructuredSerializer<GReviewsByIDVars> {
  final String wireName = 'GReviewsByIDVars';

  final Iterable<Type> types = const [GReviewsByIDVars, _$GReviewsByIDVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GReviewsByIDVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('id');
    result.add(serializers.serialize(object.id,
        specifiedType: const FullType(String)));
    return result;
  }

  GReviewsByIDVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GReviewsByIDVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.id = fieldValue;
          break;
      }
    }
    return builder.build();
  }
}
