// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// A character from the Star Wars universe.
abstract class GSharedFragment {
  String get name;
  String get G__typename;
}

/// A character from the Star Wars universe.
class GSharedFragmentData implements GSharedFragment {
  const GSharedFragmentData({
    required this.name,
    required this.G__typename,
  });

  factory GSharedFragmentData.fromJson(Map<String, dynamic> json) {
    return GSharedFragmentData(
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

  GSharedFragmentData copyWith({
    String? name,
    String? G__typename,
  }) {
    return GSharedFragmentData(
      name: name ?? this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedFragmentData &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, G__typename);
  }

  @override
  String toString() {
    return 'GSharedFragmentData(name: $name, G__typename: $G__typename)';
  }
}
