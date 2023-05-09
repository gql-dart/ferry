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

part 'create_review.var.gql.g.dart';

abstract class GCreateReviewVars
    implements Built<GCreateReviewVars, GCreateReviewVarsBuilder> {
  GCreateReviewVars._();

  factory GCreateReviewVars([Function(GCreateReviewVarsBuilder b) updates]) =
      _$GCreateReviewVars;

  _i2.Value<_i1.GEpisode>? get episode;
  _i1.GReviewInput get review;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GCreateReviewVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateReviewVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GCreateReviewVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GCreateReviewVars> get serializer =>
      GCreateReviewVarsSerializer();
}

class GCreateReviewVarsSerializer
    extends StructuredSerializer<GCreateReviewVars> {
  final String wireName = 'GCreateReviewVars';

  final Iterable<Type> types = const [GCreateReviewVars, _$GCreateReviewVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GCreateReviewVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    final _$episodevalue = object.episode;
    if (_$episodevalue != null) {
      result.add('episode');
      result.add(serializers.serialize(_$episodevalue!.value,
          specifiedType: const FullType(_i1.GEpisode)));
    }
    result.add('review');
    result.add(serializers.serialize(object.review,
        specifiedType: const FullType(_i1.GReviewInput)));
    return result;
  }

  GCreateReviewVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GCreateReviewVarsBuilder();
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
        case 'review':
          var fieldValue = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReviewInput))
              as _i1.GReviewInput;
          builder.review.replace(fieldValue);
          break;
      }
    }
    return builder.build();
  }
}
