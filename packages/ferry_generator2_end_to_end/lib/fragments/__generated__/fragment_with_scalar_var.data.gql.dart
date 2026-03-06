// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GPostFragmentForUser1 {
  String get id;
  GPostFragmentForUser1_favoritedUsers? get favoritedUsers;
  String get G__typename;
}

abstract class GPostFragmentForUser1_favoritedUsers {
  int get totalCount;
  String get G__typename;
}

class GPostFragmentForUser1Data implements GPostFragmentForUser1 {
  const GPostFragmentForUser1Data({
    required this.id,
    this.favoritedUsers,
    required this.G__typename,
  });

  factory GPostFragmentForUser1Data.fromJson(Map<String, dynamic> json) {
    return GPostFragmentForUser1Data(
      id: (json['id'] as String),
      favoritedUsers: json['favoritedUsers'] == null
          ? null
          : GPostFragmentForUser1Data_favoritedUsers.fromJson(
              (json['favoritedUsers'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final GPostFragmentForUser1Data_favoritedUsers? favoritedUsers;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$favoritedUsersValue = this.favoritedUsers;
    _$result['favoritedUsers'] =
        _$favoritedUsersValue == null ? null : _$favoritedUsersValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPostFragmentForUser1Data copyWith({
    String? id,
    GPostFragmentForUser1Data_favoritedUsers? favoritedUsers,
    bool favoritedUsersIsSet = false,
    String? G__typename,
  }) {
    return GPostFragmentForUser1Data(
      id: id ?? this.id,
      favoritedUsers:
          favoritedUsersIsSet ? favoritedUsers : this.favoritedUsers,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostFragmentForUser1Data &&
            id == other.id &&
            favoritedUsers == other.favoritedUsers &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, favoritedUsers, G__typename);
  }

  @override
  String toString() {
    return 'GPostFragmentForUser1Data(id: $id, favoritedUsers: $favoritedUsers, G__typename: $G__typename)';
  }
}

class GPostFragmentForUser1Data_favoritedUsers
    implements GPostFragmentForUser1_favoritedUsers {
  const GPostFragmentForUser1Data_favoritedUsers({
    required this.totalCount,
    required this.G__typename,
  });

  factory GPostFragmentForUser1Data_favoritedUsers.fromJson(
      Map<String, dynamic> json) {
    return GPostFragmentForUser1Data_favoritedUsers(
      totalCount: (json['totalCount'] as int),
      G__typename: (json['__typename'] as String),
    );
  }

  final int totalCount;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['totalCount'] = this.totalCount;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPostFragmentForUser1Data_favoritedUsers copyWith({
    int? totalCount,
    String? G__typename,
  }) {
    return GPostFragmentForUser1Data_favoritedUsers(
      totalCount: totalCount ?? this.totalCount,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostFragmentForUser1Data_favoritedUsers &&
            totalCount == other.totalCount &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalCount, G__typename);
  }

  @override
  String toString() {
    return 'GPostFragmentForUser1Data_favoritedUsers(totalCount: $totalCount, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GPostsWithFixedVariableData {
  GPostsWithFixedVariableData({
    List<GPostFragmentForUser1Data?>? posts,
    required this.G__typename,
  }) : posts = posts == null ? null : List.unmodifiable(posts);

  factory GPostsWithFixedVariableData.fromJson(Map<String, dynamic> json) {
    return GPostsWithFixedVariableData(
      posts: json['posts'] == null
          ? null
          : List<GPostFragmentForUser1Data?>.unmodifiable(
              (json['posts'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GPostFragmentForUser1Data.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GPostFragmentForUser1Data?>? posts;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$postsValue = this.posts;
    _$result['posts'] = _$postsValue == null
        ? null
        : _$postsValue.map((_$e) => _$e == null ? null : _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPostsWithFixedVariableData copyWith({
    List<GPostFragmentForUser1Data?>? posts,
    bool postsIsSet = false,
    String? G__typename,
  }) {
    return GPostsWithFixedVariableData(
      posts: postsIsSet ? posts : this.posts,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostsWithFixedVariableData &&
            _gqlUtils.listEquals(posts, other.posts) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(posts), G__typename);
  }

  @override
  String toString() {
    return 'GPostsWithFixedVariableData(posts: $posts, G__typename: $G__typename)';
  }
}
