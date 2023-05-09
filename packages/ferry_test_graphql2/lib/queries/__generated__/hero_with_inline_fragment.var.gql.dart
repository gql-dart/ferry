// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'hero_with_inline_fragment.var.gql.g.dart';

abstract class GHeroForEpisodeVars
    implements Built<GHeroForEpisodeVars, GHeroForEpisodeVarsBuilder> {
  GHeroForEpisodeVars._();

  factory GHeroForEpisodeVars(
      [Function(GHeroForEpisodeVarsBuilder b) updates]) = _$GHeroForEpisodeVars;

  _i1.GEpisode get ep;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHeroForEpisodeVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisodeVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHeroForEpisodeVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroForEpisodeVars> get serializer =>
      GHeroForEpisodeVarsSerializer();
}

abstract class GDroidFragmentVars
    implements Built<GDroidFragmentVars, GDroidFragmentVarsBuilder> {
  GDroidFragmentVars._();

  factory GDroidFragmentVars([Function(GDroidFragmentVarsBuilder b) updates]) =
      _$GDroidFragmentVars;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDroidFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDroidFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDroidFragmentVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GDroidFragmentVars> get serializer =>
      GDroidFragmentVarsSerializer();
}

class GHeroForEpisodeVarsSerializer
    extends StructuredSerializer<GHeroForEpisodeVars> {
  final String wireName = 'GHeroForEpisodeVars';

  final Iterable<Type> types = const [
    GHeroForEpisodeVars,
    _$GHeroForEpisodeVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroForEpisodeVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('ep');
    result.add(serializers.serialize(object.ep,
        specifiedType: const FullType(_i1.GEpisode)));
    return result;
  }

  GHeroForEpisodeVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroForEpisodeVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ep':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode;
          builder.ep = fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

class GDroidFragmentVarsSerializer
    extends StructuredSerializer<GDroidFragmentVars> {
  final String wireName = 'GDroidFragmentVars';

  final Iterable<Type> types = const [GDroidFragmentVars, _$GDroidFragmentVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GDroidFragmentVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    return result;
  }

  GDroidFragmentVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GDroidFragmentVarsBuilder();
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
