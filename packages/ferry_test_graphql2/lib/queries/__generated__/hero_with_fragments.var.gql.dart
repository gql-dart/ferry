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

part 'hero_with_fragments.var.gql.g.dart';

abstract class GHeroWithFragmentsVars
    implements Built<GHeroWithFragmentsVars, GHeroWithFragmentsVarsBuilder> {
  GHeroWithFragmentsVars._();

  factory GHeroWithFragmentsVars(
          [Function(GHeroWithFragmentsVarsBuilder b) updates]) =
      _$GHeroWithFragmentsVars;

  _i2.Value<_i1.GEpisode>? get episode;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GHeroWithFragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroWithFragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GHeroWithFragmentsVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroWithFragmentsVars> get serializer =>
      GHeroWithFragmentsVarsSerializer();
}

abstract class GheroDataVars
    implements Built<GheroDataVars, GheroDataVarsBuilder> {
  GheroDataVars._();

  factory GheroDataVars([Function(GheroDataVarsBuilder b) updates]) =
      _$GheroDataVars;

  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GheroDataVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GheroDataVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GheroDataVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GheroDataVars> get serializer => GheroDataVarsSerializer();
}

abstract class GcomparisonFieldsVars
    implements Built<GcomparisonFieldsVars, GcomparisonFieldsVarsBuilder> {
  GcomparisonFieldsVars._();

  factory GcomparisonFieldsVars(
          [Function(GcomparisonFieldsVarsBuilder b) updates]) =
      _$GcomparisonFieldsVars;

  _i2.Value<int>? get first;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GcomparisonFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GcomparisonFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GcomparisonFieldsVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GcomparisonFieldsVars> get serializer =>
      GcomparisonFieldsVarsSerializer();
}

class GHeroWithFragmentsVarsSerializer
    extends StructuredSerializer<GHeroWithFragmentsVars> {
  final String wireName = 'GHeroWithFragmentsVars';

  final Iterable<Type> types = const [
    GHeroWithFragmentsVars,
    _$GHeroWithFragmentsVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroWithFragmentsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    final _$episodevalue = object.episode;
    if (_$episodevalue != null) {
      result.add('episode');
      result.add(serializers.serialize(_$episodevalue!.value,
          specifiedType: const FullType(_i1.GEpisode)));
    }
    return result;
  }

  GHeroWithFragmentsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroWithFragmentsVarsBuilder();
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
      }
    }
    return builder.build();
  }
}

class GheroDataVarsSerializer extends StructuredSerializer<GheroDataVars> {
  final String wireName = 'GheroDataVars';

  final Iterable<Type> types = const [GheroDataVars, _$GheroDataVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GheroDataVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    return result;
  }

  GheroDataVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GheroDataVarsBuilder();
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

class GcomparisonFieldsVarsSerializer
    extends StructuredSerializer<GcomparisonFieldsVars> {
  final String wireName = 'GcomparisonFieldsVars';

  final Iterable<Type> types = const [
    GcomparisonFieldsVars,
    _$GcomparisonFieldsVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GcomparisonFieldsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    final _$firstvalue = object.first;
    if (_$firstvalue != null) {
      result.add('first');
      result.add(serializers.serialize(_$firstvalue!.value,
          specifiedType: const FullType(int)));
    }
    return result;
  }

  GcomparisonFieldsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GcomparisonFieldsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.first = _i2.Value(fieldValue);
          break;
      }
    }
    return builder.build();
  }
}
