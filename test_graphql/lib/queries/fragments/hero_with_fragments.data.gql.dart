// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'hero_with_fragments.data.gql.g.dart';

abstract class GHeroWithFragmentsData
    implements Built<GHeroWithFragmentsData, GHeroWithFragmentsDataBuilder> {
  GHeroWithFragmentsData._();

  factory GHeroWithFragmentsData(
          [Function(GHeroWithFragmentsDataBuilder b) updates]) =
      _$GHeroWithFragmentsData;

  @nullable
  GHeroWithFragmentsData_hero get hero;
  static Serializer<GHeroWithFragmentsData> get serializer =>
      _$gHeroWithFragmentsDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroWithFragmentsData.serializer, this);
  static GHeroWithFragmentsData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroWithFragmentsData.serializer, json);
}

abstract class GHeroWithFragmentsData_hero
    implements
        Built<GHeroWithFragmentsData_hero, GHeroWithFragmentsData_heroBuilder>,
        GcomparisonFields {
  GHeroWithFragmentsData_hero._();

  factory GHeroWithFragmentsData_hero(
          [Function(GHeroWithFragmentsData_heroBuilder b) updates]) =
      _$GHeroWithFragmentsData_hero;

  static void _initializeBuilder(GHeroWithFragmentsData_heroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  GHeroWithFragmentsData_hero_friendsConnection get friendsConnection;
  static Serializer<GHeroWithFragmentsData_hero> get serializer =>
      _$gHeroWithFragmentsDataHeroSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GHeroWithFragmentsData_hero.serializer, this);
  static GHeroWithFragmentsData_hero fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroWithFragmentsData_hero.serializer, json);
}

