// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GHeroWithFragmentsVars {
  const GHeroWithFragmentsVars({this.first = const Value.absent()});

  factory GHeroWithFragmentsVars.fromJson(Map<String, dynamic> json) {
    return GHeroWithFragmentsVars(
        first: json.containsKey('first')
            ? Value.present(
                json['first'] == null ? null : (json['first'] as int))
            : Value.absent());
  }

  final Value<int> first;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$firstValue = this.first;
    if (_$firstValue.isPresent) {
      final _$firstRequired = _$firstValue.requireValue;
      _$result['first'] = _$firstRequired == null ? null : _$firstRequired;
    }
    return _$result;
  }

  GHeroWithFragmentsVars copyWith({Value<int>? first}) {
    return GHeroWithFragmentsVars(first: first ?? this.first);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithFragmentsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GHeroWithFragmentsVars(first: $first)';
  }
}

class GcomparisonFieldsVars {
  const GcomparisonFieldsVars({this.first = const Value.absent()});

  factory GcomparisonFieldsVars.fromJson(Map<String, dynamic> json) {
    return GcomparisonFieldsVars(
        first: json.containsKey('first')
            ? Value.present(
                json['first'] == null ? null : (json['first'] as int))
            : Value.absent());
  }

  final Value<int> first;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$firstValue = this.first;
    if (_$firstValue.isPresent) {
      final _$firstRequired = _$firstValue.requireValue;
      _$result['first'] = _$firstRequired == null ? null : _$firstRequired;
    }
    return _$result;
  }

  GcomparisonFieldsVars copyWith({Value<int>? first}) {
    return GcomparisonFieldsVars(first: first ?? this.first);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcomparisonFieldsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GcomparisonFieldsVars(first: $first)';
  }
}
