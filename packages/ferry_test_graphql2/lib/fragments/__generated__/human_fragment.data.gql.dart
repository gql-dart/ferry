// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'human_fragment.data.gql.g.dart';

abstract class GHumanFragment {
  String get G__typename;
  String get id;
  String get name;
  double? get height;
  GHumanFragment_friendsConnection get friendsConnection;
  Map<String, dynamic> toJson();
}

abstract class GHumanFragment_friendsConnection {
  String get G__typename;
  BuiltList<GHumanFragment_friendsConnection_friends?>? get friends;
  Map<String, dynamic> toJson();
}

abstract class GHumanFragment_friendsConnection_friends {
  String get G__typename;
  String get id;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GHumanFragmentData
    implements
        Built<GHumanFragmentData, GHumanFragmentDataBuilder>,
        GHumanFragment {
  GHumanFragmentData._();

  factory GHumanFragmentData(
          [void Function(GHumanFragmentDataBuilder b) updates]) =
      _$GHumanFragmentData;

  static void _initializeBuilder(GHumanFragmentDataBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  double? get height;
  @override
  GHumanFragmentData_friendsConnection get friendsConnection;
  static Serializer<GHumanFragmentData> get serializer =>
      _$gHumanFragmentDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanFragmentData.serializer,
        json,
      );
}

abstract class GHumanFragmentData_friendsConnection
    implements
        Built<GHumanFragmentData_friendsConnection,
            GHumanFragmentData_friendsConnectionBuilder>,
        GHumanFragment_friendsConnection {
  GHumanFragmentData_friendsConnection._();

  factory GHumanFragmentData_friendsConnection(
      [void Function(GHumanFragmentData_friendsConnectionBuilder b)
          updates]) = _$GHumanFragmentData_friendsConnection;

  static void _initializeBuilder(
          GHumanFragmentData_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GHumanFragmentData_friendsConnection_friends?>? get friends;
  static Serializer<GHumanFragmentData_friendsConnection> get serializer =>
      _$gHumanFragmentDataFriendsConnectionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanFragmentData_friendsConnection.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragmentData_friendsConnection? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanFragmentData_friendsConnection.serializer,
        json,
      );
}

abstract class GHumanFragmentData_friendsConnection_friends
    implements
        Built<GHumanFragmentData_friendsConnection_friends,
            GHumanFragmentData_friendsConnection_friendsBuilder>,
        GHumanFragment_friendsConnection_friends {
  GHumanFragmentData_friendsConnection_friends._();

  factory GHumanFragmentData_friendsConnection_friends(
      [void Function(GHumanFragmentData_friendsConnection_friendsBuilder b)
          updates]) = _$GHumanFragmentData_friendsConnection_friends;

  static void _initializeBuilder(
          GHumanFragmentData_friendsConnection_friendsBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GHumanFragmentData_friendsConnection_friends>
      get serializer => _$gHumanFragmentDataFriendsConnectionFriendsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanFragmentData_friendsConnection_friends.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragmentData_friendsConnection_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanFragmentData_friendsConnection_friends.serializer,
        json,
      );
}
