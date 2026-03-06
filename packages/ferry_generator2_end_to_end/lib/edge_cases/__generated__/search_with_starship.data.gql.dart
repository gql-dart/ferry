// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The query type for the schema.
class GSearchWithStarshipData {
  GSearchWithStarshipData({
    List<GSearchWithStarshipData_search?>? search,
    required this.G__typename,
  }) : search = search == null ? null : List.unmodifiable(search);

  factory GSearchWithStarshipData.fromJson(Map<String, dynamic> json) {
    return GSearchWithStarshipData(
      search: json['search'] == null
          ? null
          : List<GSearchWithStarshipData_search?>.unmodifiable(
              (json['search'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GSearchWithStarshipData_search.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GSearchWithStarshipData_search?>? search;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$searchValue = this.search;
    _$result['search'] = _$searchValue == null
        ? null
        : _$searchValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSearchWithStarshipData copyWith({
    List<GSearchWithStarshipData_search?>? search,
    bool searchIsSet = false,
    String? G__typename,
  }) {
    return GSearchWithStarshipData(
      search: searchIsSet ? search : this.search,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchWithStarshipData &&
            _gqlUtils.listEquals(search, other.search) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(search), G__typename);
  }

  @override
  String toString() {
    return 'GSearchWithStarshipData(search: $search, G__typename: $G__typename)';
  }
}

sealed class GSearchWithStarshipData_search {
  const GSearchWithStarshipData_search({required this.G__typename});

  factory GSearchWithStarshipData_search.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Starship':
        return GSearchWithStarshipData_search__asStarship.fromJson(json);
      case 'Human':
        return GSearchWithStarshipData_search__asHuman.fromJson(json);
      default:
        return GSearchWithStarshipData_search__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GSearchWithStarshipData_searchWhenExtension
    on GSearchWithStarshipData_search {
  _T when<_T>({
    required _T Function(GSearchWithStarshipData_search__asStarship) starship,
    required _T Function(GSearchWithStarshipData_search__asHuman) human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Starship':
        return starship(this as GSearchWithStarshipData_search__asStarship);
      case 'Human':
        return human(this as GSearchWithStarshipData_search__asHuman);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GSearchWithStarshipData_search__asStarship)? starship,
    _T Function(GSearchWithStarshipData_search__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Starship':
        return starship == null
            ? orElse()
            : starship(this as GSearchWithStarshipData_search__asStarship);
      case 'Human':
        return human == null
            ? orElse()
            : human(this as GSearchWithStarshipData_search__asHuman);
      default:
        return orElse();
    }
  }
}

class GSearchWithStarshipData_search__asStarship
    extends GSearchWithStarshipData_search {
  GSearchWithStarshipData_search__asStarship({
    required String G__typename,
    required this.id,
    required this.name,
    this.length,
    List<List<double>>? coordinates,
  })  : coordinates =
            coordinates == null ? null : List.unmodifiable(coordinates),
        super(G__typename: G__typename);

  factory GSearchWithStarshipData_search__asStarship.fromJson(
      Map<String, dynamic> json) {
    return GSearchWithStarshipData_search__asStarship(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: (json['name'] as String),
      length: json['length'] == null ? null : (json['length'] as double),
      coordinates: json['coordinates'] == null
          ? null
          : List<List<double>>.unmodifiable(
              (json['coordinates'] as List<dynamic>)
                  .map((_$e) => List<double>.unmodifiable(
                      List<double>.from((_$e as List<dynamic>))))
                  .toList()),
    );
  }

  final String id;

  final String name;

  final double? length;

  final List<List<double>>? coordinates;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    final _$lengthValue = this.length;
    _$result['length'] = _$lengthValue == null ? null : _$lengthValue;
    final _$coordinatesValue = this.coordinates;
    _$result['coordinates'] = _$coordinatesValue == null
        ? null
        : _$coordinatesValue
            .map((_$e) => _$e.map((_$e) => _$e).toList())
            .toList();
    return _$result;
  }

  GSearchWithStarshipData_search__asStarship copyWith({
    String? G__typename,
    String? id,
    String? name,
    double? length,
    bool lengthIsSet = false,
    List<List<double>>? coordinates,
    bool coordinatesIsSet = false,
  }) {
    return GSearchWithStarshipData_search__asStarship(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      length: lengthIsSet ? length : this.length,
      coordinates: coordinatesIsSet ? coordinates : this.coordinates,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchWithStarshipData_search__asStarship &&
            G__typename == other.G__typename &&
            id == other.id &&
            name == other.name &&
            length == other.length &&
            _gqlUtils.listEqualsDeep(coordinates, other.coordinates));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, name, length,
        _gqlUtils.listHashDeep(coordinates));
  }

  @override
  String toString() {
    return 'GSearchWithStarshipData_search__asStarship(G__typename: $G__typename, id: $id, name: $name, length: $length, coordinates: $coordinates)';
  }
}

class GSearchWithStarshipData_search__asHuman
    extends GSearchWithStarshipData_search {
  GSearchWithStarshipData_search__asHuman({
    required String G__typename,
    required this.id,
    required this.name,
    required List<_i1.GEpisode?> appearsIn,
  })  : appearsIn = List.unmodifiable(appearsIn),
        super(G__typename: G__typename);

  factory GSearchWithStarshipData_search__asHuman.fromJson(
      Map<String, dynamic> json) {
    return GSearchWithStarshipData_search__asHuman(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: (json['name'] as String),
      appearsIn: List<_i1.GEpisode?>.unmodifiable(
          (json['appearsIn'] as List<dynamic>)
              .map((_$e) =>
                  _$e == null ? null : _i1.GEpisode.fromJson((_$e as String)))
              .toList()),
    );
  }

  final String id;

  final String name;

  final List<_i1.GEpisode?> appearsIn;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    _$result['appearsIn'] =
        this.appearsIn.map((_$e) => _$e == null ? null : _$e.toJson()).toList();
    return _$result;
  }

  GSearchWithStarshipData_search__asHuman copyWith({
    String? G__typename,
    String? id,
    String? name,
    List<_i1.GEpisode?>? appearsIn,
  }) {
    return GSearchWithStarshipData_search__asHuman(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      appearsIn: appearsIn ?? this.appearsIn,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchWithStarshipData_search__asHuman &&
            G__typename == other.G__typename &&
            id == other.id &&
            name == other.name &&
            _gqlUtils.listEquals(appearsIn, other.appearsIn));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, G__typename, id, name, _gqlUtils.listHash(appearsIn));
  }

  @override
  String toString() {
    return 'GSearchWithStarshipData_search__asHuman(G__typename: $G__typename, id: $id, name: $name, appearsIn: $appearsIn)';
  }
}

class GSearchWithStarshipData_search__unknown
    extends GSearchWithStarshipData_search {
  GSearchWithStarshipData_search__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GSearchWithStarshipData_search__unknown.fromJson(
      Map<String, dynamic> json) {
    return GSearchWithStarshipData_search__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GSearchWithStarshipData_search__unknown copyWith({String? G__typename}) {
    return GSearchWithStarshipData_search__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchWithStarshipData_search__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GSearchWithStarshipData_search__unknown(G__typename: $G__typename)';
  }
}
