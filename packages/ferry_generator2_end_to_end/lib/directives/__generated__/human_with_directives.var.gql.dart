// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GHumanWithDirectivesVars {
  const GHumanWithDirectivesVars({
    required this.includeName,
    required this.skipId,
  });

  factory GHumanWithDirectivesVars.fromJson(Map<String, dynamic> json) {
    return GHumanWithDirectivesVars(
      includeName: (json['includeName'] as bool),
      skipId: (json['skipId'] as bool),
    );
  }

  final bool includeName;

  final bool skipId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$includeNameValue = this.includeName;
    _$result['includeName'] = _$includeNameValue;
    final _$skipIdValue = this.skipId;
    _$result['skipId'] = _$skipIdValue;
    return _$result;
  }

  GHumanWithDirectivesVars copyWith({
    bool? includeName,
    bool? skipId,
  }) {
    return GHumanWithDirectivesVars(
      includeName: includeName ?? this.includeName,
      skipId: skipId ?? this.skipId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanWithDirectivesVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GHumanWithDirectivesVars(includeName: $includeName, skipId: $skipId)';
  }
}
