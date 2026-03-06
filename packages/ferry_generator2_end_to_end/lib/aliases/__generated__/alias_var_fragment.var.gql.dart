// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GPostsVars {
  const GPostsVars({required this.userId});

  factory GPostsVars.fromJson(Map<String, dynamic> json) {
    return GPostsVars(userId: (json['userId'] as String));
  }

  final String userId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$userIdValue = this.userId;
    _$result['userId'] = _$userIdValue;
    return _$result;
  }

  GPostsVars copyWith({String? userId}) {
    return GPostsVars(userId: userId ?? this.userId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostsVars && _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GPostsVars(userId: $userId)';
  }
}

class GPostFragmentVars {
  const GPostFragmentVars({required this.userId});

  factory GPostFragmentVars.fromJson(Map<String, dynamic> json) {
    return GPostFragmentVars(userId: (json['userId'] as String));
  }

  final String userId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$userIdValue = this.userId;
    _$result['userId'] = _$userIdValue;
    return _$result;
  }

  GPostFragmentVars copyWith({String? userId}) {
    return GPostFragmentVars(userId: userId ?? this.userId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostFragmentVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GPostFragmentVars(userId: $userId)';
  }
}
