// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/fragments/__generated__/shared_fragment.data.gql.dart'
    as _i1;

/// A character from the Star Wars universe.
abstract class GheroFriendsAndName {
  String get name;
  String get G__typename;
  GheroFriendsAndName_friendsConnection get friendsConnection;
}

abstract class GheroFriendsAndName_friendsConnection {
  int? get totalCount;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GheroFriendsAndNameData
    implements GheroFriendsAndName, _i1.GSharedFragment {
  const GheroFriendsAndNameData({
    required this.name,
    required this.G__typename,
    required this.friendsConnection,
  });

  factory GheroFriendsAndNameData.fromJson(Map<String, dynamic> json) {
    return GheroFriendsAndNameData(
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
      friendsConnection: GheroFriendsAndNameData_friendsConnection.fromJson(
          (json['friendsConnection'] as Map<String, dynamic>)),
    );
  }

  final String name;

  final String G__typename;

  final GheroFriendsAndNameData_friendsConnection friendsConnection;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['name'] = this.name;
    _$result['__typename'] = this.G__typename;
    _$result['friendsConnection'] = this.friendsConnection.toJson();
    return _$result;
  }

  GheroFriendsAndNameData copyWith({
    String? name,
    String? G__typename,
    GheroFriendsAndNameData_friendsConnection? friendsConnection,
  }) {
    return GheroFriendsAndNameData(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
      friendsConnection: friendsConnection ?? this.friendsConnection,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroFriendsAndNameData &&
            name == other.name &&
            G__typename == other.G__typename &&
            friendsConnection == other.friendsConnection);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename, friendsConnection);
  }

  @override
  String toString() {
    return 'GheroFriendsAndNameData(name: $name, G__typename: $G__typename, friendsConnection: $friendsConnection)';
  }
}

class GheroFriendsAndNameData_friendsConnection
    implements GheroFriendsAndName_friendsConnection {
  const GheroFriendsAndNameData_friendsConnection({
    this.totalCount,
    this.G__typename = 'FriendsConnection',
  });

  factory GheroFriendsAndNameData_friendsConnection.fromJson(
      Map<String, dynamic> json) {
    return GheroFriendsAndNameData_friendsConnection(
      totalCount:
          json['totalCount'] == null ? null : (json['totalCount'] as int),
      G__typename: (json['__typename'] as String),
    );
  }

  final int? totalCount;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$totalCountValue = this.totalCount;
    _$result['totalCount'] =
        _$totalCountValue == null ? null : _$totalCountValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GheroFriendsAndNameData_friendsConnection copyWith({
    int? totalCount,
    bool totalCountIsSet = false,
    String? G__typename,
  }) {
    return GheroFriendsAndNameData_friendsConnection(
      totalCount: totalCountIsSet ? totalCount : this.totalCount,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroFriendsAndNameData_friendsConnection &&
            totalCount == other.totalCount &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalCount, G__typename);
  }

  @override
  String toString() {
    return 'GheroFriendsAndNameData_friendsConnection(totalCount: $totalCount, G__typename: $G__typename)';
  }
}
