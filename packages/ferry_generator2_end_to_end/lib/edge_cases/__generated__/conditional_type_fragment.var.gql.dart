// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GHeroConditionalTypeFragmentVars {
  const GHeroConditionalTypeFragmentVars({required this.includeHuman});

  factory GHeroConditionalTypeFragmentVars.fromJson(Map<String, dynamic> json) {
    return GHeroConditionalTypeFragmentVars(
        includeHuman: (json['includeHuman'] as bool));
  }

  final bool includeHuman;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$includeHumanValue = this.includeHuman;
    _$result['includeHuman'] = _$includeHumanValue;
    return _$result;
  }

  GHeroConditionalTypeFragmentVars copyWith({bool? includeHuman}) {
    return GHeroConditionalTypeFragmentVars(
        includeHuman: includeHuman ?? this.includeHuman);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroConditionalTypeFragmentVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GHeroConditionalTypeFragmentVars(includeHuman: $includeHuman)';
  }
}
