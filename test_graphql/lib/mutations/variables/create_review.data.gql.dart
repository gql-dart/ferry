// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:test_graphql/schema/serializers.gql.dart' as _i1;

part 'create_review.data.gql.g.dart';

abstract class GCreateReviewData
    implements Built<GCreateReviewData, GCreateReviewDataBuilder> {
  GCreateReviewData._();

  factory GCreateReviewData([Function(GCreateReviewDataBuilder b) updates]) =
      _$GCreateReviewData;

  @nullable
  GCreateReviewData_createReview get createReview;
  static Serializer<GCreateReviewData> get serializer =>
      _$gCreateReviewDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GCreateReviewData.serializer, this);
  static GCreateReviewData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCreateReviewData.serializer, json);
}

abstract class GCreateReviewData_createReview
    implements
        Built<GCreateReviewData_createReview,
            GCreateReviewData_createReviewBuilder> {
  GCreateReviewData_createReview._();

  factory GCreateReviewData_createReview(
          [Function(GCreateReviewData_createReviewBuilder b) updates]) =
      _$GCreateReviewData_createReview;

  static void _initializeBuilder(GCreateReviewData_createReviewBuilder b) =>
      b..G__typename = 'Review';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  _i2.GEpisode get episode;
  int get stars;
  @nullable
  String get commentary;
  static Serializer<GCreateReviewData_createReview> get serializer =>
      _$gCreateReviewDataCreateReviewSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GCreateReviewData_createReview.serializer, this);
  static GCreateReviewData_createReview fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateReviewData_createReview.serializer, json);
}
