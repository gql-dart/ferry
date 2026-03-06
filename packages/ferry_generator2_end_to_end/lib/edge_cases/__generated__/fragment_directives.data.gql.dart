// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// A character from the Star Wars universe.
abstract class GHeroName {
  String? get name;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GHeroNameData implements GHeroName {
  const GHeroNameData({
    this.name,
    required this.G__typename,
  });

  factory GHeroNameData.fromJson(Map<String, dynamic> json) {
    return GHeroNameData(
      name: json['name'] == null ? null : (json['name'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? name;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$nameValue = this.name;
    _$result['name'] = _$nameValue == null ? null : _$nameValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroNameData copyWith({
    String? name,
    bool nameIsSet = false,
    String? G__typename,
  }) {
    return GHeroNameData(
      name: nameIsSet ? name : this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroNameData &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename);
  }

  @override
  String toString() {
    return 'GHeroNameData(name: $name, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GHeroFragmentDirectivesData {
  const GHeroFragmentDirectivesData({
    this.hero,
    required this.G__typename,
  });

  factory GHeroFragmentDirectivesData.fromJson(Map<String, dynamic> json) {
    return GHeroFragmentDirectivesData(
      hero: json['hero'] == null
          ? null
          : GHeroFragmentDirectivesData_hero.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GHeroFragmentDirectivesData_hero? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroFragmentDirectivesData copyWith({
    GHeroFragmentDirectivesData_hero? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroFragmentDirectivesData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroFragmentDirectivesData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroFragmentDirectivesData(hero: $hero, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
class GHeroFragmentDirectivesData_hero {
  const GHeroFragmentDirectivesData_hero({
    required this.G__typename,
    required this.id,
    this.name,
  });

  factory GHeroFragmentDirectivesData_hero.fromJson(Map<String, dynamic> json) {
    return GHeroFragmentDirectivesData_hero(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: json['name'] == null ? null : (json['name'] as String),
    );
  }

  final String G__typename;

  final String id;

  final String? name;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    _$result['id'] = this.id;
    final _$nameValue = this.name;
    _$result['name'] = _$nameValue == null ? null : _$nameValue;
    return _$result;
  }

  GHeroFragmentDirectivesData_hero copyWith({
    String? G__typename,
    String? id,
    String? name,
    bool nameIsSet = false,
  }) {
    return GHeroFragmentDirectivesData_hero(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: nameIsSet ? name : this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroFragmentDirectivesData_hero &&
            G__typename == other.G__typename &&
            id == other.id &&
            name == other.name);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, name);
  }

  @override
  String toString() {
    return 'GHeroFragmentDirectivesData_hero(G__typename: $G__typename, id: $id, name: $name)';
  }
}
