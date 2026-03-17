// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GPostsByLikesVars {
  const GPostsByLikesVars({this.likes = const Value.absent()});

  factory GPostsByLikesVars.fromJson(Map<String, dynamic> json) {
    return GPostsByLikesVars(
        likes: json.containsKey('likes')
            ? Value.present(json['likes'] == null
                ? null
                : List<_i1.GPostLikesInput?>.unmodifiable(
                    (json['likes'] as List<dynamic>)
                        .map((_$e) => _$e == null
                            ? null
                            : _i1.GPostLikesInput.fromJson(
                                (_$e as Map<String, dynamic>)))
                        .toList()))
            : Value.absent());
  }

  final Value<List<_i1.GPostLikesInput?>> likes;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$likesValue = this.likes;
    if (_$likesValue.isPresent) {
      final _$likesRequired = _$likesValue.requireValue;
      _$result['likes'] = _$likesRequired == null
          ? null
          : _$likesRequired
              .map((_$e) => _$e == null ? null : _$e.toJson())
              .toList();
    }
    return _$result;
  }

  GPostsByLikesVars copyWith({Value<List<_i1.GPostLikesInput?>>? likes}) {
    return GPostsByLikesVars(likes: likes ?? this.likes);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostsByLikesVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GPostsByLikesVars(likes: $likes)';
  }
}
