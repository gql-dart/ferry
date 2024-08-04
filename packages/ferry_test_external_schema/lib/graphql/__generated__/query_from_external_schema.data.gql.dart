// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'query_from_external_schema.data.gql.g.dart';

abstract class GHumanQueryData
    implements Built<GHumanQueryData, GHumanQueryDataBuilder> {
  GHumanQueryData._();

  factory GHumanQueryData([void Function(GHumanQueryDataBuilder b) updates]) =
      _$GHumanQueryData;

  static void _initializeBuilder(GHumanQueryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHumanQueryData_human get human;
  static Serializer<GHumanQueryData> get serializer =>
      _$gHumanQueryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanQueryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanQueryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanQueryData.serializer,
        json,
      );
}

abstract class GHumanQueryData_human
    implements
        Built<GHumanQueryData_human, GHumanQueryData_humanBuilder>,
        GHumanFrag {
  GHumanQueryData_human._();

  factory GHumanQueryData_human(
          [void Function(GHumanQueryData_humanBuilder b) updates]) =
      _$GHumanQueryData_human;

  static void _initializeBuilder(GHumanQueryData_humanBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  DateTime get birthday;
  static Serializer<GHumanQueryData_human> get serializer =>
      _$gHumanQueryDataHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanQueryData_human.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanQueryData_human? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanQueryData_human.serializer,
        json,
      );
}

abstract class GHumanFrag {
  String get G__typename;
  String get id;
  DateTime get birthday;
  Map<String, dynamic> toJson();
}

abstract class GHumanFragData
    implements Built<GHumanFragData, GHumanFragDataBuilder>, GHumanFrag {
  GHumanFragData._();

  factory GHumanFragData([void Function(GHumanFragDataBuilder b) updates]) =
      _$GHumanFragData;

  static void _initializeBuilder(GHumanFragDataBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  DateTime get birthday;
  static Serializer<GHumanFragData> get serializer =>
      _$gHumanFragDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanFragData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanFragData.serializer,
        json,
      );
}
