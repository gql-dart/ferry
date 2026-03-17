// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GPostsWithFixedVariableVars {
  const GPostsWithFixedVariableVars({this.filter = const Value.absent()});

  factory GPostsWithFixedVariableVars.fromJson(Map<String, dynamic> json) {
    return GPostsWithFixedVariableVars(
        filter: json.containsKey('filter')
            ? Value.present(json['filter'] == null
                ? null
                : Map<String, dynamic>.unmodifiable(
                    (json['filter'] as Map<String, dynamic>)))
            : Value.absent());
  }

  final Value<Map<String, dynamic>> filter;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$filterValue = this.filter;
    if (_$filterValue.isPresent) {
      final _$filterRequired = _$filterValue.requireValue;
      _$result['filter'] = _$filterRequired == null ? null : _$filterRequired;
    }
    return _$result;
  }

  GPostsWithFixedVariableVars copyWith({Value<Map<String, dynamic>>? filter}) {
    return GPostsWithFixedVariableVars(filter: filter ?? this.filter);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostsWithFixedVariableVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GPostsWithFixedVariableVars(filter: $filter)';
  }
}
