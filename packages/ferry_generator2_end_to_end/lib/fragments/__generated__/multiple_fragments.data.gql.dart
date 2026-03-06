// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// A character from the Star Wars universe.
abstract class GheroName {
  String get name;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GheroNameData implements GheroName {
  const GheroNameData({
    required this.name,
    required this.G__typename,
  });

  factory GheroNameData.fromJson(Map<String, dynamic> json) {
    return GheroNameData(
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

  GheroNameData copyWith({
    String? name,
    String? G__typename,
  }) {
    return GheroNameData(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroNameData &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename);
  }

  @override
  String toString() {
    return 'GheroNameData(name: $name, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
abstract class GheroId {
  String get id;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GheroIdData implements GheroId {
  const GheroIdData({
    required this.id,
    required this.G__typename,
  });

  factory GheroIdData.fromJson(Map<String, dynamic> json) {
    return GheroIdData(
      id: (json['id'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GheroIdData copyWith({
    String? id,
    String? G__typename,
  }) {
    return GheroIdData(
      id: id ?? this.id,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroIdData &&
            id == other.id &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, G__typename);
  }

  @override
  String toString() {
    return 'GheroIdData(id: $id, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GHeroWith2FragmentsData {
  const GHeroWith2FragmentsData({
    this.hero,
    required this.G__typename,
  });

  factory GHeroWith2FragmentsData.fromJson(Map<String, dynamic> json) {
    return GHeroWith2FragmentsData(
      hero: json['hero'] == null
          ? null
          : GHeroWith2FragmentsData_hero.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GHeroWith2FragmentsData_hero? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroWith2FragmentsData copyWith({
    GHeroWith2FragmentsData_hero? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroWith2FragmentsData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWith2FragmentsData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroWith2FragmentsData(hero: $hero, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
class GHeroWith2FragmentsData_hero implements GheroName, GheroId {
  const GHeroWith2FragmentsData_hero({
    required this.name,
    required this.G__typename,
    required this.id,
  });

  factory GHeroWith2FragmentsData_hero.fromJson(Map<String, dynamic> json) {
    return GHeroWith2FragmentsData_hero(
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
    );
  }

  final String name;

  final String G__typename;

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['name'] = this.name;
    _$result['__typename'] = this.G__typename;
    _$result['id'] = this.id;
    return _$result;
  }

  GHeroWith2FragmentsData_hero copyWith({
    String? name,
    String? G__typename,
    String? id,
  }) {
    return GHeroWith2FragmentsData_hero(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWith2FragmentsData_hero &&
            name == other.name &&
            G__typename == other.G__typename &&
            id == other.id);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename, id);
  }

  @override
  String toString() {
    return 'GHeroWith2FragmentsData_hero(name: $name, G__typename: $G__typename, id: $id)';
  }
}
