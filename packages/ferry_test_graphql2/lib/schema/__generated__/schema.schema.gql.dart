// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i2;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i3;
import 'package:gql_exec/value.dart' as _i1;

part 'schema.schema.gql.g.dart';

class GEpisode extends EnumClass {
  const GEpisode._(String name) : super(name);

  static const GEpisode NEWHOPE = _$gEpisodeNEWHOPE;

  static const GEpisode EMPIRE = _$gEpisodeEMPIRE;

  static const GEpisode JEDI = _$gEpisodeJEDI;

  static Serializer<GEpisode> get serializer => _$gEpisodeSerializer;
  static BuiltSet<GEpisode> get values => _$gEpisodeValues;
  static GEpisode valueOf(String name) => _$gEpisodeValueOf(name);
}

class GLengthUnit extends EnumClass {
  const GLengthUnit._(String name) : super(name);

  static const GLengthUnit METER = _$gLengthUnitMETER;

  static const GLengthUnit FOOT = _$gLengthUnitFOOT;

  static Serializer<GLengthUnit> get serializer => _$gLengthUnitSerializer;
  static BuiltSet<GLengthUnit> get values => _$gLengthUnitValues;
  static GLengthUnit valueOf(String name) => _$gLengthUnitValueOf(name);
}

abstract class GReviewInput
    implements Built<GReviewInput, GReviewInputBuilder> {
  GReviewInput._();

  factory GReviewInput([Function(GReviewInputBuilder b) updates]) =
      _$GReviewInput;

  int get stars;
  _i1.Value<String>? get commentary;
  _i1.Value<GColorInput>? get favorite_color;
  _i1.Value<BuiltList<DateTime?>>? get seenOn;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GReviewInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GReviewInput.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GReviewInput> get serializer => GReviewInputSerializer();
}

class GReviewInputSerializer extends StructuredSerializer<GReviewInput> {
  final String wireName = 'GReviewInput';

  final Iterable<Type> types = const [GReviewInput, _$GReviewInput];

  Iterable<Object?> serialize(
    Serializers serializers,
    GReviewInput object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('stars');
    result.add(serializers.serialize(object.stars,
        specifiedType: const FullType(int)));
    final _$commentaryvalue = object.commentary;
    if (_$commentaryvalue != null) {
      result.add('commentary');
      result.add(serializers.serialize(_$commentaryvalue!.value,
          specifiedType: const FullType(String)));
    }
    final _$favorite_colorvalue = object.favorite_color;
    if (_$favorite_colorvalue != null) {
      result.add('favorite_color');
      result.add(serializers.serialize(_$favorite_colorvalue!.value,
          specifiedType: const FullType(GColorInput)));
    }
    final _$seenOnvalue = object.seenOn;
    if (_$seenOnvalue != null) {
      result.add('seenOn');
      result.add(serializers.serialize(_$seenOnvalue!.value,
          specifiedType: const FullType(BuiltList, [FullType(DateTime)])));
    }
    return result;
  }

  GReviewInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GReviewInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stars':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.stars = fieldValue;
          break;
        case 'commentary':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.commentary = _i1.Value(fieldValue);
          break;
        case 'favorite_color':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(GColorInput)) as GColorInput;
          builder.favorite_color = _i1.Value(fieldValue);
          break;
        case 'seenOn':
          var fieldValue = serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, [FullType(DateTime)]))
              as BuiltList<DateTime>;
          builder.seenOn = _i1.Value(fieldValue);
          break;
      }
    }
    return builder.build();
  }
}

abstract class GColorInput implements Built<GColorInput, GColorInputBuilder> {
  GColorInput._();

  factory GColorInput([Function(GColorInputBuilder b) updates]) = _$GColorInput;

  int get red;
  int get green;
  int get blue;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GColorInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GColorInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GColorInput.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GColorInput> get serializer => GColorInputSerializer();
}

class GColorInputSerializer extends StructuredSerializer<GColorInput> {
  final String wireName = 'GColorInput';

  final Iterable<Type> types = const [GColorInput, _$GColorInput];

  Iterable<Object?> serialize(
    Serializers serializers,
    GColorInput object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('red');
    result.add(
        serializers.serialize(object.red, specifiedType: const FullType(int)));
    result.add('green');
    result.add(serializers.serialize(object.green,
        specifiedType: const FullType(int)));
    result.add('blue');
    result.add(
        serializers.serialize(object.blue, specifiedType: const FullType(int)));
    return result;
  }

  GColorInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GColorInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'red':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.red = fieldValue;
          break;
        case 'green':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.green = fieldValue;
          break;
        case 'blue':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.blue = fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

abstract class GISODate implements Built<GISODate, GISODateBuilder> {
  GISODate._();

  factory GISODate([String? value]) =>
      _$GISODate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GISODate> get serializer =>
      _i3.DefaultScalarSerializer<GISODate>(
          (Object serialized) => GISODate((serialized as String?)));
}

const Map<String, Set<String>> possibleTypesMap = {
  'Character': {
    'Human',
    'Droid',
  },
  'SearchResult': {
    'Human',
    'Droid',
    'Starship',
  },
};
