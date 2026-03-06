// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GCreateReviewVars {
  const GCreateReviewVars({
    this.episode = const Value.absent(),
    required this.review,
  });

  factory GCreateReviewVars.fromJson(Map<String, dynamic> json) {
    return GCreateReviewVars(
      episode: json.containsKey('episode')
          ? Value.present(json['episode'] == null
              ? null
              : _i1.GEpisode.fromJson((json['episode'] as String)))
          : Value.absent(),
      review:
          _i1.GReviewInput.fromJson((json['review'] as Map<String, dynamic>)),
    );
  }

  /// The episodes in the Star Wars trilogy.
  final Value<_i1.GEpisode> episode;

  /// Input object sent when creating a new review.
  final _i1.GReviewInput review;

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
    return _$result;
  }

  GCreateReviewVars copyWith({
    Value<_i1.GEpisode>? episode,
    _i1.GReviewInput? review,
  }) {
    return GCreateReviewVars(
      episode: episode ?? this.episode,
      review: review ?? this.review,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateReviewVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateReviewVars(episode: $episode, review: $review)';
  }
}
