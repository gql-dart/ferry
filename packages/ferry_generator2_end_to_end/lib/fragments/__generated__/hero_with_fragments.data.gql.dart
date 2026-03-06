// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// A character from the Star Wars universe.
abstract class GheroData {
  String get name;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GheroDataData implements GheroData {
  const GheroDataData({
    required this.name,
    required this.G__typename,
  });

  factory GheroDataData.fromJson(Map<String, dynamic> json) {
    return GheroDataData(
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

  GheroDataData copyWith({
    String? name,
    String? G__typename,
  }) {
    return GheroDataData(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroDataData &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename);
  }

  @override
  String toString() {
    return 'GheroDataData(name: $name, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
abstract class GcomparisonFields {
  String get id;
  String get name;
  String get G__typename;
  GcomparisonFields_friendsConnection get friendsConnection;
}

abstract class GcomparisonFields_friendsConnection {
  int? get totalCount;
  List<GcomparisonFields_friendsConnection_edges?>? get edges;
  String get G__typename;
}

abstract class GcomparisonFields_friendsConnection_edges {
  GheroData? get node;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GcomparisonFieldsData implements GcomparisonFields, GheroData {
  const GcomparisonFieldsData({
    required this.id,
    required this.name,
    required this.G__typename,
    required this.friendsConnection,
  });

  factory GcomparisonFieldsData.fromJson(Map<String, dynamic> json) {
    return GcomparisonFieldsData(
      id: (json['id'] as String),
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
      friendsConnection: GcomparisonFieldsData_friendsConnection.fromJson(
          (json['friendsConnection'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final String name;

  final String G__typename;

  final GcomparisonFieldsData_friendsConnection friendsConnection;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    _$result['__typename'] = this.G__typename;
    _$result['friendsConnection'] = this.friendsConnection.toJson();
    return _$result;
  }

  GcomparisonFieldsData copyWith({
    String? id,
    String? name,
    String? G__typename,
    GcomparisonFieldsData_friendsConnection? friendsConnection,
  }) {
    return GcomparisonFieldsData(
      id: id ?? this.id,
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
      friendsConnection: friendsConnection ?? this.friendsConnection,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcomparisonFieldsData &&
            id == other.id &&
            name == other.name &&
            G__typename == other.G__typename &&
            friendsConnection == other.friendsConnection);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, G__typename, friendsConnection);
  }

  @override
  String toString() {
    return 'GcomparisonFieldsData(id: $id, name: $name, G__typename: $G__typename, friendsConnection: $friendsConnection)';
  }
}

class GcomparisonFieldsData_friendsConnection
    implements GcomparisonFields_friendsConnection {
  GcomparisonFieldsData_friendsConnection({
    this.totalCount,
    List<GcomparisonFieldsData_friendsConnection_edges?>? edges,
    required this.G__typename,
  }) : edges = edges == null ? null : List.unmodifiable(edges);

  factory GcomparisonFieldsData_friendsConnection.fromJson(
      Map<String, dynamic> json) {
    return GcomparisonFieldsData_friendsConnection(
      totalCount:
          json['totalCount'] == null ? null : (json['totalCount'] as int),
      edges: json['edges'] == null
          ? null
          : List<GcomparisonFieldsData_friendsConnection_edges?>.unmodifiable(
              (json['edges'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GcomparisonFieldsData_friendsConnection_edges.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final int? totalCount;

  final List<GcomparisonFieldsData_friendsConnection_edges?>? edges;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$totalCountValue = this.totalCount;
    _$result['totalCount'] =
        _$totalCountValue == null ? null : _$totalCountValue;
    final _$edgesValue = this.edges;
    _$result['edges'] = _$edgesValue == null
        ? null
        : _$edgesValue.map((_$e) => _$e == null ? null : _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GcomparisonFieldsData_friendsConnection copyWith({
    int? totalCount,
    bool totalCountIsSet = false,
    List<GcomparisonFieldsData_friendsConnection_edges?>? edges,
    bool edgesIsSet = false,
    String? G__typename,
  }) {
    return GcomparisonFieldsData_friendsConnection(
      totalCount: totalCountIsSet ? totalCount : this.totalCount,
      edges: edgesIsSet ? edges : this.edges,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcomparisonFieldsData_friendsConnection &&
            totalCount == other.totalCount &&
            _gqlUtils.listEquals(edges, other.edges) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, totalCount, _gqlUtils.listHash(edges), G__typename);
  }

  @override
  String toString() {
    return 'GcomparisonFieldsData_friendsConnection(totalCount: $totalCount, edges: $edges, G__typename: $G__typename)';
  }
}

class GcomparisonFieldsData_friendsConnection_edges
    implements GcomparisonFields_friendsConnection_edges {
  const GcomparisonFieldsData_friendsConnection_edges({
    this.node,
    required this.G__typename,
  });

  factory GcomparisonFieldsData_friendsConnection_edges.fromJson(
      Map<String, dynamic> json) {
    return GcomparisonFieldsData_friendsConnection_edges(
      node: json['node'] == null
          ? null
          : GheroDataData.fromJson((json['node'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GheroDataData? node;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$nodeValue = this.node;
    _$result['node'] = _$nodeValue == null ? null : _$nodeValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GcomparisonFieldsData_friendsConnection_edges copyWith({
    GheroDataData? node,
    bool nodeIsSet = false,
    String? G__typename,
  }) {
    return GcomparisonFieldsData_friendsConnection_edges(
      node: nodeIsSet ? node : this.node,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcomparisonFieldsData_friendsConnection_edges &&
            node == other.node &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, node, G__typename);
  }

  @override
  String toString() {
    return 'GcomparisonFieldsData_friendsConnection_edges(node: $node, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GHeroWithFragmentsData {
  const GHeroWithFragmentsData({
    this.hero,
    required this.G__typename,
  });

  factory GHeroWithFragmentsData.fromJson(Map<String, dynamic> json) {
    return GHeroWithFragmentsData(
      hero: json['hero'] == null
          ? null
          : GcomparisonFieldsData.fromJson(
              (json['hero'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Hero for a given episode.
  final GcomparisonFieldsData? hero;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$heroValue = this.hero;
    _$result['hero'] = _$heroValue == null ? null : _$heroValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHeroWithFragmentsData copyWith({
    GcomparisonFieldsData? hero,
    bool heroIsSet = false,
    String? G__typename,
  }) {
    return GHeroWithFragmentsData(
      hero: heroIsSet ? hero : this.hero,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithFragmentsData &&
            hero == other.hero &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hero, G__typename);
  }

  @override
  String toString() {
    return 'GHeroWithFragmentsData(hero: $hero, G__typename: $G__typename)';
  }
}
