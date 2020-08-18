// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'human_with_args.data.gql.g.dart';

abstract class GHumanWithArgsData
    implements Built<GHumanWithArgsData, GHumanWithArgsDataBuilder> {
  GHumanWithArgsData._();

  factory GHumanWithArgsData([Function(GHumanWithArgsDataBuilder b) updates]) =
      _$GHumanWithArgsData;

  @nullable
  GHumanWithArgsData_human get human;
  static Serializer<GHumanWithArgsData> get serializer =>
      _$gHumanWithArgsDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHumanWithArgsData.serializer, this);
  static GHumanWithArgsData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHumanWithArgsData.serializer, json);
}

abstract class GHumanWithArgsData_human
    implements
        Built<GHumanWithArgsData_human, GHumanWithArgsData_humanBuilder> {
  GHumanWithArgsData_human._();

  factory GHumanWithArgsData_human(
          [Function(GHumanWithArgsData_humanBuilder b) updates]) =
      _$GHumanWithArgsData_human;

  static void _initializeBuilder(GHumanWithArgsData_humanBuilder b) =>
      b..G__typename = 'Human';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  @nullable
  double get height;
  static Serializer<GHumanWithArgsData_human> get serializer =>
      _$gHumanWithArgsDataHumanSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHumanWithArgsData_human.serializer, this);
  static GHumanWithArgsData_human fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHumanWithArgsData_human.serializer, json);
}
