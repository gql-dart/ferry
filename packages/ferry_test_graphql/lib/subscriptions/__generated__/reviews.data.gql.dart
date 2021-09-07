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
      b..G__typename = 'Subscription';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GReviewsData_reviewAdded? get reviewAdded;
  static Serializer<GReviewsData> get serializer => _$gReviewsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReviewsData.serializer, this)
          as Map<String, dynamic>);
  static GReviewsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewsData.serializer, json);
}

abstract class GReviewsData_reviewAdded
    implements
        Built<GReviewsData_reviewAdded, GReviewsData_reviewAddedBuilder> {
  GReviewsData_reviewAdded._();

  factory GReviewsData_reviewAdded(
          [Function(GReviewsData_reviewAddedBuilder b) updates]) =
      _$GReviewsData_reviewAdded;

  static void _initializeBuilder(GReviewsData_reviewAddedBuilder b) =>
      b..G__typename = 'Review';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  _i2.GEpisode? get episode;
  int get stars;
  String? get commentary;
  DateTime? get createdAt;
  BuiltList<DateTime> get seenOn;
  static Serializer<GReviewsData_reviewAdded> get serializer =>
      _$gReviewsDataReviewAddedSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReviewsData_reviewAdded.serializer, this)
          as Map<String, dynamic>);
  static GReviewsData_reviewAdded? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GReviewsData_reviewAdded.serializer, json);
}
