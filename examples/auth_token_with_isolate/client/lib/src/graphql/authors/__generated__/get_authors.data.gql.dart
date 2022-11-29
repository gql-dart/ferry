// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_authors.data.gql.g.dart';

abstract class GGetAuthorsData
    implements Built<GGetAuthorsData, GGetAuthorsDataBuilder> {
  GGetAuthorsData._();

  factory GGetAuthorsData([Function(GGetAuthorsDataBuilder b) updates]) =
      _$GGetAuthorsData;

  static void _initializeBuilder(GGetAuthorsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetAuthorsData_authors? get authors;
  static Serializer<GGetAuthorsData> get serializer =>
      _$gGetAuthorsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAuthorsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorsData.serializer,
        json,
      );
}

abstract class GGetAuthorsData_authors
    implements Built<GGetAuthorsData_authors, GGetAuthorsData_authorsBuilder> {
  GGetAuthorsData_authors._();

  factory GGetAuthorsData_authors(
          [Function(GGetAuthorsData_authorsBuilder b) updates]) =
      _$GGetAuthorsData_authors;

  static void _initializeBuilder(GGetAuthorsData_authorsBuilder b) =>
      b..G__typename = 'AuthorConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetAuthorsData_authors_edges?>? get edges;
  static Serializer<GGetAuthorsData_authors> get serializer =>
      _$gGetAuthorsDataAuthorsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorsData_authors.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAuthorsData_authors? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorsData_authors.serializer,
        json,
      );
}

abstract class GGetAuthorsData_authors_edges
    implements
        Built<GGetAuthorsData_authors_edges,
            GGetAuthorsData_authors_edgesBuilder> {
  GGetAuthorsData_authors_edges._();

  factory GGetAuthorsData_authors_edges(
          [Function(GGetAuthorsData_authors_edgesBuilder b) updates]) =
      _$GGetAuthorsData_authors_edges;

  static void _initializeBuilder(GGetAuthorsData_authors_edgesBuilder b) =>
      b..G__typename = 'AuthorEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetAuthorsData_authors_edges_node? get node;
  static Serializer<GGetAuthorsData_authors_edges> get serializer =>
      _$gGetAuthorsDataAuthorsEdgesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorsData_authors_edges.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAuthorsData_authors_edges? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorsData_authors_edges.serializer,
        json,
      );
}

abstract class GGetAuthorsData_authors_edges_node
    implements
        Built<GGetAuthorsData_authors_edges_node,
            GGetAuthorsData_authors_edges_nodeBuilder> {
  GGetAuthorsData_authors_edges_node._();

  factory GGetAuthorsData_authors_edges_node(
          [Function(GGetAuthorsData_authors_edges_nodeBuilder b) updates]) =
      _$GGetAuthorsData_authors_edges_node;

  static void _initializeBuilder(GGetAuthorsData_authors_edges_nodeBuilder b) =>
      b..G__typename = 'Author';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get firstName;
  String get lastName;
  static Serializer<GGetAuthorsData_authors_edges_node> get serializer =>
      _$gGetAuthorsDataAuthorsEdgesNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorsData_authors_edges_node.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAuthorsData_authors_edges_node? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorsData_authors_edges_node.serializer,
        json,
      );
}
