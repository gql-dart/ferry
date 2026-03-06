// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The query type for the schema.
class GSearchWithDefaultData {
  GSearchWithDefaultData({
    List<GSearchWithDefaultData_search?>? search,
    required this.G__typename,
  }) : search = search == null ? null : List.unmodifiable(search);

  factory GSearchWithDefaultData.fromJson(Map<String, dynamic> json) {
    return GSearchWithDefaultData(
      search: json['search'] == null
          ? null
          : List<GSearchWithDefaultData_search?>.unmodifiable(
              (json['search'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : GSearchWithDefaultData_search.fromJson(
                          (_$e as Map<String, dynamic>)))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GSearchWithDefaultData_search?>? search;

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

  GSearchWithDefaultData copyWith({
    List<GSearchWithDefaultData_search?>? search,
    bool searchIsSet = false,
    String? G__typename,
  }) {
    return GSearchWithDefaultData(
      search: searchIsSet ? search : this.search,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchWithDefaultData &&
            _gqlUtils.listEquals(search, other.search) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(search), G__typename);
  }

  @override
  String toString() {
    return 'GSearchWithDefaultData(search: $search, G__typename: $G__typename)';
  }
}

class GSearchWithDefaultData_search {
  const GSearchWithDefaultData_search({required this.G__typename});

  factory GSearchWithDefaultData_search.fromJson(Map<String, dynamic> json) {
    return GSearchWithDefaultData_search(
        G__typename: (json['__typename'] as String));
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSearchWithDefaultData_search copyWith({String? G__typename}) {
    return GSearchWithDefaultData_search(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchWithDefaultData_search &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GSearchWithDefaultData_search(G__typename: $G__typename)';
  }
}
