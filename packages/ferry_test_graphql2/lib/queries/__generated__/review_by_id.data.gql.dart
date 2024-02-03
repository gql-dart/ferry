// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'review_by_id.data.gql.g.dart';

abstract class GReviewsByIDData
    implements Built<GReviewsByIDData, GReviewsByIDDataBuilder> {
  GReviewsByIDData._();

  factory GReviewsByIDData([void Function(GReviewsByIDDataBuilder b) updates]) =
      _$GReviewsByIDData;

  static void _initializeBuilder(GReviewsByIDDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GReviewsByIDData_review? get review;
  static Serializer<GReviewsByIDData> get serializer =>
      _$gReviewsByIDDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewsByIDData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewsByIDData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewsByIDData.serializer,
        json,
      );
}

abstract class GReviewsByIDData_review
    implements Built<GReviewsByIDData_review, GReviewsByIDData_reviewBuilder> {
  GReviewsByIDData_review._();

  factory GReviewsByIDData_review(
          [void Function(GReviewsByIDData_reviewBuilder b) updates]) =
      _$GReviewsByIDData_review;

  static void _initializeBuilder(GReviewsByIDData_reviewBuilder b) =>
      b..G__typename = 'Review';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  _i2.GEpisode? get episode;
  int get stars;
  String? get commentary;
  DateTime? get createdAt;
  BuiltList<DateTime> get seenOn;
  static Serializer<GReviewsByIDData_review> get serializer =>
      _$gReviewsByIDDataReviewSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewsByIDData_review.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewsByIDData_review? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewsByIDData_review.serializer,
        json,
      );
}
