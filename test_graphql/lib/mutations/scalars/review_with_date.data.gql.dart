// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'review_with_date.data.gql.g.dart';

abstract class GReviewWithDateData
    implements Built<GReviewWithDateData, GReviewWithDateDataBuilder> {
  GReviewWithDateData._();

  factory GReviewWithDateData(
      [Function(GReviewWithDateDataBuilder b) updates]) = _$GReviewWithDateData;

  @nullable
  GReviewWithDateData_createReview get createReview;
  static Serializer<GReviewWithDateData> get serializer =>
      _$gReviewWithDateDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GReviewWithDateData.serializer, this);
  static GReviewWithDateData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewWithDateData.serializer, json);
}

abstract class GReviewWithDateData_createReview
    implements
        Built<GReviewWithDateData_createReview,
            GReviewWithDateData_createReviewBuilder> {
  GReviewWithDateData_createReview._();

  factory GReviewWithDateData_createReview(
          [Function(GReviewWithDateData_createReviewBuilder b) updates]) =
      _$GReviewWithDateData_createReview;

  static void _initializeBuilder(GReviewWithDateData_createReviewBuilder b) =>
      b..G__typename = 'Review';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  _i2.GEpisode get episode;
  int get stars;
  @nullable
  String get commentary;
  @nullable
  DateTime get createdAt;
  BuiltList<DateTime> get seenOn;
  static Serializer<GReviewWithDateData_createReview> get serializer =>
      _$gReviewWithDateDataCreateReviewSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GReviewWithDateData_createReview.serializer, this);
  static GReviewWithDateData_createReview fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GReviewWithDateData_createReview.serializer, json);
}
