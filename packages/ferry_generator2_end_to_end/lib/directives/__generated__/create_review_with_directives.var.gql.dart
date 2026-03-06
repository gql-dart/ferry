// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GCreateReviewWithDirectivesVars {
  const GCreateReviewWithDirectivesVars({
    this.episode = const Value.absent(),
    required this.review,
    required this.includeReview,
    required this.skipCommentary,
  });

  factory GCreateReviewWithDirectivesVars.fromJson(Map<String, dynamic> json) {
    return GCreateReviewWithDirectivesVars(
      episode: json.containsKey('episode')
          ? Value.present(json['episode'] == null
              ? null
              : _i1.GEpisode.fromJson((json['episode'] as String)))
          : Value.absent(),
      review:
          _i1.GReviewInput.fromJson((json['review'] as Map<String, dynamic>)),
      includeReview: (json['includeReview'] as bool),
      skipCommentary: (json['skipCommentary'] as bool),
    );
  }

  /// The episodes in the Star Wars trilogy.
  final Value<_i1.GEpisode> episode;

  /// Input object sent when creating a new review.
  final _i1.GReviewInput review;

  final bool includeReview;

  final bool skipCommentary;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$episodeValue = this.episode;
    if (_$episodeValue.isPresent) {
      final _$episodeRequired = _$episodeValue.requireValue;
      _$result['episode'] =
          _$episodeRequired == null ? null : _$episodeRequired.toJson();
    }
    final _$reviewValue = this.review;
    _$result['review'] = _$reviewValue.toJson();
    final _$includeReviewValue = this.includeReview;
    _$result['includeReview'] = _$includeReviewValue;
    final _$skipCommentaryValue = this.skipCommentary;
    _$result['skipCommentary'] = _$skipCommentaryValue;
    return _$result;
  }

  GCreateReviewWithDirectivesVars copyWith({
    Value<_i1.GEpisode>? episode,
    _i1.GReviewInput? review,
    bool? includeReview,
    bool? skipCommentary,
  }) {
    return GCreateReviewWithDirectivesVars(
      episode: episode ?? this.episode,
      review: review ?? this.review,
      includeReview: includeReview ?? this.includeReview,
      skipCommentary: skipCommentary ?? this.skipCommentary,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateReviewWithDirectivesVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateReviewWithDirectivesVars(episode: $episode, review: $review, includeReview: $includeReview, skipCommentary: $skipCommentary)';
  }
}
