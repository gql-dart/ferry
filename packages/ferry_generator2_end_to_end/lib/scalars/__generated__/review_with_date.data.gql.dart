// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/custom/date.dart';
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The mutation type for the schema.
class GReviewWithDateData {
  const GReviewWithDateData({
    this.createReview,
    required this.G__typename,
  });

  factory GReviewWithDateData.fromJson(Map<String, dynamic> json) {
    return GReviewWithDateData(
      createReview: json['createReview'] == null
          ? null
          : GReviewWithDateData_createReview.fromJson(
              (json['createReview'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Create a new review.
  final GReviewWithDateData_createReview? createReview;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$createReviewValue = this.createReview;
    _$result['createReview'] =
        _$createReviewValue == null ? null : _$createReviewValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GReviewWithDateData copyWith({
    GReviewWithDateData_createReview? createReview,
    bool createReviewIsSet = false,
    String? G__typename,
  }) {
    return GReviewWithDateData(
      createReview: createReviewIsSet ? createReview : this.createReview,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewWithDateData &&
            createReview == other.createReview &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createReview, G__typename);
  }

  @override
  String toString() {
    return 'GReviewWithDateData(createReview: $createReview, G__typename: $G__typename)';
  }
}

class GReviewWithDateData_createReview {
  GReviewWithDateData_createReview({
    this.episode,
    required this.stars,
    this.commentary,
    this.createdAt,
    required List<CustomDate> seenOn,
    required List<String> custom,
    required this.G__typename,
  })  : seenOn = List.unmodifiable(seenOn),
        custom = List.unmodifiable(custom);

  factory GReviewWithDateData_createReview.fromJson(Map<String, dynamic> json) {
    return GReviewWithDateData_createReview(
      episode: json['episode'] == null
          ? null
          : _i1.GEpisode.fromJson((json['episode'] as String)),
      stars: (json['stars'] as int),
      commentary:
          json['commentary'] == null ? null : (json['commentary'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : customDateFromJson(json['createdAt']),
      seenOn: List<CustomDate>.unmodifiable((json['seenOn'] as List<dynamic>)
          .map((_$e) => customDateFromJson(_$e))
          .toList()),
      custom: List<String>.unmodifiable(
          List<String>.from((json['custom'] as List<dynamic>))),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEpisode? episode;

  final int stars;

  final String? commentary;

  final CustomDate? createdAt;

  final List<CustomDate> seenOn;

  final List<String> custom;

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
    final _$createdAtValue = this.createdAt;
    _$result['createdAt'] =
        _$createdAtValue == null ? null : customDateToJson(_$createdAtValue);
    _$result['seenOn'] =
        this.seenOn.map((_$e) => customDateToJson(_$e)).toList();
    _$result['custom'] = this.custom.map((_$e) => _$e).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GReviewWithDateData_createReview copyWith({
    _i1.GEpisode? episode,
    bool episodeIsSet = false,
    int? stars,
    String? commentary,
    bool commentaryIsSet = false,
    CustomDate? createdAt,
    bool createdAtIsSet = false,
    List<CustomDate>? seenOn,
    List<String>? custom,
    String? G__typename,
  }) {
    return GReviewWithDateData_createReview(
      episode: episodeIsSet ? episode : this.episode,
      stars: stars ?? this.stars,
      commentary: commentaryIsSet ? commentary : this.commentary,
      createdAt: createdAtIsSet ? createdAt : this.createdAt,
      seenOn: seenOn ?? this.seenOn,
      custom: custom ?? this.custom,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewWithDateData_createReview &&
            episode == other.episode &&
            stars == other.stars &&
            commentary == other.commentary &&
            createdAt == other.createdAt &&
            _gqlUtils.listEquals(seenOn, other.seenOn) &&
            _gqlUtils.listEquals(custom, other.custom) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, episode, stars, commentary, createdAt,
        _gqlUtils.listHash(seenOn), _gqlUtils.listHash(custom), G__typename);
  }

  @override
  String toString() {
    return 'GReviewWithDateData_createReview(episode: $episode, stars: $stars, commentary: $commentary, createdAt: $createdAt, seenOn: $seenOn, custom: $custom, G__typename: $G__typename)';
  }
}
