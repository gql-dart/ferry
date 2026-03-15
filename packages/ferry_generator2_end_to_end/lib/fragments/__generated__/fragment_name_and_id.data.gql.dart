// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/fragments/__generated__/shared_fragment.data.gql.dart'
    as _i1;

/// A character from the Star Wars universe.
abstract class GheroNameAndId {
  String get name;
  String get G__typename;
  String get id;
}

/// A character from the Star Wars universe.
class GheroNameAndIdData implements GheroNameAndId, _i1.GSharedFragment {
  const GheroNameAndIdData({
    required this.name,
    required this.G__typename,
    required this.id,
  });

  factory GheroNameAndIdData.fromJson(Map<String, dynamic> json) {
    return GheroNameAndIdData(
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

  GheroNameAndIdData copyWith({
    String? name,
    String? G__typename,
    String? id,
  }) {
    return GheroNameAndIdData(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroNameAndIdData &&
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
    return 'GheroNameAndIdData(name: $name, G__typename: $G__typename, id: $id)';
  }
}
