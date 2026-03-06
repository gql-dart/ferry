// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;

/// The query type for the schema.
class GReviewByOneOfData {
  const GReviewByOneOfData({
    this.reviewBy,
    required this.G__typename,
  });

  factory GReviewByOneOfData.fromJson(Map<String, dynamic> json) {
    return GReviewByOneOfData(
      reviewBy: json['reviewBy'] == null
          ? null
          : GReviewByOneOfData_reviewBy.fromJson(
              (json['reviewBy'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GReviewByOneOfData_reviewBy? reviewBy;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$reviewByValue = this.reviewBy;
    _$result['reviewBy'] =
        _$reviewByValue == null ? null : _$reviewByValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GReviewByOneOfData copyWith({
    GReviewByOneOfData_reviewBy? reviewBy,
    bool reviewByIsSet = false,
    String? G__typename,
  }) {
    return GReviewByOneOfData(
      reviewBy: reviewByIsSet ? reviewBy : this.reviewBy,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewByOneOfData &&
            reviewBy == other.reviewBy &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, reviewBy, G__typename);
  }

  @override
  String toString() {
    return 'GReviewByOneOfData(reviewBy: $reviewBy, G__typename: $G__typename)';
  }
}

class GReviewByOneOfData_reviewBy {
  const GReviewByOneOfData_reviewBy({
    this.episode,
    required this.stars,
    required this.G__typename,
  });

  factory GReviewByOneOfData_reviewBy.fromJson(Map<String, dynamic> json) {
    return GReviewByOneOfData_reviewBy(
      episode: json['episode'] == null
          ? null
          : _i1.GEpisode.fromJson((json['episode'] as String)),
      stars: (json['stars'] as int),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEpisode? episode;

  final int stars;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$episodeValue = this.episode;
    _$result['episode'] =
        _$episodeValue == null ? null : _$episodeValue.toJson();
    _$result['stars'] = this.stars;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GReviewByOneOfData_reviewBy copyWith({
    _i1.GEpisode? episode,
    bool episodeIsSet = false,
    int? stars,
    String? G__typename,
  }) {
    return GReviewByOneOfData_reviewBy(
      episode: episodeIsSet ? episode : this.episode,
      stars: stars ?? this.stars,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewByOneOfData_reviewBy &&
            episode == other.episode &&
            stars == other.stars &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, episode, stars, G__typename);
  }

  @override
  String toString() {
    return 'GReviewByOneOfData_reviewBy(episode: $episode, stars: $stars, G__typename: $G__typename)';
  }
}
