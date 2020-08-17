// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;
import 'package:pokemon_explorer/serializers.gql.dart' as _i1;

part 'schema.schema.gql.g.dart';

abstract class GAddAttackInput
    implements Built<GAddAttackInput, GAddAttackInputBuilder> {
  GAddAttackInput._();

  factory GAddAttackInput([Function(GAddAttackInputBuilder b) updates]) =
      _$GAddAttackInput;

  @nullable
  String get name;
  @nullable
  String get type;
  @nullable
  int get damage;
  static Serializer<GAddAttackInput> get serializer =>
      _$gAddAttackInputSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAddAttackInput.serializer, this);
  static GAddAttackInput fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAddAttackInput.serializer, json);
}

abstract class GAddPokemonAttackInput
    implements Built<GAddPokemonAttackInput, GAddPokemonAttackInputBuilder> {
  GAddPokemonAttackInput._();

  factory GAddPokemonAttackInput(
          [Function(GAddPokemonAttackInputBuilder b) updates]) =
      _$GAddPokemonAttackInput;

  @nullable
  BuiltList<GAttackRef> get fast;
  @nullable
  BuiltList<GAttackRef> get special;
  static Serializer<GAddPokemonAttackInput> get serializer =>
      _$gAddPokemonAttackInputSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAddPokemonAttackInput.serializer, this);
  static GAddPokemonAttackInput fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAddPokemonAttackInput.serializer, json);
}

abstract class GAddPokemonDimensionInput
    implements
        Built<GAddPokemonDimensionInput, GAddPokemonDimensionInputBuilder> {
  GAddPokemonDimensionInput._();

  factory GAddPokemonDimensionInput(
          [Function(GAddPokemonDimensionInputBuilder b) updates]) =
      _$GAddPokemonDimensionInput;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GAddPokemonDimensionInput> get serializer =>
      _$gAddPokemonDimensionInputSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAddPokemonDimensionInput.serializer, this);
  static GAddPokemonDimensionInput fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAddPokemonDimensionInput.serializer, json);
}

abstract class GAddPokemonEvolutionRequirementInput
    implements
        Built<GAddPokemonEvolutionRequirementInput,
            GAddPokemonEvolutionRequirementInputBuilder> {
  GAddPokemonEvolutionRequirementInput._();

  factory GAddPokemonEvolutionRequirementInput(
          [Function(GAddPokemonEvolutionRequirementInputBuilder b) updates]) =
      _$GAddPokemonEvolutionRequirementInput;

  @nullable
  int get amount;
  @nullable
  String get name;
  static Serializer<GAddPokemonEvolutionRequirementInput> get serializer =>
      _$gAddPokemonEvolutionRequirementInputSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GAddPokemonEvolutionRequirementInput.serializer, this);
  static GAddPokemonEvolutionRequirementInput fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAddPokemonEvolutionRequirementInput.serializer, json);
}

abstract class GAddPokemonInput
    implements Built<GAddPokemonInput, GAddPokemonInputBuilder> {
  GAddPokemonInput._();

  factory GAddPokemonInput([Function(GAddPokemonInputBuilder b) updates]) =
      _$GAddPokemonInput;

  @nullable
  String get number;
  @nullable
  String get name;
  @nullable
  GPokemonDimensionRef get weight;
  @nullable
  GPokemonDimensionRef get height;
  @nullable
  String get classification;
  @nullable
  BuiltList<String> get types;
  @nullable
  BuiltList<String> get resistant;
  @nullable
  GPokemonAttackRef get attacks;
  @nullable
  BuiltList<String> get weaknesses;
  @nullable
  double get fleeRate;
  @nullable
  int get maxCP;
  @nullable
  BuiltList<GPokemonRef> get evolutions;
  @nullable
  GPokemonEvolutionRequirementRef get evolutionRequirements;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  static Serializer<GAddPokemonInput> get serializer =>
      _$gAddPokemonInputSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAddPokemonInput.serializer, this);
  static GAddPokemonInput fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAddPokemonInput.serializer, json);
}

