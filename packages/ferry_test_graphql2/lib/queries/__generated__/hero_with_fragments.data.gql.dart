// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_with_fragments.data.gql.g.dart';

abstract class GHeroWithFragmentsData
    implements Built<GHeroWithFragmentsData, GHeroWithFragmentsDataBuilder> {
  GHeroWithFragmentsData._();

  factory GHeroWithFragmentsData(
          [void Function(GHeroWithFragmentsDataBuilder b) updates]) =
      _$GHeroWithFragmentsData;

  static void _initializeBuilder(GHeroWithFragmentsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWithFragmentsData_hero? get hero;
  static Serializer<GHeroWithFragmentsData> get serializer =>
      _$gHeroWithFragmentsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsData.serializer,
        json,
      );
}

abstract class GHeroWithFragmentsData_hero
    implements
        Built<GHeroWithFragmentsData_hero, GHeroWithFragmentsData_heroBuilder>,
        GcomparisonFields {
  GHeroWithFragmentsData_hero._();

  factory GHeroWithFragmentsData_hero(
          [void Function(GHeroWithFragmentsData_heroBuilder b) updates]) =
      _$GHeroWithFragmentsData_hero;

  static void _initializeBuilder(GHeroWithFragmentsData_heroBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GHeroWithFragmentsData_hero_friendsConnection get friendsConnection;
  static Serializer<GHeroWithFragmentsData_hero> get serializer =>
      _$gHeroWithFragmentsDataHeroSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsData_hero.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsData_hero.serializer,
        json,
      );
}

abstract class GHeroWithFragmentsData_hero_friendsConnection
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection,
            GHeroWithFragmentsData_hero_friendsConnectionBuilder>,
        GcomparisonFields_friendsConnection {
  GHeroWithFragmentsData_hero_friendsConnection._();

  factory GHeroWithFragmentsData_hero_friendsConnection(
      [void Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection;

  static void _initializeBuilder(
          GHeroWithFragmentsData_hero_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int? get totalCount;
  @override
  BuiltList<GHeroWithFragmentsData_hero_friendsConnection_edges?>? get edges;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection>
      get serializer => _$gHeroWithFragmentsDataHeroFriendsConnectionSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsData_hero_friendsConnection.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsData_hero_friendsConnection? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsData_hero_friendsConnection.serializer,
        json,
      );
}

abstract class GHeroWithFragmentsData_hero_friendsConnection_edges
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection_edges,
            GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder>,
        GcomparisonFields_friendsConnection_edges {
  GHeroWithFragmentsData_hero_friendsConnection_edges._();

  factory GHeroWithFragmentsData_hero_friendsConnection_edges(
      [void Function(
              GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection_edges;

  static void _initializeBuilder(
          GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder b) =>
      b..G__typename = 'FriendsEdge';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GheroDataData? get node;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection_edges>
      get serializer =>
          _$gHeroWithFragmentsDataHeroFriendsConnectionEdgesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsData_hero_friendsConnection_edges.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsData_hero_friendsConnection_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsData_hero_friendsConnection_edges.serializer,
        json,
      );
}

abstract class GheroData {
  String get G__typename;
  String get id;
  String get name;
}

abstract class GheroDataData
    implements Built<GheroDataData, GheroDataDataBuilder>, GheroData {
  GheroDataData._();

  factory GheroDataData([void Function(GheroDataDataBuilder b) updates]) =
      _$GheroDataData;

  static void _initializeBuilder(GheroDataDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GheroDataData> get serializer => _$gheroDataDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroDataData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroDataData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroDataData.serializer,
        json,
      );
}

abstract class GcomparisonFields implements GheroData {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  GcomparisonFields_friendsConnection get friendsConnection;
}

abstract class GcomparisonFields_friendsConnection {
  String get G__typename;
  int? get totalCount;
  BuiltList<GcomparisonFields_friendsConnection_edges?>? get edges;
}

abstract class GcomparisonFields_friendsConnection_edges {
  String get G__typename;
  GheroData? get node;
}

abstract class GcomparisonFieldsData
    implements
        Built<GcomparisonFieldsData, GcomparisonFieldsDataBuilder>,
        GcomparisonFields,
        GheroData {
  GcomparisonFieldsData._();

  factory GcomparisonFieldsData(
          [void Function(GcomparisonFieldsDataBuilder b) updates]) =
      _$GcomparisonFieldsData;

  static void _initializeBuilder(GcomparisonFieldsDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GcomparisonFieldsData_friendsConnection get friendsConnection;
  static Serializer<GcomparisonFieldsData> get serializer =>
      _$gcomparisonFieldsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcomparisonFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcomparisonFieldsData.serializer,
        json,
      );
}

abstract class GcomparisonFieldsData_friendsConnection
    implements
        Built<GcomparisonFieldsData_friendsConnection,
            GcomparisonFieldsData_friendsConnectionBuilder>,
        GcomparisonFields_friendsConnection {
  GcomparisonFieldsData_friendsConnection._();

  factory GcomparisonFieldsData_friendsConnection(
      [void Function(GcomparisonFieldsData_friendsConnectionBuilder b)
          updates]) = _$GcomparisonFieldsData_friendsConnection;

  static void _initializeBuilder(
          GcomparisonFieldsData_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int? get totalCount;
  @override
  BuiltList<GcomparisonFieldsData_friendsConnection_edges?>? get edges;
  static Serializer<GcomparisonFieldsData_friendsConnection> get serializer =>
      _$gcomparisonFieldsDataFriendsConnectionSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcomparisonFieldsData_friendsConnection.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsData_friendsConnection? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcomparisonFieldsData_friendsConnection.serializer,
        json,
      );
}

abstract class GcomparisonFieldsData_friendsConnection_edges
    implements
        Built<GcomparisonFieldsData_friendsConnection_edges,
            GcomparisonFieldsData_friendsConnection_edgesBuilder>,
        GcomparisonFields_friendsConnection_edges {
  GcomparisonFieldsData_friendsConnection_edges._();

  factory GcomparisonFieldsData_friendsConnection_edges(
      [void Function(GcomparisonFieldsData_friendsConnection_edgesBuilder b)
          updates]) = _$GcomparisonFieldsData_friendsConnection_edges;

  static void _initializeBuilder(
          GcomparisonFieldsData_friendsConnection_edgesBuilder b) =>
      b..G__typename = 'FriendsEdge';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GheroDataData? get node;
  static Serializer<GcomparisonFieldsData_friendsConnection_edges>
      get serializer => _$gcomparisonFieldsDataFriendsConnectionEdgesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcomparisonFieldsData_friendsConnection_edges.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsData_friendsConnection_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcomparisonFieldsData_friendsConnection_edges.serializer,
        json,
      );
}
