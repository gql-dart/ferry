// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// The query type for the schema.
class GDuplicateNullChecksData {
  const GDuplicateNullChecksData({
    this.duplicateNullChecks,
    required this.G__typename,
  });

  factory GDuplicateNullChecksData.fromJson(Map<String, dynamic> json) {
    return GDuplicateNullChecksData(
      duplicateNullChecks: json['duplicateNullChecks'] == null
          ? null
          : (json['duplicateNullChecks'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? duplicateNullChecks;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$duplicateNullChecksValue = this.duplicateNullChecks;
    _$result['duplicateNullChecks'] =
        _$duplicateNullChecksValue == null ? null : _$duplicateNullChecksValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDuplicateNullChecksData copyWith({
    String? duplicateNullChecks,
    bool duplicateNullChecksIsSet = false,
    String? G__typename,
  }) {
    return GDuplicateNullChecksData(
      duplicateNullChecks: duplicateNullChecksIsSet
          ? duplicateNullChecks
          : this.duplicateNullChecks,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDuplicateNullChecksData &&
            duplicateNullChecks == other.duplicateNullChecks &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, duplicateNullChecks, G__typename);
  }

  @override
  String toString() {
    return 'GDuplicateNullChecksData(duplicateNullChecks: $duplicateNullChecks, G__typename: $G__typename)';
  }
}