abstract class GAttackOrder
    implements Built<GAttackOrder, GAttackOrderBuilder> {
  GAttackOrder._();

  factory GAttackOrder([Function(GAttackOrderBuilder b) updates]) =
      _$GAttackOrder;

  @nullable
  GAttackOrderable get asc;
  @nullable
  GAttackOrderable get desc;
  @nullable
  GAttackOrder get then;
  static Serializer<GAttackOrder> get serializer => _$gAttackOrderSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAttackOrder.serializer, this);
  static GAttackOrder fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAttackOrder.serializer, json);
}

class GAttackOrderable extends EnumClass {
  const GAttackOrderable._(String name) : super(name);

  @BuiltValueEnumConst(wireName: 'name')
  static const GAttackOrderable Gname = _$gAttackOrderableGname;

  static const GAttackOrderable type = _$gAttackOrderabletype;

  static const GAttackOrderable damage = _$gAttackOrderabledamage;

  static Serializer<GAttackOrderable> get serializer =>
      _$gAttackOrderableSerializer;
  static BuiltSet<GAttackOrderable> get values => _$gAttackOrderableValues;
  static GAttackOrderable valueOf(String name) =>
      _$gAttackOrderableValueOf(name);
}

abstract class GAttackRef implements Built<GAttackRef, GAttackRefBuilder> {
  GAttackRef._();

  factory GAttackRef([Function(GAttackRefBuilder b) updates]) = _$GAttackRef;

  @nullable
  String get name;
  @nullable
  String get type;
  @nullable
  int get damage;
  static Serializer<GAttackRef> get serializer => _$gAttackRefSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAttackRef.serializer, this);
  static GAttackRef fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAttackRef.serializer, json);
}

abstract class GAuthRule implements Built<GAuthRule, GAuthRuleBuilder> {
  GAuthRule._();

  factory GAuthRule([Function(GAuthRuleBuilder b) updates]) = _$GAuthRule;

  @nullable
  BuiltList<GAuthRule> get and;
  @nullable
  BuiltList<GAuthRule> get or;
  @nullable
  GAuthRule get not;
  @nullable
  String get rule;
  static Serializer<GAuthRule> get serializer => _$gAuthRuleSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAuthRule.serializer, this);
  static GAuthRule fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAuthRule.serializer, json);
}

abstract class GCustomHTTP implements Built<GCustomHTTP, GCustomHTTPBuilder> {
  GCustomHTTP._();

  factory GCustomHTTP([Function(GCustomHTTPBuilder b) updates]) = _$GCustomHTTP;

  String get url;
  GHTTPMethod get method;
  @nullable
  String get body;
  @nullable
  String get graphql;
  @nullable
  GMode get mode;
  BuiltList<String> get forwardHeaders;
  BuiltList<String> get secretHeaders;
  BuiltList<String> get introspectionHeaders;
  @nullable
  bool get skipIntrospection;
  static Serializer<GCustomHTTP> get serializer => _$gCustomHTTPSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GCustomHTTP.serializer, this);
  static GCustomHTTP fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCustomHTTP.serializer, json);
}

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime(serialized));
}

abstract class GDateTimeFilter
    implements Built<GDateTimeFilter, GDateTimeFilterBuilder> {
  GDateTimeFilter._();

  factory GDateTimeFilter([Function(GDateTimeFilterBuilder b) updates]) =
      _$GDateTimeFilter;

  @nullable
  GDateTime get eq;
  @nullable
  GDateTime get le;
  @nullable
  GDateTime get lt;
  @nullable
  GDateTime get ge;
  @nullable
  GDateTime get gt;
  static Serializer<GDateTimeFilter> get serializer =>
      _$gDateTimeFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GDateTimeFilter.serializer, this);
  static GDateTimeFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDateTimeFilter.serializer, json);
}

class GDgraphIndex extends EnumClass {
  const GDgraphIndex._(String name) : super(name);

  @BuiltValueEnumConst(wireName: 'int')
  static const GDgraphIndex Gint = _$gDgraphIndexGint;

  static const GDgraphIndex float = _$gDgraphIndexfloat;

  @BuiltValueEnumConst(wireName: 'bool')
  static const GDgraphIndex Gbool = _$gDgraphIndexGbool;

  static const GDgraphIndex hash = _$gDgraphIndexhash;

