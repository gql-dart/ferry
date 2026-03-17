// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GSearchWithDefaultVars {
  const GSearchWithDefaultVars({this.text = const Value.absent()});

  factory GSearchWithDefaultVars.fromJson(Map<String, dynamic> json) {
    return GSearchWithDefaultVars(
        text: json.containsKey('text')
            ? Value.present(
                json['text'] == null ? null : (json['text'] as String))
            : Value.absent());
  }

  final Value<String> text;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$textValue = this.text;
    if (_$textValue.isPresent) {
      final _$textRequired = _$textValue.requireValue;
      _$result['text'] = _$textRequired == null ? null : _$textRequired;
    }
    return _$result;
  }

  GSearchWithDefaultVars copyWith({Value<String>? text}) {
    return GSearchWithDefaultVars(text: text ?? this.text);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchWithDefaultVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSearchWithDefaultVars(text: $text)';
  }
}
