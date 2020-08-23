// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:ferry_test_graphql/schema/serializers.gql.dart' as _i1;

part 'reviews.data.gql.g.dart';

abstract class GReviewsData
    implements Built<GReviewsData, GReviewsDataBuilder> {
  GReviewsData._();

  factory GReviewsData([Function(GReviewsDataBuilder b) updates]) =
      _$GReviewsData;

  @nullable
  BuiltList<GReviewsData_reviews> get reviews;
  static Serializer<GReviewsData> get serializer => _$gReviewsDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GReviewsData.serializer, this);
  static GReviewsData fromJson(Map<String, dynamic> json) =>
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
  @nullable
  _i2.GEpisode get episode;
  int get stars;
  @nullable
  String get commentary;
  @nullable
  DateTime get createdAt;
  BuiltList<DateTime> get seenOn;
  static Serializer<GReviewsData_reviews> get serializer =>
      _$gReviewsDataReviewsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GReviewsData_reviews.serializer, this);
  static GReviewsData_reviews fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewsData_reviews.serializer, json);
}