  static const GDgraphIndex exact = _$gDgraphIndexexact;

  static const GDgraphIndex term = _$gDgraphIndexterm;

  static const GDgraphIndex fulltext = _$gDgraphIndexfulltext;

  static const GDgraphIndex trigram = _$gDgraphIndextrigram;

  static const GDgraphIndex regexp = _$gDgraphIndexregexp;

  static const GDgraphIndex year = _$gDgraphIndexyear;

  static const GDgraphIndex month = _$gDgraphIndexmonth;

  static const GDgraphIndex day = _$gDgraphIndexday;

  static const GDgraphIndex hour = _$gDgraphIndexhour;

  static Serializer<GDgraphIndex> get serializer => _$gDgraphIndexSerializer;
  static BuiltSet<GDgraphIndex> get values => _$gDgraphIndexValues;
  static GDgraphIndex valueOf(String name) => _$gDgraphIndexValueOf(name);
}

abstract class GFloatFilter
    implements Built<GFloatFilter, GFloatFilterBuilder> {
  GFloatFilter._();

  factory GFloatFilter([Function(GFloatFilterBuilder b) updates]) =
      _$GFloatFilter;

  @nullable
  double get eq;
  @nullable
  double get le;
  @nullable
  double get lt;
  @nullable
  double get ge;
  @nullable
  double get gt;
  static Serializer<GFloatFilter> get serializer => _$gFloatFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GFloatFilter.serializer, this);
  static GFloatFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFloatFilter.serializer, json);
}

class GHTTPMethod extends EnumClass {
  const GHTTPMethod._(String name) : super(name);

  static const GHTTPMethod GET = _$gHTTPMethodGET;

  static const GHTTPMethod POST = _$gHTTPMethodPOST;

  static const GHTTPMethod PUT = _$gHTTPMethodPUT;

  static const GHTTPMethod PATCH = _$gHTTPMethodPATCH;

  static const GHTTPMethod DELETE = _$gHTTPMethodDELETE;

  static Serializer<GHTTPMethod> get serializer => _$gHTTPMethodSerializer;
  static BuiltSet<GHTTPMethod> get values => _$gHTTPMethodValues;
  static GHTTPMethod valueOf(String name) => _$gHTTPMethodValueOf(name);
}

abstract class GIntFilter implements Built<GIntFilter, GIntFilterBuilder> {
  GIntFilter._();

  factory GIntFilter([Function(GIntFilterBuilder b) updates]) = _$GIntFilter;

  @nullable
  int get eq;
  @nullable
  int get le;
  @nullable
  int get lt;
  @nullable
  int get ge;
  @nullable
  int get gt;
  static Serializer<GIntFilter> get serializer => _$gIntFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GIntFilter.serializer, this);
  static GIntFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIntFilter.serializer, json);
}

class GMode extends EnumClass {
  const GMode._(String name) : super(name);

  static const GMode BATCH = _$gModeBATCH;

  static const GMode SINGLE = _$gModeSINGLE;

  static Serializer<GMode> get serializer => _$gModeSerializer;
  static BuiltSet<GMode> get values => _$gModeValues;
  static GMode valueOf(String name) => _$gModeValueOf(name);
}

abstract class GPokemonAttackRef
    implements Built<GPokemonAttackRef, GPokemonAttackRefBuilder> {
  GPokemonAttackRef._();

  factory GPokemonAttackRef([Function(GPokemonAttackRefBuilder b) updates]) =
      _$GPokemonAttackRef;

  @nullable
  BuiltList<GAttackRef> get fast;
  @nullable
  BuiltList<GAttackRef> get special;
  static Serializer<GPokemonAttackRef> get serializer =>
      _$gPokemonAttackRefSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonAttackRef.serializer, this);
  static GPokemonAttackRef fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonAttackRef.serializer, json);
}

