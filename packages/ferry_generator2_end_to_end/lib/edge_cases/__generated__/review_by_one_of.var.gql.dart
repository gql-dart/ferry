// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GReviewByOneOfVars {
  const GReviewByOneOfVars({required this.by});

  factory GReviewByOneOfVars.fromJson(Map<String, dynamic> json) {
    return GReviewByOneOfVars(
        by: _i1.GReviewBy.fromJson((json['by'] as Map<String, dynamic>)));
  }

  /// OneOf input used to locate a review by exactly one criterion.
  final _i1.GReviewBy by;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$byValue = this.by;
    _$result['by'] = _$byValue.toJson();
    return _$result;
  }

  GReviewByOneOfVars copyWith({_i1.GReviewBy? by}) {
    return GReviewByOneOfVars(by: by ?? this.by);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewByOneOfVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GReviewByOneOfVars(by: $by)';
  }
}
