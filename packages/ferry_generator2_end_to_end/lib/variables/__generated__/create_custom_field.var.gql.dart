// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GCreateCustomFieldVars {
  const GCreateCustomFieldVars({required this.input});

  factory GCreateCustomFieldVars.fromJson(Map<String, dynamic> json) {
    return GCreateCustomFieldVars(
        input: _i1.GCustomFieldInput.fromJson(
            (json['input'] as Map<String, dynamic>)));
  }

  final _i1.GCustomFieldInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GCreateCustomFieldVars copyWith({_i1.GCustomFieldInput? input}) {
    return GCreateCustomFieldVars(input: input ?? this.input);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateCustomFieldVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateCustomFieldVars(input: $input)';
  }
}
