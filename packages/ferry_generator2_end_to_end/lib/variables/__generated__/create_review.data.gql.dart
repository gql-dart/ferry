// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;

/// The mutation type for the schema.
class GCreateReviewData {
  const GCreateReviewData({
    this.createReview,
    required this.G__typename,
  });

  factory GCreateReviewData.fromJson(Map<String, dynamic> json) {
    return GCreateReviewData(
      createReview: json['createReview'] == null
          ? null
          : GCreateReviewData_createReview.fromJson(
              (json['createReview'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Create a new review.
  final GCreateReviewData_createReview? createReview;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$createReviewValue = this.createReview;
    _$result['createReview'] =
        _$createReviewValue == null ? null : _$createReviewValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateReviewData copyWith({
    GCreateReviewData_createReview? createReview,
    bool createReviewIsSet = false,
    String? G__typename,
  }) {
    return GCreateReviewData(
      createReview: createReviewIsSet ? createReview : this.createReview,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateReviewData &&
            createReview == other.createReview &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createReview, G__typename);
  }

  @override
  String toString() {
    return 'GCreateReviewData(createReview: $createReview, G__typename: $G__typename)';
  }
}

class GCreateReviewData_createReview {
  const GCreateReviewData_createReview({
    this.episode,
    required this.stars,
    this.commentary,
    required this.G__typename,
  });

  factory GCreateReviewData_createReview.fromJson(Map<String, dynamic> json) {
    return GCreateReviewData_createReview(
      episode: json['episode'] == null
          ? null
          : _i1.GEpisode.fromJson((json['episode'] as String)),
      stars: (json['stars'] as int),
      commentary:
          json['commentary'] == null ? null : (json['commentary'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEpisode? episode;

  final int stars;

  final String? commentary;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$episodeValue = this.episode;
    _$result['episode'] =
        _$episodeValue == null ? null : _$episodeValue.toJson();
    _$result['stars'] = this.stars;
    final _$commentaryValue = this.commentary;
    _$result['commentary'] =
        _$commentaryValue == null ? null : _$commentaryValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateReviewData_createReview copyWith({
    _i1.GEpisode? episode,
    bool episodeIsSet = false,
    int? stars,
    String? commentary,
    bool commentaryIsSet = false,
    String? G__typename,
  }) {
    return GCreateReviewData_createReview(
      episode: episodeIsSet ? episode : this.episode,
      stars: stars ?? this.stars,
      commentary: commentaryIsSet ? commentary : this.commentary,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateReviewData_createReview &&
            episode == other.episode &&
            stars == other.stars &&
            commentary == other.commentary &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, episode, stars, commentary, G__typename);
  }

  @override
  String toString() {
    return 'GCreateReviewData_createReview(episode: $episode, stars: $stars, commentary: $commentary, G__typename: $G__typename)';
  }
}
