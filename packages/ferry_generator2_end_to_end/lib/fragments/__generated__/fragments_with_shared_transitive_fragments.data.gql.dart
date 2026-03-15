// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_friends_and_name.data.gql.dart'
    as _i3;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_name_and_id.data.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/shared_fragment.data.gql.dart'
    as _i1;

/// The query type for the schema.
class GHeroWith2FragmentsWithSharedTransitiveFragmentsData {
  const GHeroWith2FragmentsWithSharedTransitiveFragmentsData({
    this.hero,
    this.G__typename = 'Query',
  });

  factory GHeroWith2FragmentsWithSharedTransitiveFragmentsData.fromJson(
      Map<String, dynamic> json) {
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsData(
      hero: json['hero'] == null
          ? null
          : GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroWith2FragmentsWithSharedTransitiveFragmentsData copyWith({
    GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWith2FragmentsWithSharedTransitiveFragmentsData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroWith2FragmentsWithSharedTransitiveFragmentsData(hero: $hero, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
class GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero
    implements
        _i1.GSharedFragment,
        _i2.GheroNameAndId,
        _i3.GheroFriendsAndName {
  const GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero({
    required this.name,
    required this.G__typename,
    required this.id,
    required this.friendsConnection,
  });

  factory GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero.fromJson(
      Map<String, dynamic> json) {
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero(
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      friendsConnection:
          GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection
              .fromJson((json['friendsConnection'] as Map<String, dynamic>)),
    );
  }

  final String name;

  final String G__typename;

  final String id;

  final GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection
      friendsConnection;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['name'] = this.name;
    _$result['__typename'] = this.G__typename;
    _$result['id'] = this.id;
    _$result['friendsConnection'] = this.friendsConnection.toJson();
    return _$result;
  }

  GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero copyWith({
    String? name,
    String? G__typename,
    String? id,
    GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection?
        friendsConnection,
  }) {
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      friendsConnection: friendsConnection ?? this.friendsConnection,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero &&
            name == other.name &&
            G__typename == other.G__typename &&
            id == other.id &&
            friendsConnection == other.friendsConnection);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename, id, friendsConnection);
  }

  @override
  String toString() {
    return 'GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero(name: $name, G__typename: $G__typename, id: $id, friendsConnection: $friendsConnection)';
  }
}

class GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection
    implements _i3.GheroFriendsAndName_friendsConnection {
  const GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection({
    this.totalCount,
    this.G__typename = 'FriendsConnection',
  });

  factory GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection.fromJson(
      Map<String, dynamic> json) {
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection(
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

  GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection
      copyWith({
    int? totalCount,
    bool totalCountIsSet = false,
    String? G__typename,
  }) {
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection(
      totalCount: totalCountIsSet ? totalCount : this.totalCount,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection &&
            totalCount == other.totalCount &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalCount, G__typename);
  }

  @override
  String toString() {
    return 'GHeroWith2FragmentsWithSharedTransitiveFragmentsData_hero_friendsConnection(totalCount: $totalCount, G__typename: $G__typename)';
  }
}
