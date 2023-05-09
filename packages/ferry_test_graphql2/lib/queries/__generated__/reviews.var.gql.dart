// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i3;
import 'package:gql_exec/value.dart' as _i2;

part 'reviews.var.gql.g.dart';

abstract class GReviewsVars
    implements Built<GReviewsVars, GReviewsVarsBuilder> {
  GReviewsVars._();

  factory GReviewsVars([Function(GReviewsVarsBuilder b) updates]) =
      _$GReviewsVars;

  _i2.Value<_i1.GEpisode>? get episode;
  _i2.Value<int>? get first;
  _i2.Value<int>? get offset;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GReviewsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewsVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GReviewsVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GReviewsVars> get serializer => GReviewsVarsSerializer();
}

class GReviewsVarsSerializer extends StructuredSerializer<GReviewsVars> {
  final String wireName = 'GReviewsVars';

  final Iterable<Type> types = const [GReviewsVars, _$GReviewsVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GReviewsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    final _$episodevalue = object.episode;
    if (_$episodevalue != null) {
      result.add('episode');
      result.add(serializers.serialize(_$episodevalue!.value,
          specifiedType: const FullType(_i1.GEpisode)));
    }
    final _$firstvalue = object.first;
    if (_$firstvalue != null) {
      result.add('first');
      result.add(serializers.serialize(_$firstvalue!.value,
          specifiedType: const FullType(int)));
    }
    final _$offsetvalue = object.offset;
    if (_$offsetvalue != null) {
      result.add('offset');
      result.add(serializers.serialize(_$offsetvalue!.value,
          specifiedType: const FullType(int)));
    }
    return result;
  }

  GReviewsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GReviewsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode;
          builder.episode = _i2.Value(fieldValue);
          break;
        case 'first':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.first = _i2.Value(fieldValue);
          break;
        case 'offset':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.offset = _i2.Value(fieldValue);
          break;
      }
    }
    return builder.build();
  }
}