abstract class GPokemonDimensionOrder
    implements Built<GPokemonDimensionOrder, GPokemonDimensionOrderBuilder> {
  GPokemonDimensionOrder._();

  factory GPokemonDimensionOrder(
          [Function(GPokemonDimensionOrderBuilder b) updates]) =
      _$GPokemonDimensionOrder;

  @nullable
  GPokemonDimensionOrderable get asc;
  @nullable
  GPokemonDimensionOrderable get desc;
  @nullable
  GPokemonDimensionOrder get then;
  static Serializer<GPokemonDimensionOrder> get serializer =>
      _$gPokemonDimensionOrderSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonDimensionOrder.serializer, this);
  static GPokemonDimensionOrder fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonDimensionOrder.serializer, json);
}

class GPokemonDimensionOrderable extends EnumClass {
  const GPokemonDimensionOrderable._(String name) : super(name);

  static const GPokemonDimensionOrderable minimum =
      _$gPokemonDimensionOrderableminimum;

  static const GPokemonDimensionOrderable maximum =
      _$gPokemonDimensionOrderablemaximum;

  static Serializer<GPokemonDimensionOrderable> get serializer =>
      _$gPokemonDimensionOrderableSerializer;
  static BuiltSet<GPokemonDimensionOrderable> get values =>
      _$gPokemonDimensionOrderableValues;
  static GPokemonDimensionOrderable valueOf(String name) =>
      _$gPokemonDimensionOrderableValueOf(name);
}

abstract class GPokemonDimensionRef
    implements Built<GPokemonDimensionRef, GPokemonDimensionRefBuilder> {
  GPokemonDimensionRef._();

  factory GPokemonDimensionRef(
          [Function(GPokemonDimensionRefBuilder b) updates]) =
      _$GPokemonDimensionRef;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GPokemonDimensionRef> get serializer =>
      _$gPokemonDimensionRefSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonDimensionRef.serializer, this);
  static GPokemonDimensionRef fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonDimensionRef.serializer, json);
}

abstract class GPokemonEvolutionRequirementOrder
    implements
        Built<GPokemonEvolutionRequirementOrder,
            GPokemonEvolutionRequirementOrderBuilder> {
  GPokemonEvolutionRequirementOrder._();

  factory GPokemonEvolutionRequirementOrder(
          [Function(GPokemonEvolutionRequirementOrderBuilder b) updates]) =
      _$GPokemonEvolutionRequirementOrder;

  @nullable
  GPokemonEvolutionRequirementOrderable get asc;
  @nullable
  GPokemonEvolutionRequirementOrderable get desc;
  @nullable
  GPokemonEvolutionRequirementOrder get then;
  static Serializer<GPokemonEvolutionRequirementOrder> get serializer =>
      _$gPokemonEvolutionRequirementOrderSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonEvolutionRequirementOrder.serializer, this);
  static GPokemonEvolutionRequirementOrder fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPokemonEvolutionRequirementOrder.serializer, json);
}

class GPokemonEvolutionRequirementOrderable extends EnumClass {
  const GPokemonEvolutionRequirementOrderable._(String name) : super(name);

  static const GPokemonEvolutionRequirementOrderable amount =
      _$gPokemonEvolutionRequirementOrderableamount;

  @BuiltValueEnumConst(wireName: 'name')
  static const GPokemonEvolutionRequirementOrderable Gname =
      _$gPokemonEvolutionRequirementOrderableGname;

  static Serializer<GPokemonEvolutionRequirementOrderable> get serializer =>
      _$gPokemonEvolutionRequirementOrderableSerializer;
  static BuiltSet<GPokemonEvolutionRequirementOrderable> get values =>
      _$gPokemonEvolutionRequirementOrderableValues;
  static GPokemonEvolutionRequirementOrderable valueOf(String name) =>
      _$gPokemonEvolutionRequirementOrderableValueOf(name);
}

abstract class GPokemonEvolutionRequirementRef
    implements
        Built<GPokemonEvolutionRequirementRef,
            GPokemonEvolutionRequirementRefBuilder> {
  GPokemonEvolutionRequirementRef._();

  factory GPokemonEvolutionRequirementRef(
          [Function(GPokemonEvolutionRequirementRefBuilder b) updates]) =
      _$GPokemonEvolutionRequirementRef;

  @nullable
  int get amount;
  @nullable
  String get name;
  static Serializer<GPokemonEvolutionRequirementRef> get serializer =>
      _$gPokemonEvolutionRequirementRefSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GPokemonEvolutionRequirementRef.serializer, this);
  static GPokemonEvolutionRequirementRef fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPokemonEvolutionRequirementRef.serializer, json);
}

