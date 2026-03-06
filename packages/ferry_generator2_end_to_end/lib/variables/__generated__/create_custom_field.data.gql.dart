// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// The mutation type for the schema.
class GCreateCustomFieldData {
  const GCreateCustomFieldData({
    this.createCustomField,
    required this.G__typename,
  });

  factory GCreateCustomFieldData.fromJson(Map<String, dynamic> json) {
    return GCreateCustomFieldData(
      createCustomField: json['createCustomField'] == null
          ? null
          : (json['createCustomField'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? createCustomField;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$createCustomFieldValue = this.createCustomField;
    _$result['createCustomField'] =
        _$createCustomFieldValue == null ? null : _$createCustomFieldValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateCustomFieldData copyWith({
    String? createCustomField,
    bool createCustomFieldIsSet = false,
    String? G__typename,
  }) {
    return GCreateCustomFieldData(
      createCustomField:
          createCustomFieldIsSet ? createCustomField : this.createCustomField,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateCustomFieldData &&
            createCustomField == other.createCustomField &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createCustomField, G__typename);
  }

  @override
  String toString() {
    return 'GCreateCustomFieldData(createCustomField: $createCustomField, G__typename: $G__typename)';
  }
}
