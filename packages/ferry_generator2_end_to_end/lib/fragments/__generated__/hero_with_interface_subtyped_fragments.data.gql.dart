// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// A character from the Star Wars universe.
abstract class GheroFieldsFragment {
  String get id;
  String get name;
  String get G__typename;
}

abstract class GheroFieldsFragment__asHuman implements GheroFieldsFragment {
  String? get homePlanet;
  List<GheroFieldsFragment__asHuman_friends?>? get friends;
  String get G__typename;
}

/// A character from the Star Wars universe.
abstract class GheroFieldsFragment__asHuman_friends {
  String get G__typename;
}

abstract class GheroFieldsFragment__asDroid implements GheroFieldsFragment {
  String? get primaryFunction;
  String get G__typename;
}

/// A character from the Star Wars universe.
sealed class GheroFieldsFragmentData implements GheroFieldsFragment {
  const GheroFieldsFragmentData({
    required this.id,
    required this.name,
    required this.G__typename,
  });

  factory GheroFieldsFragmentData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Human':
        return GheroFieldsFragmentData__asHuman.fromJson(json);
      case 'Droid':
        return GheroFieldsFragmentData__asDroid.fromJson(json);
      default:
        return GheroFieldsFragmentData__unknown.fromJson(json);
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

extension GheroFieldsFragmentDataWhenExtension on GheroFieldsFragmentData {
  _T when<_T>({
    required _T Function(GheroFieldsFragmentData__asHuman) human,
    required _T Function(GheroFieldsFragmentData__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(this as GheroFieldsFragmentData__asHuman);
      case 'Droid':
        return droid(this as GheroFieldsFragmentData__asDroid);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GheroFieldsFragmentData__asHuman)? human,
    _T Function(GheroFieldsFragmentData__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human == null
            ? orElse()
            : human(this as GheroFieldsFragmentData__asHuman);
      case 'Droid':
        return droid == null
            ? orElse()
            : droid(this as GheroFieldsFragmentData__asDroid);
      default:
        return orElse();
    }
  }
}

class GheroFieldsFragmentData__asHuman extends GheroFieldsFragmentData
    implements
        GheroFieldsFragment,
        GhumanFieldsFragment,
        GheroFieldsFragment__asHuman {
  GheroFieldsFragmentData__asHuman({
    required String id,
    required String name,
    required String G__typename,
    this.homePlanet,
    List<GheroFieldsFragmentData__asHuman_friends?>? friends,
  })  : friends = friends == null ? null : List.unmodifiable(friends),
        super(id: id, name: name, G__typename: G__typename);

  factory GheroFieldsFragmentData__asHuman.fromJson(Map<String, dynamic> json) {
    return GheroFieldsFragmentData__asHuman(
      id: (json['id'] as String),
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
      homePlanet:
          json['homePlanet'] == null ? null : (json['homePlanet'] as String),
      friends: json['friends'] == null
          ? null
          : List<GheroFieldsFragmentData__asHuman_friends?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GheroFieldsFragmentData__asHuman_friends.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
    );
  }

  final String? homePlanet;

  final List<GheroFieldsFragmentData__asHuman_friends?>? friends;

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

  GheroFieldsFragmentData__asHuman copyWith({
    String? id,
    String? name,
    String? G__typename,
    String? homePlanet,
    bool homePlanetIsSet = false,
    List<GheroFieldsFragmentData__asHuman_friends?>? friends,
    bool friendsIsSet = false,
  }) {
    return GheroFieldsFragmentData__asHuman(
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
        (other is GheroFieldsFragmentData__asHuman &&
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
    return 'GheroFieldsFragmentData__asHuman(id: $id, name: $name, G__typename: $G__typename, homePlanet: $homePlanet, friends: $friends)';
  }
}

/// A character from the Star Wars universe.
sealed class GheroFieldsFragmentData__asHuman_friends
    implements
        GhumanFieldsFragment_friends,
        GheroFieldsFragment__asHuman_friends {
  const GheroFieldsFragmentData__asHuman_friends({required this.G__typename});

  factory GheroFieldsFragmentData__asHuman_friends.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Droid':
        return GheroFieldsFragmentData__asHuman_friends__asDroid.fromJson(json);
      case 'Human':
        return GheroFieldsFragmentData__asHuman_friends__asHuman.fromJson(json);
      default:
        return GheroFieldsFragmentData__asHuman_friends__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GheroFieldsFragmentData__asHuman_friendsWhenExtension
    on GheroFieldsFragmentData__asHuman_friends {
  _T when<_T>({
    required _T Function(GheroFieldsFragmentData__asHuman_friends__asDroid)
        droid,
    required _T Function(GheroFieldsFragmentData__asHuman_friends__asHuman)
        human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid(this as GheroFieldsFragmentData__asHuman_friends__asDroid);
      case 'Human':
        return human(this as GheroFieldsFragmentData__asHuman_friends__asHuman);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GheroFieldsFragmentData__asHuman_friends__asDroid)? droid,
    _T Function(GheroFieldsFragmentData__asHuman_friends__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid == null
            ? orElse()
            : droid(this as GheroFieldsFragmentData__asHuman_friends__asDroid);
      case 'Human':
        return human == null
            ? orElse()
            : human(this as GheroFieldsFragmentData__asHuman_friends__asHuman);
      default:
        return orElse();
    }
  }
}

class GheroFieldsFragmentData__asHuman_friends__asDroid
    extends GheroFieldsFragmentData__asHuman_friends
    implements
        GhumanFieldsFragment_friends,
        GheroFieldsFragment__asHuman_friends,
        GdroidFieldsFragment {
  GheroFieldsFragmentData__asHuman_friends__asDroid({
    required String G__typename,
    required this.id,
    required this.name,
    this.primaryFunction,
  }) : super(G__typename: G__typename);

  factory GheroFieldsFragmentData__asHuman_friends__asDroid.fromJson(
      Map<String, dynamic> json) {
    return GheroFieldsFragmentData__asHuman_friends__asDroid(
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

  GheroFieldsFragmentData__asHuman_friends__asDroid copyWith({
    String? G__typename,
    String? id,
    String? name,
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
  }) {
    return GheroFieldsFragmentData__asHuman_friends__asDroid(
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
        (other is GheroFieldsFragmentData__asHuman_friends__asDroid &&
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
    return 'GheroFieldsFragmentData__asHuman_friends__asDroid(G__typename: $G__typename, id: $id, name: $name, primaryFunction: $primaryFunction)';
  }
}

class GheroFieldsFragmentData__asHuman_friends__asHuman
    extends GheroFieldsFragmentData__asHuman_friends
    implements
        GhumanFieldsFragment_friends,
        GheroFieldsFragment__asHuman_friends {
  GheroFieldsFragmentData__asHuman_friends__asHuman({
    required String G__typename,
    required this.id,
    required this.name,
    this.homePlanet,
  }) : super(G__typename: G__typename);

  factory GheroFieldsFragmentData__asHuman_friends__asHuman.fromJson(
      Map<String, dynamic> json) {
    return GheroFieldsFragmentData__asHuman_friends__asHuman(
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

  GheroFieldsFragmentData__asHuman_friends__asHuman copyWith({
    String? G__typename,
    String? id,
    String? name,
    String? homePlanet,
    bool homePlanetIsSet = false,
  }) {
    return GheroFieldsFragmentData__asHuman_friends__asHuman(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      homePlanet: homePlanetIsSet ? homePlanet : this.homePlanet,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroFieldsFragmentData__asHuman_friends__asHuman &&
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
    return 'GheroFieldsFragmentData__asHuman_friends__asHuman(G__typename: $G__typename, id: $id, name: $name, homePlanet: $homePlanet)';
  }
}

/// A character from the Star Wars universe.
class GheroFieldsFragmentData__asHuman_friends__unknown
    extends GheroFieldsFragmentData__asHuman_friends
    implements
        GhumanFieldsFragment_friends,
        GheroFieldsFragment__asHuman_friends {
  GheroFieldsFragmentData__asHuman_friends__unknown(
      {required String G__typename})
      : super(G__typename: G__typename);

  factory GheroFieldsFragmentData__asHuman_friends__unknown.fromJson(
      Map<String, dynamic> json) {
    return GheroFieldsFragmentData__asHuman_friends__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GheroFieldsFragmentData__asHuman_friends__unknown copyWith(
      {String? G__typename}) {
    return GheroFieldsFragmentData__asHuman_friends__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroFieldsFragmentData__asHuman_friends__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GheroFieldsFragmentData__asHuman_friends__unknown(G__typename: $G__typename)';
  }
}

class GheroFieldsFragmentData__asDroid extends GheroFieldsFragmentData
    implements
        GheroFieldsFragment,
        GdroidFieldsFragment,
        GheroFieldsFragment__asDroid {
  GheroFieldsFragmentData__asDroid({
    required String id,
    required String name,
    required String G__typename,
    this.primaryFunction,
  }) : super(id: id, name: name, G__typename: G__typename);

  factory GheroFieldsFragmentData__asDroid.fromJson(Map<String, dynamic> json) {
    return GheroFieldsFragmentData__asDroid(
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

  GheroFieldsFragmentData__asDroid copyWith({
    String? id,
    String? name,
    String? G__typename,
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
  }) {
    return GheroFieldsFragmentData__asDroid(
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
        (other is GheroFieldsFragmentData__asDroid &&
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
    return 'GheroFieldsFragmentData__asDroid(id: $id, name: $name, G__typename: $G__typename, primaryFunction: $primaryFunction)';
  }
}

/// A character from the Star Wars universe.
class GheroFieldsFragmentData__unknown extends GheroFieldsFragmentData
    implements GheroFieldsFragment {
  GheroFieldsFragmentData__unknown({
    required String id,
    required String name,
    required String G__typename,
  }) : super(id: id, name: name, G__typename: G__typename);

  factory GheroFieldsFragmentData__unknown.fromJson(Map<String, dynamic> json) {
    return GheroFieldsFragmentData__unknown(
      id: (json['id'] as String),
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GheroFieldsFragmentData__unknown copyWith({
    String? id,
    String? name,
    String? G__typename,
  }) {
    return GheroFieldsFragmentData__unknown(
      id: id ?? this.id,
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroFieldsFragmentData__unknown &&
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
    return 'GheroFieldsFragmentData__unknown(id: $id, name: $name, G__typename: $G__typename)';
  }
}

abstract class GhumanFieldsFragment {
  String? get homePlanet;
  List<GhumanFieldsFragment_friends?>? get friends;
  String get G__typename;
}

/// A character from the Star Wars universe.
abstract class GhumanFieldsFragment_friends {
  String get G__typename;
}

class GhumanFieldsFragmentData implements GhumanFieldsFragment {
  GhumanFieldsFragmentData({
    this.homePlanet,
    List<GhumanFieldsFragmentData_friends?>? friends,
    required this.G__typename,
  }) : friends = friends == null ? null : List.unmodifiable(friends);

  factory GhumanFieldsFragmentData.fromJson(Map<String, dynamic> json) {
    return GhumanFieldsFragmentData(
      homePlanet:
          json['homePlanet'] == null ? null : (json['homePlanet'] as String),
      friends: json['friends'] == null
          ? null
          : List<GhumanFieldsFragmentData_friends?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GhumanFieldsFragmentData_friends.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? homePlanet;

  final List<GhumanFieldsFragmentData_friends?>? friends;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$homePlanetValue = this.homePlanet;
    _$result['homePlanet'] =
        _$homePlanetValue == null ? null : _$homePlanetValue;
    final _$friendsValue = this.friends;
    _$result['friends'] = _$friendsValue == null
        ? null
        : _$friendsValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GhumanFieldsFragmentData copyWith({
    String? homePlanet,
    bool homePlanetIsSet = false,
    List<GhumanFieldsFragmentData_friends?>? friends,
    bool friendsIsSet = false,
    String? G__typename,
  }) {
    return GhumanFieldsFragmentData(
      homePlanet: homePlanetIsSet ? homePlanet : this.homePlanet,
      friends: friendsIsSet ? friends : this.friends,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GhumanFieldsFragmentData &&
            homePlanet == other.homePlanet &&
            _gqlUtils.listEquals(friends, other.friends) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, homePlanet, _gqlUtils.listHash(friends), G__typename);
  }

  @override
  String toString() {
    return 'GhumanFieldsFragmentData(homePlanet: $homePlanet, friends: $friends, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
sealed class GhumanFieldsFragmentData_friends
    implements GhumanFieldsFragment_friends {
  const GhumanFieldsFragmentData_friends({required this.G__typename});

  factory GhumanFieldsFragmentData_friends.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Droid':
        return GhumanFieldsFragmentData_friends__asDroid.fromJson(json);
      case 'Human':
        return GhumanFieldsFragmentData_friends__asHuman.fromJson(json);
      default:
        return GhumanFieldsFragmentData_friends__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GhumanFieldsFragmentData_friendsWhenExtension
    on GhumanFieldsFragmentData_friends {
  _T when<_T>({
    required _T Function(GhumanFieldsFragmentData_friends__asDroid) droid,
    required _T Function(GhumanFieldsFragmentData_friends__asHuman) human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid(this as GhumanFieldsFragmentData_friends__asDroid);
      case 'Human':
        return human(this as GhumanFieldsFragmentData_friends__asHuman);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GhumanFieldsFragmentData_friends__asDroid)? droid,
    _T Function(GhumanFieldsFragmentData_friends__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid == null
            ? orElse()
            : droid(this as GhumanFieldsFragmentData_friends__asDroid);
      case 'Human':
        return human == null
            ? orElse()
            : human(this as GhumanFieldsFragmentData_friends__asHuman);
      default:
        return orElse();
    }
  }
}

class GhumanFieldsFragmentData_friends__asDroid
    extends GhumanFieldsFragmentData_friends
    implements GhumanFieldsFragment_friends, GdroidFieldsFragment {
  GhumanFieldsFragmentData_friends__asDroid({
    required String G__typename,
    required this.id,
    required this.name,
    this.primaryFunction,
  }) : super(G__typename: G__typename);

  factory GhumanFieldsFragmentData_friends__asDroid.fromJson(
      Map<String, dynamic> json) {
    return GhumanFieldsFragmentData_friends__asDroid(
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

  GhumanFieldsFragmentData_friends__asDroid copyWith({
    String? G__typename,
    String? id,
    String? name,
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
  }) {
    return GhumanFieldsFragmentData_friends__asDroid(
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
        (other is GhumanFieldsFragmentData_friends__asDroid &&
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
    return 'GhumanFieldsFragmentData_friends__asDroid(G__typename: $G__typename, id: $id, name: $name, primaryFunction: $primaryFunction)';
  }
}

class GhumanFieldsFragmentData_friends__asHuman
    extends GhumanFieldsFragmentData_friends
    implements GhumanFieldsFragment_friends {
  GhumanFieldsFragmentData_friends__asHuman({
    required String G__typename,
    required this.id,
    required this.name,
    this.homePlanet,
  }) : super(G__typename: G__typename);

  factory GhumanFieldsFragmentData_friends__asHuman.fromJson(
      Map<String, dynamic> json) {
    return GhumanFieldsFragmentData_friends__asHuman(
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

  GhumanFieldsFragmentData_friends__asHuman copyWith({
    String? G__typename,
    String? id,
    String? name,
    String? homePlanet,
    bool homePlanetIsSet = false,
  }) {
    return GhumanFieldsFragmentData_friends__asHuman(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      homePlanet: homePlanetIsSet ? homePlanet : this.homePlanet,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GhumanFieldsFragmentData_friends__asHuman &&
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
    return 'GhumanFieldsFragmentData_friends__asHuman(G__typename: $G__typename, id: $id, name: $name, homePlanet: $homePlanet)';
  }
}

/// A character from the Star Wars universe.
class GhumanFieldsFragmentData_friends__unknown
    extends GhumanFieldsFragmentData_friends
    implements GhumanFieldsFragment_friends {
  GhumanFieldsFragmentData_friends__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GhumanFieldsFragmentData_friends__unknown.fromJson(
      Map<String, dynamic> json) {
    return GhumanFieldsFragmentData_friends__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GhumanFieldsFragmentData_friends__unknown copyWith({String? G__typename}) {
    return GhumanFieldsFragmentData_friends__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GhumanFieldsFragmentData_friends__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GhumanFieldsFragmentData_friends__unknown(G__typename: $G__typename)';
  }
}

abstract class GdroidFieldsFragment {
  String? get primaryFunction;
  String get G__typename;
}

class GdroidFieldsFragmentData implements GdroidFieldsFragment {
  const GdroidFieldsFragmentData({
    this.primaryFunction,
    required this.G__typename,
  });

  factory GdroidFieldsFragmentData.fromJson(Map<String, dynamic> json) {
    return GdroidFieldsFragmentData(
      primaryFunction: json['primaryFunction'] == null
          ? null
          : (json['primaryFunction'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? primaryFunction;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$primaryFunctionValue = this.primaryFunction;
    _$result['primaryFunction'] =
        _$primaryFunctionValue == null ? null : _$primaryFunctionValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GdroidFieldsFragmentData copyWith({
    String? primaryFunction,
    bool primaryFunctionIsSet = false,
    String? G__typename,
  }) {
    return GdroidFieldsFragmentData(
      primaryFunction:
          primaryFunctionIsSet ? primaryFunction : this.primaryFunction,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GdroidFieldsFragmentData &&
            primaryFunction == other.primaryFunction &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, primaryFunction, G__typename);
  }

  @override
  String toString() {
    return 'GdroidFieldsFragmentData(primaryFunction: $primaryFunction, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GHeroWithInterfaceSubTypedFragmentsData {
  const GHeroWithInterfaceSubTypedFragmentsData({
    this.hero,
    required this.G__typename,
  });

  factory GHeroWithInterfaceSubTypedFragmentsData.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceSubTypedFragmentsData(
      hero: json['hero'] == null
          ? null
          : GheroFieldsFragmentData.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GheroFieldsFragmentData? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroWithInterfaceSubTypedFragmentsData copyWith({
    GheroFieldsFragmentData? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroWithInterfaceSubTypedFragmentsData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceSubTypedFragmentsData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceSubTypedFragmentsData(hero: $hero, G__typename: $G__typename)';
  }
}
