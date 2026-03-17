// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GHeroWithInterfaceUnnamedFragmentsVars {
  const GHeroWithInterfaceUnnamedFragmentsVars({required this.episode});

  factory GHeroWithInterfaceUnnamedFragmentsVars.fromJson(
      Map<String, dynamic> json) {
    return GHeroWithInterfaceUnnamedFragmentsVars(
        episode: _i1.GEpisode.fromJson((json['episode'] as String)));
  }

  /// The episodes in the Star Wars trilogy.
  final _i1.GEpisode episode;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$episodeValue = this.episode;
    _$result['episode'] = _$episodeValue.toJson();
    return _$result;
  }

  GHeroWithInterfaceUnnamedFragmentsVars copyWith({_i1.GEpisode? episode}) {
    return GHeroWithInterfaceUnnamedFragmentsVars(
        episode: episode ?? this.episode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHeroWithInterfaceUnnamedFragmentsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GHeroWithInterfaceUnnamedFragmentsVars(episode: $episode)';
  }
}
