// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'reviews.data.gql.g.dart';

abstract class GReviewsData
    implements Built<GReviewsData, GReviewsDataBuilder> {
  GReviewsData._();

  factory GReviewsData([Function(GReviewsDataBuilder b) updates]) =
      _$GReviewsData;

  static void _initializeBuilder(GReviewsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GReviewsData_reviews>? get reviews;
  static Serializer<GReviewsData> get serializer => _$gReviewsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReviewsData.serializer, this)
          as Map<String, dynamic>);
  static GReviewsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewsData.serializer, json);
}

abstract class GReviewsData_reviews
    implements Built<GReviewsData_reviews, GReviewsData_reviewsBuilder> {
  GReviewsData_reviews._();

  factory GReviewsData_reviews(
          [Function(GReviewsData_reviewsBuilder b) updates]) =
      _$GReviewsData_reviews;

  static void _initializeBuilder(GReviewsData_reviewsBuilder b) =>
      b..G__typename = 'Review';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  _i2.GEpisode? get episode;
  int get stars;
  String? get commentary;
  DateTime? get createdAt;
  BuiltList<DateTime> get seenOn;
  static Serializer<GReviewsData_reviews> get serializer =>
      _$gReviewsDataReviewsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReviewsData_reviews.serializer, this)
          as Map<String, dynamic>);
  static GReviewsData_reviews? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewsData_reviews.serializer, json);
}
