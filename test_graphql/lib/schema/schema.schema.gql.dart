// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

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
  @nullable
  String get commentary;
  @nullable
  GColorInput get favorite_color;
  @nullable
  BuiltList<DateTime> get seenOn;
  static Serializer<GReviewInput> get serializer => _$gReviewInputSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GReviewInput.serializer, this);
  static GReviewInput fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewInput.serializer, json);
}

abstract class GColorInput implements Built<GColorInput, GColorInputBuilder> {
  GColorInput._();

  factory GColorInput([Function(GColorInputBuilder b) updates]) = _$GColorInput;

  int get red;
  int get green;
  int get blue;
  static Serializer<GColorInput> get serializer => _$gColorInputSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GColorInput.serializer, this);
  static GColorInput fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GColorInput.serializer, json);
}

abstract class GISODate implements Built<GISODate, GISODateBuilder> {
  GISODate._();

  factory GISODate([String value]) =>
      _$GISODate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GISODate> get serializer =>
      _i2.DefaultScalarSerializer<GISODate>(
          (Object serialized) => GISODate(serialized));
}
