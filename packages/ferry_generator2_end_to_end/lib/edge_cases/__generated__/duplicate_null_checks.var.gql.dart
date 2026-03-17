// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GDuplicateNullChecksVars {
  const GDuplicateNullChecksVars({this.input = const Value.absent()});

  factory GDuplicateNullChecksVars.fromJson(Map<String, dynamic> json) {
    return GDuplicateNullChecksVars(
        input: json.containsKey('input')
            ? Value.present(json['input'] == null
                ? null
                : _i1.GDuplicateNullChecksInput.fromJson(
                    (json['input'] as Map<String, dynamic>)))
            : Value.absent());
  }

  /// Repro input for duplicate null checks in generated schema toJson.
  final Value<_i1.GDuplicateNullChecksInput> input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$inputValue = this.input;
    if (_$inputValue.isPresent) {
      final _$inputRequired = _$inputValue.requireValue;
      _$result['input'] =
          _$inputRequired == null ? null : _$inputRequired.toJson();
    }
    return _$result;
  }

  GDuplicateNullChecksVars copyWith(
      {Value<_i1.GDuplicateNullChecksInput>? input}) {
    return GDuplicateNullChecksVars(input: input ?? this.input);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDuplicateNullChecksVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDuplicateNullChecksVars(input: $input)';
  }
}
