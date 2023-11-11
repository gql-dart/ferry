// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_author.data.gql.g.dart';

abstract class GGetAuthorByIdData
    implements Built<GGetAuthorByIdData, GGetAuthorByIdDataBuilder> {
  GGetAuthorByIdData._();

  factory GGetAuthorByIdData([Function(GGetAuthorByIdDataBuilder b) updates]) =
      _$GGetAuthorByIdData;

  static void _initializeBuilder(GGetAuthorByIdDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetAuthorByIdData_author? get author;
  static Serializer<GGetAuthorByIdData> get serializer =>
      _$gGetAuthorByIdDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorByIdData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorByIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorByIdData.serializer,
        json,
      );
}

abstract class GGetAuthorByIdData_author
    implements
        Built<GGetAuthorByIdData_author, GGetAuthorByIdData_authorBuilder> {
  GGetAuthorByIdData_author._();

  factory GGetAuthorByIdData_author(
          [Function(GGetAuthorByIdData_authorBuilder b) updates]) =
      _$GGetAuthorByIdData_author;

  static void _initializeBuilder(GGetAuthorByIdData_authorBuilder b) =>
      b..G__typename = 'Author';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get firstName;
  String get lastName;
  GGetAuthorByIdData_author_quotes? get quotes;
  static Serializer<GGetAuthorByIdData_author> get serializer =>
      _$gGetAuthorByIdDataAuthorSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorByIdData_author.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorByIdData_author? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorByIdData_author.serializer,
        json,
      );
}

abstract class GGetAuthorByIdData_author_quotes
    implements
        Built<GGetAuthorByIdData_author_quotes,
            GGetAuthorByIdData_author_quotesBuilder> {
  GGetAuthorByIdData_author_quotes._();

  factory GGetAuthorByIdData_author_quotes(
          [Function(GGetAuthorByIdData_author_quotesBuilder b) updates]) =
      _$GGetAuthorByIdData_author_quotes;

  static void _initializeBuilder(GGetAuthorByIdData_author_quotesBuilder b) =>
      b..G__typename = 'QuoteConnection';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetAuthorByIdData_author_quotes_edges?>? get edges;
  static Serializer<GGetAuthorByIdData_author_quotes> get serializer =>
      _$gGetAuthorByIdDataAuthorQuotesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorByIdData_author_quotes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorByIdData_author_quotes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorByIdData_author_quotes.serializer,
        json,
      );
}

abstract class GGetAuthorByIdData_author_quotes_edges
    implements
        Built<GGetAuthorByIdData_author_quotes_edges,
            GGetAuthorByIdData_author_quotes_edgesBuilder> {
  GGetAuthorByIdData_author_quotes_edges._();

  factory GGetAuthorByIdData_author_quotes_edges(
          [Function(GGetAuthorByIdData_author_quotes_edgesBuilder b) updates]) =
      _$GGetAuthorByIdData_author_quotes_edges;

  static void _initializeBuilder(
          GGetAuthorByIdData_author_quotes_edgesBuilder b) =>
      b..G__typename = 'QuoteEdge';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetAuthorByIdData_author_quotes_edges_node? get node;
  static Serializer<GGetAuthorByIdData_author_quotes_edges> get serializer =>
      _$gGetAuthorByIdDataAuthorQuotesEdgesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorByIdData_author_quotes_edges.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorByIdData_author_quotes_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorByIdData_author_quotes_edges.serializer,
        json,
      );
}

abstract class GGetAuthorByIdData_author_quotes_edges_node
    implements
        Built<GGetAuthorByIdData_author_quotes_edges_node,
            GGetAuthorByIdData_author_quotes_edges_nodeBuilder> {
  GGetAuthorByIdData_author_quotes_edges_node._();

  factory GGetAuthorByIdData_author_quotes_edges_node(
      [Function(GGetAuthorByIdData_author_quotes_edges_nodeBuilder b)
          updates]) = _$GGetAuthorByIdData_author_quotes_edges_node;

  static void _initializeBuilder(
          GGetAuthorByIdData_author_quotes_edges_nodeBuilder b) =>
      b..G__typename = 'Quote';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @BuiltValueField(wireName: '_id')
  String get G_id;
  String get id;
  String get text;
  static Serializer<GGetAuthorByIdData_author_quotes_edges_node>
      get serializer => _$gGetAuthorByIdDataAuthorQuotesEdgesNodeSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAuthorByIdData_author_quotes_edges_node.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAuthorByIdData_author_quotes_edges_node? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAuthorByIdData_author_quotes_edges_node.serializer,
        json,
      );
}
