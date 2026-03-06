// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

abstract class GHumanName {
  String get name;
  String get G__typename;
}

class GHumanNameData implements GHumanName {
  const GHumanNameData({
    required this.name,
    required this.G__typename,
  });

  factory GHumanNameData.fromJson(Map<String, dynamic> json) {
    return GHumanNameData(
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

  GHumanNameData copyWith({
    String? name,
    String? G__typename,
  }) {
    return GHumanNameData(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanNameData &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename);
  }

  @override
  String toString() {
    return 'GHumanNameData(name: $name, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GHeroConditionalTypeFragmentData {
  const GHeroConditionalTypeFragmentData({
    this.hero,
    required this.G__typename,
  });

  factory GHeroConditionalTypeFragmentData.fromJson(Map<String, dynamic> json) {
    return GHeroConditionalTypeFragmentData(
      hero: json['hero'] == null
          ? null
          : GHeroConditionalTypeFragmentData_hero.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GHeroConditionalTypeFragmentData_hero? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroConditionalTypeFragmentData copyWith({
    GHeroConditionalTypeFragmentData_hero? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroConditionalTypeFragmentData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroConditionalTypeFragmentData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroConditionalTypeFragmentData(hero: $hero, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
sealed class GHeroConditionalTypeFragmentData_hero {
  const GHeroConditionalTypeFragmentData_hero({
    required this.G__typename,
    required this.id,
  });

  factory GHeroConditionalTypeFragmentData_hero.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Human':
        return GHeroConditionalTypeFragmentData_hero__asHuman.fromJson(json);
      default:
        return GHeroConditionalTypeFragmentData_hero__unknown.fromJson(json);
    }
  }

  final String G__typename;

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    _$result['id'] = this.id;
    return _$result;
  }
}

extension GHeroConditionalTypeFragmentData_heroWhenExtension
    on GHeroConditionalTypeFragmentData_hero {
  _T when<_T>({
    required _T Function(GHeroConditionalTypeFragmentData_hero__asHuman) human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(this as GHeroConditionalTypeFragmentData_hero__asHuman);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroConditionalTypeFragmentData_hero__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human == null
            ? orElse()
            : human(this as GHeroConditionalTypeFragmentData_hero__asHuman);
      default:
        return orElse();
    }
  }
}

class GHeroConditionalTypeFragmentData_hero__asHuman
    extends GHeroConditionalTypeFragmentData_hero {
  GHeroConditionalTypeFragmentData_hero__asHuman({
    required String G__typename,
    required String id,
    required this.name,
  }) : super(G__typename: G__typename, id: id);

  factory GHeroConditionalTypeFragmentData_hero__asHuman.fromJson(
      Map<String, dynamic> json) {
    return GHeroConditionalTypeFragmentData_hero__asHuman(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: (json['name'] as String),
    );
  }

  final String name;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['name'] = this.name;
    return _$result;
  }

  GHeroConditionalTypeFragmentData_hero__asHuman copyWith({
    String? G__typename,
    String? id,
    String? name,
  }) {
    return GHeroConditionalTypeFragmentData_hero__asHuman(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroConditionalTypeFragmentData_hero__asHuman &&
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
    return 'GHeroConditionalTypeFragmentData_hero__asHuman(G__typename: $G__typename, id: $id, name: $name)';
  }
}

/// A character from the Star Wars universe.
class GHeroConditionalTypeFragmentData_hero__unknown
    extends GHeroConditionalTypeFragmentData_hero {
  GHeroConditionalTypeFragmentData_hero__unknown({
    required String G__typename,
    required String id,
  }) : super(G__typename: G__typename, id: id);

  factory GHeroConditionalTypeFragmentData_hero__unknown.fromJson(
      Map<String, dynamic> json) {
    return GHeroConditionalTypeFragmentData_hero__unknown(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GHeroConditionalTypeFragmentData_hero__unknown copyWith({
    String? G__typename,
    String? id,
  }) {
    return GHeroConditionalTypeFragmentData_hero__unknown(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroConditionalTypeFragmentData_hero__unknown &&
            G__typename == other.G__typename &&
            id == other.id);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id);
  }

  @override
  String toString() {
    return 'GHeroConditionalTypeFragmentData_hero__unknown(G__typename: $G__typename, id: $id)';
  }
}
