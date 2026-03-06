// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The query type for the schema.
class GHeroWithInterfaceUnnamedFragmentsData {
  const GHeroWithInterfaceUnnamedFragmentsData({
    this.hero,
    required this.G__typename,
  });

  factory GHeroWithInterfaceUnnamedFragmentsData.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsData(
      hero: json['hero'] == null
          ? null
          : GHeroWithInterfaceUnnamedFragmentsData_hero.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GHeroWithInterfaceUnnamedFragmentsData_hero? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsData copyWith({
    GHeroWithInterfaceUnnamedFragmentsData_hero? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroWithInterfaceUnnamedFragmentsData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceUnnamedFragmentsData(hero: $hero, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
sealed class GHeroWithInterfaceUnnamedFragmentsData_hero {
  const GHeroWithInterfaceUnnamedFragmentsData_hero({
    required this.id,
    required this.name,
    required this.G__typename,
  });

  factory GHeroWithInterfaceUnnamedFragmentsData_hero.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Human':
        return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman.fromJson(
            json);
      case 'Droid':
        return GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid.fromJson(
            json);
      default:
        return GHeroWithInterfaceUnnamedFragmentsData_hero__unknown.fromJson(
            json);
    }
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
}

extension GHeroWithInterfaceUnnamedFragmentsData_heroWhenExtension
    on GHeroWithInterfaceUnnamedFragmentsData_hero {
  _T when<_T>({
    required _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman)
        human,
    required _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid)
        droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(
            this as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman);
      case 'Droid':
        return droid(
            this as GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman)? human,
    _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human == null
            ? orElse()
            : human(
                this as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman);
      case 'Droid':
        return droid == null
            ? orElse()
            : droid(
                this as GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid);
      default:
        return orElse();
    }
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman
    extends GHeroWithInterfaceUnnamedFragmentsData_hero {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman({
    required String id,
    required String name,
    required String G__typename,
    this.homePlanet,
    List<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>?
        friends,
  })  : friends = friends == null ? null : List.unmodifiable(friends),
        super(id: id, name: name, G__typename: G__typename);

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman(
      id: (json['id'] as String),
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
      homePlanet:
          json['homePlanet'] == null ? null : (json['homePlanet'] as String),
      friends: json['friends'] == null
          ? null
          : List<
              GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>.unmodifiable((json[
                  'friends'] as List<dynamic>)
              .map((_$e) => _$e == null
                  ? null
                  : GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends
                      .fromJson((_$e as Map<String, dynamic>)))
              .toList()),
    );
  }

  final String? homePlanet;

  final List<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>?
      friends;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    final _$homePlanetValue = this.homePlanet;
    _$result['homePlanet'] =
        _$homePlanetValue == null ? null : _$homePlanetValue;
    final _$friendsValue = this.friends;
    _$result['friends'] = _$friendsValue == null
        ? null
        : _$friendsValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman copyWith({
    String? id,
    String? name,
    String? G__typename,
    String? homePlanet,
    bool homePlanetIsSet = false,
    List<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>?
        friends,
    bool friendsIsSet = false,
  }) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman(
      id: id ?? this.id,
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
      homePlanet: homePlanetIsSet ? homePlanet : this.homePlanet,
      friends: friendsIsSet ? friends : this.friends,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman &&
            id == other.id &&
            name == other.name &&
            G__typename == other.G__typename &&
            homePlanet == other.homePlanet &&
            _gqlUtils.listEquals(friends, other.friends));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, G__typename, homePlanet,
        _gqlUtils.listHash(friends));
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman(id: $id, name: $name, G__typename: $G__typename, homePlanet: $homePlanet, friends: $friends)';
  }
}

/// A character from the Star Wars universe.
sealed class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  const GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends(
      {required this.G__typename});

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Human':
        return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
            .fromJson(json);
      case 'Droid':
        return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
            .fromJson(json);
      default:
        return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown
            .fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friendsWhenExtension
    on GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  _T when<_T>({
    required _T Function(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman)
        human,
    required _T Function(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid)
        droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(this
            as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman);
      case 'Droid':
        return droid(this
            as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman)?
        human,
    _T Function(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid)?
        droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human == null
            ? orElse()
            : human(this
                as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman);
      case 'Droid':
        return droid == null
            ? orElse()
            : droid(this
                as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid);
      default:
        return orElse();
    }
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman({
    required String G__typename,
    required this.id,
    required this.name,
    this.homePlanet,
  }) : super(G__typename: G__typename);

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: (json['name'] as String),
      homePlanet:
          json['homePlanet'] == null ? null : (json['homePlanet'] as String),
    );
  }

  final String id;

  final String name;

  final String? homePlanet;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    final _$homePlanetValue = this.homePlanet;
    _$result['homePlanet'] =
        _$homePlanetValue == null ? null : _$homePlanetValue;
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
      copyWith({
    String? G__typename,
    String? id,
    String? name,
    String? homePlanet,
    bool homePlanetIsSet = false,
  }) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      homePlanet: homePlanetIsSet ? homePlanet : this.homePlanet,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman &&
            G__typename == other.G__typename &&
            id == other.id &&
            name == other.name &&
            homePlanet == other.homePlanet);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, name, homePlanet);
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman(G__typename: $G__typename, id: $id, name: $name, homePlanet: $homePlanet)';
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid({
    required String G__typename,
    required this.id,
    required this.name,
    this.primaryFunction,
  }) : super(G__typename: G__typename);

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: (json['name'] as String),
      primaryFunction: json['primaryFunction'] == null
          ? null
          : (json['primaryFunction'] as String),
    );
  }

  final String id;

  final String name;

  final String? primaryFunction;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    final _$primaryFunctionValue = this.primaryFunction;
    _$result['primaryFunction'] =
        _$primaryFunctionValue == null ? null : _$primaryFunctionValue;
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
      copyWith({
    String? G__typename,
    String? id,
    String? name,
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
  }) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      primaryFunction:
          primaryFunctionIsSet ? primaryFunction : this.primaryFunction,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid &&
            G__typename == other.G__typename &&
            id == other.id &&
            name == other.name &&
            primaryFunction == other.primaryFunction);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, name, primaryFunction);
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid(G__typename: $G__typename, id: $id, name: $name, primaryFunction: $primaryFunction)';
  }
}

