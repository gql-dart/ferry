// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The query type for the schema.
class GPostsByLikesData {
  GPostsByLikesData({
    List<GPostsByLikesData_postsByLikes?>? postsByLikes,
    required this.G__typename,
  }) : postsByLikes =
            postsByLikes == null ? null : List.unmodifiable(postsByLikes);

  factory GPostsByLikesData.fromJson(Map<String, dynamic> json) {
    return GPostsByLikesData(
      postsByLikes: json['postsByLikes'] == null
          ? null
          : List<GPostsByLikesData_postsByLikes?>.unmodifiable(
              (json['postsByLikes'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GPostsByLikesData_postsByLikes.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GPostsByLikesData_postsByLikes?>? postsByLikes;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$postsByLikesValue = this.postsByLikes;
    _$result['postsByLikes'] = _$postsByLikesValue == null
        ? null
        : _$postsByLikesValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPostsByLikesData copyWith({
    List<GPostsByLikesData_postsByLikes?>? postsByLikes,
    bool postsByLikesIsSet = false,
    String? G__typename,
  }) {
    return GPostsByLikesData(
      postsByLikes: postsByLikesIsSet ? postsByLikes : this.postsByLikes,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostsByLikesData &&
            _gqlUtils.listEquals(postsByLikes, other.postsByLikes) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, _gqlUtils.listHash(postsByLikes), G__typename);
  }

  @override
  String toString() {
    return 'GPostsByLikesData(postsByLikes: $postsByLikes, G__typename: $G__typename)';
  }
}

class GPostsByLikesData_postsByLikes {
  const GPostsByLikesData_postsByLikes({
    required this.id,
    required this.body,
    required this.G__typename,
  });

  factory GPostsByLikesData_postsByLikes.fromJson(Map<String, dynamic> json) {
    return GPostsByLikesData_postsByLikes(
      id: (json['id'] as String),
      body: (json['body'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String body;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['body'] = this.body;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPostsByLikesData_postsByLikes copyWith({
    String? id,
    String? body,
    String? G__typename,
  }) {
    return GPostsByLikesData_postsByLikes(
      id: id ?? this.id,
      body: body ?? this.body,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostsByLikesData_postsByLikes &&
            id == other.id &&
            body == other.body &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, body, G__typename);
  }

  @override
  String toString() {
    return 'GPostsByLikesData_postsByLikes(id: $id, body: $body, G__typename: $G__typename)';
  }
}