abstract class GPokemonFilter
    implements Built<GPokemonFilter, GPokemonFilterBuilder> {
  GPokemonFilter._();

  factory GPokemonFilter([Function(GPokemonFilterBuilder b) updates]) =
      _$GPokemonFilter;

  BuiltList<String> get id;
  @nullable
  GStringFullTextFilter get name;
  @nullable
  GPokemonFilter get and;
  @nullable
  GPokemonFilter get or;
  @nullable
  GPokemonFilter get not;
  static Serializer<GPokemonFilter> get serializer =>
      _$gPokemonFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonFilter.serializer, this);
  static GPokemonFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonFilter.serializer, json);
}

abstract class GPokemonOrder
    implements Built<GPokemonOrder, GPokemonOrderBuilder> {
  GPokemonOrder._();

  factory GPokemonOrder([Function(GPokemonOrderBuilder b) updates]) =
      _$GPokemonOrder;

  @nullable
  GPokemonOrderable get asc;
  @nullable
  GPokemonOrderable get desc;
  @nullable
  GPokemonOrder get then;
  static Serializer<GPokemonOrder> get serializer => _$gPokemonOrderSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonOrder.serializer, this);
  static GPokemonOrder fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonOrder.serializer, json);
}

class GPokemonOrderable extends EnumClass {
  const GPokemonOrderable._(String name) : super(name);

  static const GPokemonOrderable number = _$gPokemonOrderablenumber;

  @BuiltValueEnumConst(wireName: 'name')
  static const GPokemonOrderable Gname = _$gPokemonOrderableGname;

  static const GPokemonOrderable classification =
      _$gPokemonOrderableclassification;

  static const GPokemonOrderable types = _$gPokemonOrderabletypes;

  static const GPokemonOrderable resistant = _$gPokemonOrderableresistant;

  static const GPokemonOrderable weaknesses = _$gPokemonOrderableweaknesses;

  static const GPokemonOrderable fleeRate = _$gPokemonOrderablefleeRate;

  static const GPokemonOrderable maxCP = _$gPokemonOrderablemaxCP;

  static const GPokemonOrderable maxHP = _$gPokemonOrderablemaxHP;

  static const GPokemonOrderable image = _$gPokemonOrderableimage;

  static Serializer<GPokemonOrderable> get serializer =>
      _$gPokemonOrderableSerializer;
  static BuiltSet<GPokemonOrderable> get values => _$gPokemonOrderableValues;
  static GPokemonOrderable valueOf(String name) =>
      _$gPokemonOrderableValueOf(name);
}

abstract class GPokemonPatch
    implements Built<GPokemonPatch, GPokemonPatchBuilder> {
  GPokemonPatch._();

  factory GPokemonPatch([Function(GPokemonPatchBuilder b) updates]) =
      _$GPokemonPatch;

  @nullable
  String get number;
  @nullable
  String get name;
  @nullable
  GPokemonDimensionRef get weight;
  @nullable
  GPokemonDimensionRef get height;
  @nullable
  String get classification;
  @nullable
  BuiltList<String> get types;
  @nullable
  BuiltList<String> get resistant;
  @nullable
  GPokemonAttackRef get attacks;
  @nullable
  BuiltList<String> get weaknesses;
  @nullable
  double get fleeRate;
  @nullable
  int get maxCP;
  @nullable
  BuiltList<GPokemonRef> get evolutions;
  @nullable
  GPokemonEvolutionRequirementRef get evolutionRequirements;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  static Serializer<GPokemonPatch> get serializer => _$gPokemonPatchSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonPatch.serializer, this);
  static GPokemonPatch fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonPatch.serializer, json);
}

abstract class GPokemonRef implements Built<GPokemonRef, GPokemonRefBuilder> {
  GPokemonRef._();

  factory GPokemonRef([Function(GPokemonRefBuilder b) updates]) = _$GPokemonRef;

