// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i1;

part 'human_with_args.data.gql.g.dart';

abstract class GHumanWithArgsData
    implements Built<GHumanWithArgsData, GHumanWithArgsDataBuilder> {
  GHumanWithArgsData._();

  factory GHumanWithArgsData([Function(GHumanWithArgsDataBuilder b) updates]) =
      _$GHumanWithArgsData;

  static void _initializeBuilder(GHumanWithArgsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHumanWithArgsData_human get human;
  static Serializer<GHumanWithArgsData> get serializer =>
      _$gHumanWithArgsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHumanWithArgsData.serializer, this)
          as Map<String, dynamic>);
  static GHumanWithArgsData? fromJson(Map<String, dynamic> json) =>
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
  String get id;
  String get name;
  double? get height;
  GHumanWithArgsData_human_friendsConnection get friendsConnection;
  static Serializer<GHumanWithArgsData_human> get serializer =>
      _$gHumanWithArgsDataHumanSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHumanWithArgsData_human.serializer, this)
          as Map<String, dynamic>);
  static GHumanWithArgsData_human? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHumanWithArgsData_human.serializer, json);
}

abstract class GHumanWithArgsData_human_friendsConnection
    implements
        Built<GHumanWithArgsData_human_friendsConnection,
            GHumanWithArgsData_human_friendsConnectionBuilder> {
  GHumanWithArgsData_human_friendsConnection._();

  factory GHumanWithArgsData_human_friendsConnection(
      [Function(GHumanWithArgsData_human_friendsConnectionBuilder b)
          updates]) = _$GHumanWithArgsData_human_friendsConnection;

  static void _initializeBuilder(
          GHumanWithArgsData_human_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GHumanWithArgsData_human_friendsConnection_friends>? get friends;
  static Serializer<GHumanWithArgsData_human_friendsConnection>
      get serializer => _$gHumanWithArgsDataHumanFriendsConnectionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GHumanWithArgsData_human_friendsConnection.serializer, this)
      as Map<String, dynamic>);
  static GHumanWithArgsData_human_friendsConnection? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHumanWithArgsData_human_friendsConnection.serializer, json);
}

abstract class GHumanWithArgsData_human_friendsConnection_friends
    implements
        Built<GHumanWithArgsData_human_friendsConnection_friends,
            GHumanWithArgsData_human_friendsConnection_friendsBuilder> {
  GHumanWithArgsData_human_friendsConnection_friends._();

  factory GHumanWithArgsData_human_friendsConnection_friends(
      [Function(GHumanWithArgsData_human_friendsConnection_friendsBuilder b)
          updates]) = _$GHumanWithArgsData_human_friendsConnection_friends;

  static void _initializeBuilder(
          GHumanWithArgsData_human_friendsConnection_friendsBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GHumanWithArgsData_human_friendsConnection_friends>
      get serializer =>
          _$gHumanWithArgsDataHumanFriendsConnectionFriendsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GHumanWithArgsData_human_friendsConnection_friends.serializer, this)
      as Map<String, dynamic>);
  static GHumanWithArgsData_human_friendsConnection_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHumanWithArgsData_human_friendsConnection_friends.serializer, json);
}
