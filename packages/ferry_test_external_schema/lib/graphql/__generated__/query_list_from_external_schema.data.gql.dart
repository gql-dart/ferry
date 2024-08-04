// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_external_schema/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'query_list_from_external_schema.data.gql.g.dart';

abstract class GReviewsData
    implements Built<GReviewsData, GReviewsDataBuilder> {
  GReviewsData._();

  factory GReviewsData([void Function(GReviewsDataBuilder b) updates]) =
      _$GReviewsData;

  static void _initializeBuilder(GReviewsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GReviewsData_reviews?>? get reviews;
  static Serializer<GReviewsData> get serializer => _$gReviewsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewsData.serializer,
        json,
      );
}

abstract class GReviewsData_reviews
    implements Built<GReviewsData_reviews, GReviewsData_reviewsBuilder> {
  GReviewsData_reviews._();

  factory GReviewsData_reviews(
          [void Function(GReviewsData_reviewsBuilder b) updates]) =
      _$GReviewsData_reviews;

  static void _initializeBuilder(GReviewsData_reviewsBuilder b) =>
      b..G__typename = 'Review';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  DateTime? get createdAt;
  String? get commentary;
  static Serializer<GReviewsData_reviews> get serializer =>
      _$gReviewsDataReviewsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewsData_reviews.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewsData_reviews? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewsData_reviews.serializer,
        json,
      );
}
