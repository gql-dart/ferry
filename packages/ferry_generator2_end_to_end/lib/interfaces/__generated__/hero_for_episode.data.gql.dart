// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GDroidFragment {
  String? get primaryFunction;
  String? get result;
  String get G__typename;
}

class GDroidFragmentData implements GDroidFragment {
  const GDroidFragmentData({
    this.primaryFunction,
    this.result,
    required this.G__typename,
  });

  factory GDroidFragmentData.fromJson(Map<String, dynamic> json) {
    return GDroidFragmentData(
      primaryFunction: json['primaryFunction'] == null
          ? null
          : (json['primaryFunction'] as String),
      result: json['result'] == null ? null : (json['result'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? primaryFunction;

  final String? result;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$primaryFunctionValue = this.primaryFunction;
    _$result['primaryFunction'] =
        _$primaryFunctionValue == null ? null : _$primaryFunctionValue;
    final _$resultValue = this.result;
    _$result['result'] = _$resultValue == null ? null : _$resultValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDroidFragmentData copyWith({
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
    String? result,
    bool resultIsSet = false,
    String? G__typename,
  }) {
    return GDroidFragmentData(
      primaryFunction:
          primaryFunctionIsSet ? primaryFunction : this.primaryFunction,
      result: resultIsSet ? result : this.result,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDroidFragmentData &&
            primaryFunction == other.primaryFunction &&
            result == other.result &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, primaryFunction, result, G__typename);
  }

  @override
  String toString() {
    return 'GDroidFragmentData(primaryFunction: $primaryFunction, result: $result, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GHeroForEpisodeData {
  const GHeroForEpisodeData({
    this.hero,
    required this.G__typename,
  });

  factory GHeroForEpisodeData.fromJson(Map<String, dynamic> json) {
    return GHeroForEpisodeData(
      hero: json['hero'] == null
          ? null
          : GHeroForEpisodeData_hero.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GHeroForEpisodeData_hero? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroForEpisodeData copyWith({
    GHeroForEpisodeData_hero? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroForEpisodeData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroForEpisodeData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroForEpisodeData(hero: $hero, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
sealed class GHeroForEpisodeData_hero {
  GHeroForEpisodeData_hero({
    required this.name,
    List<GHeroForEpisodeData_hero_friends?>? friends,
    required this.G__typename,
  }) : friends = friends == null ? null : List.unmodifiable(friends);

  factory GHeroForEpisodeData_hero.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Droid':
        return GHeroForEpisodeData_hero__asDroid.fromJson(json);
      default:
        return GHeroForEpisodeData_hero__unknown.fromJson(json);
    }
  }

  final String name;

  final List<GHeroForEpisodeData_hero_friends?>? friends;

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
}

extension GHeroForEpisodeData_heroWhenExtension on GHeroForEpisodeData_hero {
  _T when<_T>({
    required _T Function(GHeroForEpisodeData_hero__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid(this as GHeroForEpisodeData_hero__asDroid);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroForEpisodeData_hero__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid == null
            ? orElse()
            : droid(this as GHeroForEpisodeData_hero__asDroid);
      default:
        return orElse();
    }
  }
}

/// A character from the Star Wars universe.
class GHeroForEpisodeData_hero_friends {
  const GHeroForEpisodeData_hero_friends({
    required this.name,
    required this.G__typename,
  });

  factory GHeroForEpisodeData_hero_friends.fromJson(Map<String, dynamic> json) {
    return GHeroForEpisodeData_hero_friends(
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String name;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['name'] = this.name;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroForEpisodeData_hero_friends copyWith({
    String? name,
    String? G__typename,
  }) {
    return GHeroForEpisodeData_hero_friends(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroForEpisodeData_hero_friends &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename);
  }

  @override
  String toString() {
    return 'GHeroForEpisodeData_hero_friends(name: $name, G__typename: $G__typename)';
  }
}

class GHeroForEpisodeData_hero__asDroid extends GHeroForEpisodeData_hero
    implements GDroidFragment {
  GHeroForEpisodeData_hero__asDroid({
    required String name,
    List<GHeroForEpisodeData_hero_friends?>? friends,
    required String G__typename,
    this.primaryFunction,
    this.result,
  }) : super(name: name, friends: friends, G__typename: G__typename);

  factory GHeroForEpisodeData_hero__asDroid.fromJson(
      Map<String, dynamic> json) {
    return GHeroForEpisodeData_hero__asDroid(
      name: (json['name'] as String),
      friends: json['friends'] == null
          ? null
          : List<GHeroForEpisodeData_hero_friends?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GHeroForEpisodeData_hero_friends.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
      primaryFunction: json['primaryFunction'] == null
          ? null
          : (json['primaryFunction'] as String),
      result: json['result'] == null ? null : (json['result'] as String),
    );
  }

  final String? primaryFunction;

  final String? result;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    final _$primaryFunctionValue = this.primaryFunction;
    _$result['primaryFunction'] =
        _$primaryFunctionValue == null ? null : _$primaryFunctionValue;
    final _$resultValue = this.result;
    _$result['result'] = _$resultValue == null ? null : _$resultValue;
    return _$result;
  }

  GHeroForEpisodeData_hero__asDroid copyWith({
    String? name,
    List<GHeroForEpisodeData_hero_friends?>? friends,
    bool friendsIsSet = false,
    String? G__typename,
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
    String? result,
    bool resultIsSet = false,
  }) {
    return GHeroForEpisodeData_hero__asDroid(
      name: name ?? this.name,
      friends: friendsIsSet ? friends : this.friends,
      G__typename: G__typename ?? this.G__typename,
      primaryFunction:
          primaryFunctionIsSet ? primaryFunction : this.primaryFunction,
      result: resultIsSet ? result : this.result,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroForEpisodeData_hero__asDroid &&
            name == other.name &&
            _gqlUtils.listEquals(friends, other.friends) &&
            G__typename == other.G__typename &&
            primaryFunction == other.primaryFunction &&
            result == other.result);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, _gqlUtils.listHash(friends),
        G__typename, primaryFunction, result);
  }

  @override
  String toString() {
    return 'GHeroForEpisodeData_hero__asDroid(name: $name, friends: $friends, G__typename: $G__typename, primaryFunction: $primaryFunction, result: $result)';
  }
}

/// A character from the Star Wars universe.
class GHeroForEpisodeData_hero__unknown extends GHeroForEpisodeData_hero {
  GHeroForEpisodeData_hero__unknown({
    required String name,
    List<GHeroForEpisodeData_hero_friends?>? friends,
    required String G__typename,
  }) : super(name: name, friends: friends, G__typename: G__typename);

  factory GHeroForEpisodeData_hero__unknown.fromJson(
      Map<String, dynamic> json) {
    return GHeroForEpisodeData_hero__unknown(
      name: (json['name'] as String),
      friends: json['friends'] == null
          ? null
          : List<GHeroForEpisodeData_hero_friends?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GHeroForEpisodeData_hero_friends.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GHeroForEpisodeData_hero__unknown copyWith({
    String? name,
    List<GHeroForEpisodeData_hero_friends?>? friends,
    bool friendsIsSet = false,
    String? G__typename,
  }) {
    return GHeroForEpisodeData_hero__unknown(
      name: name ?? this.name,
      friends: friendsIsSet ? friends : this.friends,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroForEpisodeData_hero__unknown &&
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
    return 'GHeroForEpisodeData_hero__unknown(name: $name, friends: $friends, G__typename: $G__typename)';
  }
}
