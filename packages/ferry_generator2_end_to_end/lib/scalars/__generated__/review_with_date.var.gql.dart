// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/custom/date.dart';
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GReviewWithDateVars {
  const GReviewWithDateVars({
    this.episode = const Value.absent(),
    required this.review,
    this.createdAt = const Value.absent(),
  });

  factory GReviewWithDateVars.fromJson(Map<String, dynamic> json) {
    return GReviewWithDateVars(
      episode: json.containsKey('episode')
          ? Value.present(json['episode'] == null
              ? null
              : _i1.GEpisode.fromJson((json['episode'] as String)))
          : Value.absent(),
      review:
          _i1.GReviewInput.fromJson((json['review'] as Map<String, dynamic>)),
      createdAt: json.containsKey('createdAt')
          ? Value.present(json['createdAt'] == null
              ? null
              : customDateFromJson(json['createdAt']))
          : Value.absent(),
    );
  }

  /// The episodes in the Star Wars trilogy.
  final Value<_i1.GEpisode> episode;

  /// Input object sent when creating a new review.
  final _i1.GReviewInput review;

  final Value<CustomDate> createdAt;

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
    final _$createdAtValue = this.createdAt;
    if (_$createdAtValue.isPresent) {
      final _$createdAtRequired = _$createdAtValue.requireValue;
      _$result['createdAt'] = _$createdAtRequired == null
          ? null
          : customDateToJson(_$createdAtRequired);
    }
    return _$result;
  }

  GReviewWithDateVars copyWith({
    Value<_i1.GEpisode>? episode,
    _i1.GReviewInput? review,
    Value<CustomDate>? createdAt,
  }) {
    return GReviewWithDateVars(
      episode: episode ?? this.episode,
      review: review ?? this.review,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewWithDateVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GReviewWithDateVars(episode: $episode, review: $review, createdAt: $createdAt)';
  }
}
