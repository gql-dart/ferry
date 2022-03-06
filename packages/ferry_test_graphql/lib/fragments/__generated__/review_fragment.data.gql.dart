// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'review_fragment.data.gql.g.dart';

abstract class GReviewFragment {
  String get G__typename;
  int get stars;
  String? get commentary;
  Map<String, dynamic> toJson();
}

abstract class GReviewFragmentData
    implements
        Built<GReviewFragmentData, GReviewFragmentDataBuilder>,
        GReviewFragment {
  GReviewFragmentData._();

  factory GReviewFragmentData(
      [Function(GReviewFragmentDataBuilder b) updates]) = _$GReviewFragmentData;

  static void _initializeBuilder(GReviewFragmentDataBuilder b) =>
      b..G__typename = 'Review';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get stars;
  String? get commentary;
  static Serializer<GReviewFragmentData> get serializer =>
      _$gReviewFragmentDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReviewFragmentData.serializer, this)
          as Map<String, dynamic>);
  static GReviewFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReviewFragmentData.serializer, json);
}
