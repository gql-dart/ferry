// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// A character from the Star Wars universe.
abstract class GFragLevel1 {
  String get id;
  String get name;
  List<GFragLevel4?>? get friends;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GFragLevel1Data implements GFragLevel1, GFragLevel3, GFragLevel2 {
  GFragLevel1Data({
    required this.id,
    required this.name,
    List<GFragLevel4Data?>? friends,
    required this.G__typename,
  }) : friends = friends == null ? null : List.unmodifiable(friends);

  factory GFragLevel1Data.fromJson(Map<String, dynamic> json) {
    return GFragLevel1Data(
      id: (json['id'] as String),
      name: (json['name'] as String),
      friends: json['friends'] == null
          ? null
          : List<GFragLevel4Data?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GFragLevel4Data.fromJson((_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String name;

  final List<GFragLevel4Data?>? friends;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    final _$friendsValue = this.friends;
    _$result['friends'] = _$friendsValue == null
        ? null
        : _$friendsValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFragLevel1Data copyWith({
    String? id,
    String? name,
    List<GFragLevel4Data?>? friends,
    bool friendsIsSet = false,
    String? G__typename,
  }) {
    return GFragLevel1Data(
      id: id ?? this.id,
      name: name ?? this.name,
      friends: friendsIsSet ? friends : this.friends,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFragLevel1Data &&
            id == other.id &&
            name == other.name &&
            _gqlUtils.listEquals(friends, other.friends) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, name, _gqlUtils.listHash(friends), G__typename);
  }

  @override
  String toString() {
    return 'GFragLevel1Data(id: $id, name: $name, friends: $friends, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
abstract class GFragLevel2 {
  String get name;
  List<GFragLevel4?>? get friends;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GFragLevel2Data implements GFragLevel2, GFragLevel3 {
  GFragLevel2Data({
    required this.name,
    List<GFragLevel4Data?>? friends,
    required this.G__typename,
  }) : friends = friends == null ? null : List.unmodifiable(friends);

  factory GFragLevel2Data.fromJson(Map<String, dynamic> json) {
    return GFragLevel2Data(
      name: (json['name'] as String),
      friends: json['friends'] == null
          ? null
          : List<GFragLevel4Data?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GFragLevel4Data.fromJson((_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final String name;

  final List<GFragLevel4Data?>? friends;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['name'] = this.name;
    final _$friendsValue = this.friends;
    _$result['friends'] = _$friendsValue == null
        ? null
        : _$friendsValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFragLevel2Data copyWith({
    String? name,
    List<GFragLevel4Data?>? friends,
    bool friendsIsSet = false,
    String? G__typename,
  }) {
    return GFragLevel2Data(
      name: name ?? this.name,
      friends: friendsIsSet ? friends : this.friends,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFragLevel2Data &&
            name == other.name &&
            _gqlUtils.listEquals(friends, other.friends) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, name, _gqlUtils.listHash(friends), G__typename);
  }

  @override
  String toString() {
    return 'GFragLevel2Data(name: $name, friends: $friends, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
abstract class GFragLevel3 {
  List<GFragLevel4?>? get friends;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GFragLevel3Data implements GFragLevel3 {
  GFragLevel3Data({
    List<GFragLevel4Data?>? friends,
    required this.G__typename,
  }) : friends = friends == null ? null : List.unmodifiable(friends);

  factory GFragLevel3Data.fromJson(Map<String, dynamic> json) {
    return GFragLevel3Data(
      friends: json['friends'] == null
          ? null
          : List<GFragLevel4Data?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GFragLevel4Data.fromJson((_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GFragLevel4Data?>? friends;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$friendsValue = this.friends;
    _$result['friends'] = _$friendsValue == null
        ? null
        : _$friendsValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFragLevel3Data copyWith({
    List<GFragLevel4Data?>? friends,
    bool friendsIsSet = false,
    String? G__typename,
  }) {
    return GFragLevel3Data(
      friends: friendsIsSet ? friends : this.friends,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFragLevel3Data &&
            _gqlUtils.listEquals(friends, other.friends) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(friends), G__typename);
  }

  @override
  String toString() {
    return 'GFragLevel3Data(friends: $friends, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
abstract class GFragLevel4 {
  String get id;
  String get name;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GFragLevel4Data implements GFragLevel4 {
  const GFragLevel4Data({
    required this.id,
    required this.name,
    required this.G__typename,
  });

  factory GFragLevel4Data.fromJson(Map<String, dynamic> json) {
    return GFragLevel4Data(
      id: (json['id'] as String),
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String name;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFragLevel4Data copyWith({
    String? id,
    String? name,
    String? G__typename,
  }) {
    return GFragLevel4Data(
      id: id ?? this.id,
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFragLevel4Data &&
            id == other.id &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, G__typename);
  }

  @override
  String toString() {
    return 'GFragLevel4Data(id: $id, name: $name, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GDeepFragmentsData {
  const GDeepFragmentsData({
    this.hero,
    required this.G__typename,
  });

  factory GDeepFragmentsData.fromJson(Map<String, dynamic> json) {
    return GDeepFragmentsData(
      hero: json['hero'] == null
          ? null
          : GFragLevel1Data.fromJson((json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GFragLevel1Data? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeepFragmentsData copyWith({
    GFragLevel1Data? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GDeepFragmentsData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeepFragmentsData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GDeepFragmentsData(hero: $hero, G__typename: $G__typename)';
  }
}