/// A character from the Star Wars universe.
class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown(
      {required String G__typename})
      : super(G__typename: G__typename);

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown
      copyWith({String? G__typename}) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__unknown(G__typename: $G__typename)';
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid
    extends GHeroWithInterfaceUnnamedFragmentsData_hero {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid({
    required String id,
    required String name,
    required String G__typename,
    this.primaryFunction,
  }) : super(id: id, name: name, G__typename: G__typename);

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid(
      id: (json['id'] as String),
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
      primaryFunction: json['primaryFunction'] == null
          ? null
          : (json['primaryFunction'] as String),
    );
  }

  final String? primaryFunction;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    final _$primaryFunctionValue = this.primaryFunction;
    _$result['primaryFunction'] =
        _$primaryFunctionValue == null ? null : _$primaryFunctionValue;
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid copyWith({
    String? id,
    String? name,
    String? G__typename,
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
  }) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid(
      id: id ?? this.id,
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
      primaryFunction:
          primaryFunctionIsSet ? primaryFunction : this.primaryFunction,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid &&
            id == other.id &&
            name == other.name &&
            G__typename == other.G__typename &&
            primaryFunction == other.primaryFunction);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, G__typename, primaryFunction);
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid(id: $id, name: $name, G__typename: $G__typename, primaryFunction: $primaryFunction)';
  }
}

/// A character from the Star Wars universe.
class GHeroWithInterfaceUnnamedFragmentsData_hero__unknown
    extends GHeroWithInterfaceUnnamedFragmentsData_hero {
  GHeroWithInterfaceUnnamedFragmentsData_hero__unknown({
    required String id,
    required String name,
    required String G__typename,
  }) : super(id: id, name: name, G__typename: G__typename);

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__unknown.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__unknown(
      id: (json['id'] as String),
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__unknown copyWith({
    String? id,
    String? name,
    String? G__typename,
  }) {
    return GHeroWithInterfaceUnnamedFragmentsData_hero__unknown(
      id: id ?? this.id,
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsData_hero__unknown &&
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
    return 'GHeroWithInterfaceUnnamedFragmentsData_hero__unknown(id: $id, name: $name, G__typename: $G__typename)';
  }
}