  @nullable
  String get id;
  @nullable
  String get number;
  @nullable
  String get name;
  @nullable
  GPokemonDimensionRef get weight;
  @nullable
  GPokemonDimensionRef get height;
  @nullable
  String get classification;
  @nullable
  BuiltList<String> get types;
  @nullable
  BuiltList<String> get resistant;
  @nullable
  GPokemonAttackRef get attacks;
  @nullable
  BuiltList<String> get weaknesses;
  @nullable
  double get fleeRate;
  @nullable
  int get maxCP;
  @nullable
  BuiltList<GPokemonRef> get evolutions;
  @nullable
  GPokemonEvolutionRequirementRef get evolutionRequirements;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  static Serializer<GPokemonRef> get serializer => _$gPokemonRefSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPokemonRef.serializer, this);
  static GPokemonRef fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPokemonRef.serializer, json);
}

abstract class GStringExactFilter
    implements Built<GStringExactFilter, GStringExactFilterBuilder> {
  GStringExactFilter._();

  factory GStringExactFilter([Function(GStringExactFilterBuilder b) updates]) =
      _$GStringExactFilter;

  @nullable
  String get eq;
  @nullable
  String get le;
  @nullable
  String get lt;
  @nullable
  String get ge;
  @nullable
  String get gt;
  static Serializer<GStringExactFilter> get serializer =>
      _$gStringExactFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GStringExactFilter.serializer, this);
  static GStringExactFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStringExactFilter.serializer, json);
}

abstract class GStringFullTextFilter
    implements Built<GStringFullTextFilter, GStringFullTextFilterBuilder> {
  GStringFullTextFilter._();

  factory GStringFullTextFilter(
          [Function(GStringFullTextFilterBuilder b) updates]) =
      _$GStringFullTextFilter;

  @nullable
  String get alloftext;
  @nullable
  String get anyoftext;
  static Serializer<GStringFullTextFilter> get serializer =>
      _$gStringFullTextFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GStringFullTextFilter.serializer, this);
  static GStringFullTextFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStringFullTextFilter.serializer, json);
}

abstract class GStringHashFilter
    implements Built<GStringHashFilter, GStringHashFilterBuilder> {
  GStringHashFilter._();

  factory GStringHashFilter([Function(GStringHashFilterBuilder b) updates]) =
      _$GStringHashFilter;

  @nullable
  String get eq;
  static Serializer<GStringHashFilter> get serializer =>
      _$gStringHashFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GStringHashFilter.serializer, this);
  static GStringHashFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStringHashFilter.serializer, json);
}

abstract class GStringRegExpFilter
    implements Built<GStringRegExpFilter, GStringRegExpFilterBuilder> {
  GStringRegExpFilter._();

  factory GStringRegExpFilter(
      [Function(GStringRegExpFilterBuilder b) updates]) = _$GStringRegExpFilter;

  @nullable
  String get regexp;
  static Serializer<GStringRegExpFilter> get serializer =>
      _$gStringRegExpFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GStringRegExpFilter.serializer, this);
  static GStringRegExpFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStringRegExpFilter.serializer, json);
}

abstract class GStringTermFilter
    implements Built<GStringTermFilter, GStringTermFilterBuilder> {
  GStringTermFilter._();

  factory GStringTermFilter([Function(GStringTermFilterBuilder b) updates]) =
      _$GStringTermFilter;

  @nullable
  String get allofterms;
  @nullable
  String get anyofterms;
  static Serializer<GStringTermFilter> get serializer =>
      _$gStringTermFilterSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GStringTermFilter.serializer, this);
  static GStringTermFilter fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStringTermFilter.serializer, json);
}

abstract class GUpdatePokemonInput
    implements Built<GUpdatePokemonInput, GUpdatePokemonInputBuilder> {
  GUpdatePokemonInput._();

  factory GUpdatePokemonInput(
      [Function(GUpdatePokemonInputBuilder b) updates]) = _$GUpdatePokemonInput;

  GPokemonFilter get filter;
  @nullable
  GPokemonPatch get set;
  @nullable
  GPokemonPatch get remove;
  static Serializer<GUpdatePokemonInput> get serializer =>
      _$gUpdatePokemonInputSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUpdatePokemonInput.serializer, this);
  static GUpdatePokemonInput fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdatePokemonInput.serializer, json);
}
