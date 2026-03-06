// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GHeroForEpisodeVars {
  const GHeroForEpisodeVars({required this.ep});

  factory GHeroForEpisodeVars.fromJson(Map<String, dynamic> json) {
    return GHeroForEpisodeVars(
        ep: _i1.GEpisode.fromJson((json['ep'] as String)));
  }

  /// The episodes in the Star Wars trilogy.
  final _i1.GEpisode ep;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$epValue = this.ep;
    _$result['ep'] = _$epValue.toJson();
    return _$result;
  }

  GHeroForEpisodeVars copyWith({_i1.GEpisode? ep}) {
    return GHeroForEpisodeVars(ep: ep ?? this.ep);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroForEpisodeVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GHeroForEpisodeVars(ep: $ep)';
  }
}
