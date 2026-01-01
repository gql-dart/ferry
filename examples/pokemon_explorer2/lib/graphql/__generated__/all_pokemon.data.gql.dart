// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:pokemon_explorer2/graphql/__generated__/pokemon_card_fragment.data.gql.dart'
    as _i1;

class GAllPokemonData {
  const GAllPokemonData({
    required this.pokemon,
    required this.G__typename,
  });

  factory GAllPokemonData.fromJson(Map<String, dynamic> json) {
    return GAllPokemonData(
      pokemon: (json['pokemon'] as List<dynamic>)
          .map(
              (e) => _i1.GPokemonCardData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GPokemonCardData> pokemon;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['pokemon'] = pokemon.map((e) => e.toJson()).toList();
    result['__typename'] = G__typename;
    return result;
  }
}
