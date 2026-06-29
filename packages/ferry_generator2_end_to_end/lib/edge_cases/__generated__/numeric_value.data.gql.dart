// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The query type for the schema.
class GNumericValueData {
  const GNumericValueData({
    this.numericValue,
    this.G__typename = 'Query',
  });

  factory GNumericValueData.fromJson(Map<String, dynamic> json) {
    return GNumericValueData(
      numericValue: json['numericValue'] == null
          ? null
          : GNumericValueData_numericValue.fromJson(
              (json['numericValue'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GNumericValueData_numericValue? numericValue;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$numericValueValue = this.numericValue;
    _$result['numericValue'] =
        _$numericValueValue == null ? null : _$numericValueValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GNumericValueData copyWith({
    GNumericValueData_numericValue? numericValue,
    bool numericValueIsSet = false,
    String? G__typename,
  }) {
    return GNumericValueData(
      numericValue: numericValueIsSet ? numericValue : this.numericValue,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GNumericValueData &&
            numericValue == other.numericValue &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, numericValue, G__typename);
  }

  @override
  String toString() {
    return 'GNumericValueData(numericValue: $numericValue, G__typename: $G__typename)';
  }
}

class GNumericValueData_numericValue {
  GNumericValueData_numericValue({
    this.value,
    required List<double> floatValues,
    this.intValue,
    this.G__typename = 'NumericValue',
  }) : floatValues = List.unmodifiable(floatValues);

  factory GNumericValueData_numericValue.fromJson(Map<String, dynamic> json) {
    return GNumericValueData_numericValue(
      value: json['value'] == null ? null : (json['value'] as num).toDouble(),
      floatValues: List<double>.unmodifiable(
          (json['floatValues'] as List<dynamic>)
              .map((_$e) => (_$e as num).toDouble())
              .toList()),
      intValue: json['intValue'] == null ? null : (json['intValue'] as int),
      G__typename: (json['__typename'] as String),
    );
  }

  final double? value;

  final List<double> floatValues;

  final int? intValue;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$valueValue = this.value;
    _$result['value'] = _$valueValue == null ? null : _$valueValue;
    _$result['floatValues'] = this.floatValues.map((_$e) => _$e).toList();
    final _$intValueValue = this.intValue;
    _$result['intValue'] = _$intValueValue == null ? null : _$intValueValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GNumericValueData_numericValue copyWith({
    double? value,
    bool valueIsSet = false,
    List<double>? floatValues,
    int? intValue,
    bool intValueIsSet = false,
    String? G__typename,
  }) {
    return GNumericValueData_numericValue(
      value: valueIsSet ? value : this.value,
      floatValues: floatValues ?? this.floatValues,
      intValue: intValueIsSet ? intValue : this.intValue,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GNumericValueData_numericValue &&
            value == other.value &&
            _gqlUtils.listEquals(floatValues, other.floatValues) &&
            intValue == other.intValue &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, value, _gqlUtils.listHash(floatValues),
        intValue, G__typename);
  }

  @override
  String toString() {
    return 'GNumericValueData_numericValue(value: $value, floatValues: $floatValues, intValue: $intValue, G__typename: $G__typename)';
  }
}
