// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GHeroFragmentDirectivesVars {
  const GHeroFragmentDirectivesVars({
    required this.includeFrag,
    required this.skipName,
  });

  factory GHeroFragmentDirectivesVars.fromJson(Map<String, dynamic> json) {
    return GHeroFragmentDirectivesVars(
      includeFrag: (json['includeFrag'] as bool),
      skipName: (json['skipName'] as bool),
    );
  }

  final bool includeFrag;

  final bool skipName;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$includeFragValue = this.includeFrag;
    _$result['includeFrag'] = _$includeFragValue;
    final _$skipNameValue = this.skipName;
    _$result['skipName'] = _$skipNameValue;
    return _$result;
  }

  GHeroFragmentDirectivesVars copyWith({
    bool? includeFrag,
    bool? skipName,
  }) {
    return GHeroFragmentDirectivesVars(
      includeFrag: includeFrag ?? this.includeFrag,
      skipName: skipName ?? this.skipName,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroFragmentDirectivesVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GHeroFragmentDirectivesVars(includeFrag: $includeFrag, skipName: $skipName)';
  }
}
