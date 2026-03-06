// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// A character from the Star Wars universe.
abstract class GCharacterDetails {
  String get id;
  String get name;
  List<GFriendInfo?>? get friends;
  List<_i1.GEpisode?> get appearsIn;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GCharacterDetailsData implements GCharacterDetails {
  GCharacterDetailsData({
    required this.id,
    required this.name,
    List<GFriendInfoData?>? friends,
    required List<_i1.GEpisode?> appearsIn,
    required this.G__typename,
  })  : friends = friends == null ? null : List.unmodifiable(friends),
        appearsIn = List.unmodifiable(appearsIn);

  factory GCharacterDetailsData.fromJson(Map<String, dynamic> json) {
    return GCharacterDetailsData(
      id: (json['id'] as String),
      name: (json['name'] as String),
      friends: json['friends'] == null
          ? null
          : List<GFriendInfoData?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GFriendInfoData.fromJson((_$e as Map<String, dynamic>)))
                  .toList()),
      appearsIn: List<_i1.GEpisode?>.unmodifiable(
          (json['appearsIn'] as List<dynamic>)
              .map((_$e) =>
                  _$e == null ? null : _i1.GEpisode.fromJson((_$e as String)))
              .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String name;

  final List<GFriendInfoData?>? friends;

  final List<_i1.GEpisode?> appearsIn;

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
    _$result['appearsIn'] =
        this.appearsIn.map((_$e) => _$e == null ? null : _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCharacterDetailsData copyWith({
    String? id,
    String? name,
    List<GFriendInfoData?>? friends,
    bool friendsIsSet = false,
    List<_i1.GEpisode?>? appearsIn,
    String? G__typename,
  }) {
    return GCharacterDetailsData(
      id: id ?? this.id,
      name: name ?? this.name,
      friends: friendsIsSet ? friends : this.friends,
      appearsIn: appearsIn ?? this.appearsIn,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCharacterDetailsData &&
            id == other.id &&
            name == other.name &&
            _gqlUtils.listEquals(friends, other.friends) &&
            _gqlUtils.listEquals(appearsIn, other.appearsIn) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, _gqlUtils.listHash(friends),
        _gqlUtils.listHash(appearsIn), G__typename);
  }

  @override
  String toString() {
    return 'GCharacterDetailsData(id: $id, name: $name, friends: $friends, appearsIn: $appearsIn, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
abstract class GFriendInfo {
  String get id;
  String get name;
  GFriendInfo_friendsConnection get friendsConnection;
  String get G__typename;
}

abstract class GFriendInfo_friendsConnection {
  List<GCharacterBasic?>? get friends;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GFriendInfoData implements GFriendInfo {
  const GFriendInfoData({
    required this.id,
    required this.name,
    required this.friendsConnection,
    required this.G__typename,
  });

  factory GFriendInfoData.fromJson(Map<String, dynamic> json) {
    return GFriendInfoData(
      id: (json['id'] as String),
      name: (json['name'] as String),
      friendsConnection: GFriendInfoData_friendsConnection.fromJson(
          (json['friendsConnection'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String name;

  final GFriendInfoData_friendsConnection friendsConnection;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    _$result['friendsConnection'] = this.friendsConnection.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFriendInfoData copyWith({
    String? id,
    String? name,
    GFriendInfoData_friendsConnection? friendsConnection,
    String? G__typename,
  }) {
    return GFriendInfoData(
      id: id ?? this.id,
      name: name ?? this.name,
      friendsConnection: friendsConnection ?? this.friendsConnection,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFriendInfoData &&
            id == other.id &&
            name == other.name &&
            friendsConnection == other.friendsConnection &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, friendsConnection, G__typename);
  }

  @override
  String toString() {
    return 'GFriendInfoData(id: $id, name: $name, friendsConnection: $friendsConnection, G__typename: $G__typename)';
  }
}

class GFriendInfoData_friendsConnection
    implements GFriendInfo_friendsConnection {
  GFriendInfoData_friendsConnection({
    List<GCharacterBasicData?>? friends,
    required this.G__typename,
  }) : friends = friends == null ? null : List.unmodifiable(friends);

  factory GFriendInfoData_friendsConnection.fromJson(
      Map<String, dynamic> json) {
    return GFriendInfoData_friendsConnection(
      friends: json['friends'] == null
          ? null
          : List<GCharacterBasicData?>.unmodifiable((json['friends']
                  as List<dynamic>)
              .map((_$e) => _$e == null
                  ? null
                  : GCharacterBasicData.fromJson((_$e as Map<String, dynamic>)))
              .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GCharacterBasicData?>? friends;

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

  GFriendInfoData_friendsConnection copyWith({
    List<GCharacterBasicData?>? friends,
    bool friendsIsSet = false,
    String? G__typename,
  }) {
    return GFriendInfoData_friendsConnection(
      friends: friendsIsSet ? friends : this.friends,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFriendInfoData_friendsConnection &&
            _gqlUtils.listEquals(friends, other.friends) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(friends), G__typename);
  }

  @override
  String toString() {
    return 'GFriendInfoData_friendsConnection(friends: $friends, G__typename: $G__typename)';
  }
}

/// A character from the Star Wars universe.
abstract class GCharacterBasic {
  String get id;
  String get name;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GCharacterBasicData implements GCharacterBasic {
  const GCharacterBasicData({
    required this.id,
    required this.name,
    required this.G__typename,
  });

  factory GCharacterBasicData.fromJson(Map<String, dynamic> json) {
    return GCharacterBasicData(
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

  GCharacterBasicData copyWith({
    String? id,
    String? name,
    String? G__typename,
  }) {
    return GCharacterBasicData(
      id: id ?? this.id,
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCharacterBasicData &&
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
    return 'GCharacterBasicData(id: $id, name: $name, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GSearchResultsQueryData {
  GSearchResultsQueryData({
    List<GSearchResultsQueryData_search?>? search,
    required this.G__typename,
  }) : search = search == null ? null : List.unmodifiable(search);

  factory GSearchResultsQueryData.fromJson(Map<String, dynamic> json) {
    return GSearchResultsQueryData(
      search: json['search'] == null
          ? null
          : List<GSearchResultsQueryData_search?>.unmodifiable(
              (json['search'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GSearchResultsQueryData_search.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GSearchResultsQueryData_search?>? search;

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

  GSearchResultsQueryData copyWith({
    List<GSearchResultsQueryData_search?>? search,
    bool searchIsSet = false,
    String? G__typename,
  }) {
    return GSearchResultsQueryData(
      search: searchIsSet ? search : this.search,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchResultsQueryData &&
            _gqlUtils.listEquals(search, other.search) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(search), G__typename);
  }

  @override
  String toString() {
    return 'GSearchResultsQueryData(search: $search, G__typename: $G__typename)';
  }
}

sealed class GSearchResultsQueryData_search {
  const GSearchResultsQueryData_search({required this.G__typename});

  factory GSearchResultsQueryData_search.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Human':
        return GSearchResultsQueryData_search__asHuman.fromJson(json);
      case 'Droid':
        return GSearchResultsQueryData_search__asDroid.fromJson(json);
      default:
        return GSearchResultsQueryData_search__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GSearchResultsQueryData_searchWhenExtension
    on GSearchResultsQueryData_search {
  _T when<_T>({
    required _T Function(GSearchResultsQueryData_search__asHuman) human,
    required _T Function(GSearchResultsQueryData_search__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(this as GSearchResultsQueryData_search__asHuman);
      case 'Droid':
        return droid(this as GSearchResultsQueryData_search__asDroid);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GSearchResultsQueryData_search__asHuman)? human,
    _T Function(GSearchResultsQueryData_search__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human == null
            ? orElse()
            : human(this as GSearchResultsQueryData_search__asHuman);
      case 'Droid':
        return droid == null
            ? orElse()
            : droid(this as GSearchResultsQueryData_search__asDroid);
      default:
        return orElse();
    }
  }
}

class GSearchResultsQueryData_search__asHuman
    extends GSearchResultsQueryData_search implements GCharacterDetails {
  GSearchResultsQueryData_search__asHuman({
    required String G__typename,
    required this.id,
    required this.name,
    List<GFriendInfoData?>? friends,
    required List<_i1.GEpisode?> appearsIn,
  })  : friends = friends == null ? null : List.unmodifiable(friends),
        appearsIn = List.unmodifiable(appearsIn),
        super(G__typename: G__typename);

  factory GSearchResultsQueryData_search__asHuman.fromJson(
      Map<String, dynamic> json) {
    return GSearchResultsQueryData_search__asHuman(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: (json['name'] as String),
      friends: json['friends'] == null
          ? null
          : List<GFriendInfoData?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GFriendInfoData.fromJson((_$e as Map<String, dynamic>)))
                  .toList()),
      appearsIn: List<_i1.GEpisode?>.unmodifiable(
          (json['appearsIn'] as List<dynamic>)
              .map((_$e) =>
                  _$e == null ? null : _i1.GEpisode.fromJson((_$e as String)))
              .toList()),
    );
  }

  final String id;

  final String name;

  final List<GFriendInfoData?>? friends;

  final List<_i1.GEpisode?> appearsIn;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    final _$friendsValue = this.friends;
    _$result['friends'] = _$friendsValue == null
        ? null
        : _$friendsValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['appearsIn'] =
        this.appearsIn.map((_$e) => _$e == null ? null : _$e.toJson()).toList();
    return _$result;
  }

  GSearchResultsQueryData_search__asHuman copyWith({
    String? G__typename,
    String? id,
    String? name,
    List<GFriendInfoData?>? friends,
    bool friendsIsSet = false,
    List<_i1.GEpisode?>? appearsIn,
  }) {
    return GSearchResultsQueryData_search__asHuman(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      friends: friendsIsSet ? friends : this.friends,
      appearsIn: appearsIn ?? this.appearsIn,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchResultsQueryData_search__asHuman &&
            G__typename == other.G__typename &&
            id == other.id &&
            name == other.name &&
            _gqlUtils.listEquals(friends, other.friends) &&
            _gqlUtils.listEquals(appearsIn, other.appearsIn));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, name,
        _gqlUtils.listHash(friends), _gqlUtils.listHash(appearsIn));
  }

  @override
  String toString() {
    return 'GSearchResultsQueryData_search__asHuman(G__typename: $G__typename, id: $id, name: $name, friends: $friends, appearsIn: $appearsIn)';
  }
}

class GSearchResultsQueryData_search__asDroid
    extends GSearchResultsQueryData_search implements GCharacterDetails {
  GSearchResultsQueryData_search__asDroid({
    required String G__typename,
    required this.id,
    required this.name,
    List<GFriendInfoData?>? friends,
    required List<_i1.GEpisode?> appearsIn,
  })  : friends = friends == null ? null : List.unmodifiable(friends),
        appearsIn = List.unmodifiable(appearsIn),
        super(G__typename: G__typename);

  factory GSearchResultsQueryData_search__asDroid.fromJson(
      Map<String, dynamic> json) {
    return GSearchResultsQueryData_search__asDroid(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      name: (json['name'] as String),
      friends: json['friends'] == null
          ? null
          : List<GFriendInfoData?>.unmodifiable(
              (json['friends'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GFriendInfoData.fromJson((_$e as Map<String, dynamic>)))
                  .toList()),
      appearsIn: List<_i1.GEpisode?>.unmodifiable(
          (json['appearsIn'] as List<dynamic>)
              .map((_$e) =>
                  _$e == null ? null : _i1.GEpisode.fromJson((_$e as String)))
              .toList()),
    );
  }

  final String id;

  final String name;

  final List<GFriendInfoData?>? friends;

  final List<_i1.GEpisode?> appearsIn;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    final _$friendsValue = this.friends;
    _$result['friends'] = _$friendsValue == null
        ? null
        : _$friendsValue
            .map((_$e) => _$e == null ? null : _$e.toJson())
            .toList();
    _$result['appearsIn'] =
        this.appearsIn.map((_$e) => _$e == null ? null : _$e.toJson()).toList();
    return _$result;
  }

  GSearchResultsQueryData_search__asDroid copyWith({
    String? G__typename,
    String? id,
    String? name,
    List<GFriendInfoData?>? friends,
    bool friendsIsSet = false,
    List<_i1.GEpisode?>? appearsIn,
  }) {
    return GSearchResultsQueryData_search__asDroid(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      name: name ?? this.name,
      friends: friendsIsSet ? friends : this.friends,
      appearsIn: appearsIn ?? this.appearsIn,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchResultsQueryData_search__asDroid &&
            G__typename == other.G__typename &&
            id == other.id &&
            name == other.name &&
            _gqlUtils.listEquals(friends, other.friends) &&
            _gqlUtils.listEquals(appearsIn, other.appearsIn));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, name,
        _gqlUtils.listHash(friends), _gqlUtils.listHash(appearsIn));
  }

  @override
  String toString() {
    return 'GSearchResultsQueryData_search__asDroid(G__typename: $G__typename, id: $id, name: $name, friends: $friends, appearsIn: $appearsIn)';
  }
}

class GSearchResultsQueryData_search__unknown
    extends GSearchResultsQueryData_search {
  GSearchResultsQueryData_search__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GSearchResultsQueryData_search__unknown.fromJson(
      Map<String, dynamic> json) {
    return GSearchResultsQueryData_search__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GSearchResultsQueryData_search__unknown copyWith({String? G__typename}) {
    return GSearchResultsQueryData_search__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchResultsQueryData_search__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GSearchResultsQueryData_search__unknown(G__typename: $G__typename)';
  }
}