abstract class GHeroWithFragmentsData_hero_friendsConnection
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection,
            GHeroWithFragmentsData_hero_friendsConnectionBuilder>,
        GcomparisonFields_friendsConnection {
  GHeroWithFragmentsData_hero_friendsConnection._();

  factory GHeroWithFragmentsData_hero_friendsConnection(
      [Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection;

  static void _initializeBuilder(
          GHeroWithFragmentsData_hero_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  int get totalCount;
  @nullable
  BuiltList<GHeroWithFragmentsData_hero_friendsConnection_edges> get edges;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection>
      get serializer => _$gHeroWithFragmentsDataHeroFriendsConnectionSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GHeroWithFragmentsData_hero_friendsConnection.serializer, this);
  static GHeroWithFragmentsData_hero_friendsConnection fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHeroWithFragmentsData_hero_friendsConnection.serializer, json);
}

abstract class GHeroWithFragmentsData_hero_friendsConnection_edges
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection_edges,
            GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder>,
        GcomparisonFields_friendsConnection_edges {
  GHeroWithFragmentsData_hero_friendsConnection_edges._();

  factory GHeroWithFragmentsData_hero_friendsConnection_edges(
      [Function(GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection_edges;

  static void _initializeBuilder(
          GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder b) =>
      b..G__typename = 'FriendsEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GHeroWithFragmentsData_hero_friendsConnection_edges_node get node;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection_edges>
      get serializer =>
          _$gHeroWithFragmentsDataHeroFriendsConnectionEdgesSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GHeroWithFragmentsData_hero_friendsConnection_edges.serializer, this);
  static GHeroWithFragmentsData_hero_friendsConnection_edges fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHeroWithFragmentsData_hero_friendsConnection_edges.serializer, json);
}

abstract class GHeroWithFragmentsData_hero_friendsConnection_edges_node
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection_edges_node,
            GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder>,
        GcomparisonFields_friendsConnection_edges_node,
        GheroData {
  GHeroWithFragmentsData_hero_friendsConnection_edges_node._();

  factory GHeroWithFragmentsData_hero_friendsConnection_edges_node(
      [Function(
              GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection_edges_node;

  static void _initializeBuilder(
          GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection_edges_node>
      get serializer =>
          _$gHeroWithFragmentsDataHeroFriendsConnectionEdgesNodeSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GHeroWithFragmentsData_hero_friendsConnection_edges_node.serializer,
      this);
  static GHeroWithFragmentsData_hero_friendsConnection_edges_node fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHeroWithFragmentsData_hero_friendsConnection_edges_node.serializer,
          json);
}

abstract class GheroData {
  String get G__typename;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GheroDataData
    implements Built<GheroDataData, GheroDataDataBuilder>, GheroData {
  GheroDataData._();

  factory GheroDataData([Function(GheroDataDataBuilder b) updates]) =
      _$GheroDataData;

  static void _initializeBuilder(GheroDataDataBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GheroDataData> get serializer => _$gheroDataDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GheroDataData.serializer, this);
  static GheroDataData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GheroDataData.serializer, json);
}

abstract class GcomparisonFields implements GheroData {
  String get G__typename;
  String get id;
  String get name;
  GcomparisonFields_friendsConnection get friendsConnection;
  Map<String, dynamic> toJson();
}

abstract class GcomparisonFields_friendsConnection {
  String get G__typename;
  int get totalCount;
  BuiltList<GcomparisonFields_friendsConnection_edges> get edges;
  Map<String, dynamic> toJson();
}

abstract class GcomparisonFields_friendsConnection_edges {
  String get G__typename;
  GcomparisonFields_friendsConnection_edges_node get node;
  Map<String, dynamic> toJson();
}

abstract class GcomparisonFields_friendsConnection_edges_node
    implements GheroData {
  String get G__typename;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GcomparisonFieldsData
    implements
        Built<GcomparisonFieldsData, GcomparisonFieldsDataBuilder>,
        GcomparisonFields,
        GheroData {
  GcomparisonFieldsData._();

  factory GcomparisonFieldsData(
          [Function(GcomparisonFieldsDataBuilder b) updates]) =
      _$GcomparisonFieldsData;

  static void _initializeBuilder(GcomparisonFieldsDataBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  GcomparisonFieldsData_friendsConnection get friendsConnection;
  static Serializer<GcomparisonFieldsData> get serializer =>
      _$gcomparisonFieldsDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GcomparisonFieldsData.serializer, this);
  static GcomparisonFieldsData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GcomparisonFieldsData.serializer, json);
}

abstract class GcomparisonFieldsData_friendsConnection
    implements
        Built<GcomparisonFieldsData_friendsConnection,
            GcomparisonFieldsData_friendsConnectionBuilder>,
        GcomparisonFields_friendsConnection {
  GcomparisonFieldsData_friendsConnection._();

  factory GcomparisonFieldsData_friendsConnection(
      [Function(GcomparisonFieldsData_friendsConnectionBuilder b)
          updates]) = _$GcomparisonFieldsData_friendsConnection;

  static void _initializeBuilder(
          GcomparisonFieldsData_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  int get totalCount;
  @nullable
  BuiltList<GcomparisonFieldsData_friendsConnection_edges> get edges;
  static Serializer<GcomparisonFieldsData_friendsConnection> get serializer =>
      _$gcomparisonFieldsDataFriendsConnectionSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GcomparisonFieldsData_friendsConnection.serializer, this);
  static GcomparisonFieldsData_friendsConnection fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GcomparisonFieldsData_friendsConnection.serializer, json);
}

abstract class GcomparisonFieldsData_friendsConnection_edges
    implements
        Built<GcomparisonFieldsData_friendsConnection_edges,
            GcomparisonFieldsData_friendsConnection_edgesBuilder>,
        GcomparisonFields_friendsConnection_edges {
  GcomparisonFieldsData_friendsConnection_edges._();

  factory GcomparisonFieldsData_friendsConnection_edges(
      [Function(GcomparisonFieldsData_friendsConnection_edgesBuilder b)
          updates]) = _$GcomparisonFieldsData_friendsConnection_edges;

  static void _initializeBuilder(
          GcomparisonFieldsData_friendsConnection_edgesBuilder b) =>
      b..G__typename = 'FriendsEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GcomparisonFieldsData_friendsConnection_edges_node get node;
  static Serializer<GcomparisonFieldsData_friendsConnection_edges>
      get serializer => _$gcomparisonFieldsDataFriendsConnectionEdgesSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GcomparisonFieldsData_friendsConnection_edges.serializer, this);
  static GcomparisonFieldsData_friendsConnection_edges fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GcomparisonFieldsData_friendsConnection_edges.serializer, json);
}

abstract class GcomparisonFieldsData_friendsConnection_edges_node
    implements
        Built<GcomparisonFieldsData_friendsConnection_edges_node,
            GcomparisonFieldsData_friendsConnection_edges_nodeBuilder>,
        GcomparisonFields_friendsConnection_edges_node,
        GheroData {
  GcomparisonFieldsData_friendsConnection_edges_node._();

  factory GcomparisonFieldsData_friendsConnection_edges_node(
      [Function(GcomparisonFieldsData_friendsConnection_edges_nodeBuilder b)
          updates]) = _$GcomparisonFieldsData_friendsConnection_edges_node;

  static void _initializeBuilder(
          GcomparisonFieldsData_friendsConnection_edges_nodeBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GcomparisonFieldsData_friendsConnection_edges_node>
      get serializer =>
          _$gcomparisonFieldsDataFriendsConnectionEdgesNodeSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GcomparisonFieldsData_friendsConnection_edges_node.serializer, this);
  static GcomparisonFieldsData_friendsConnection_edges_node fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GcomparisonFieldsData_friendsConnection_edges_node.serializer, json);
}
