// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:pokemon_explorer2/graphql/__generated__/pokemon_card_fragment.data.gql.dart'
    as _i1;

class GPokemonDetailData {
  const GPokemonDetailData({
    required this.pokemon,
    required this.G__typename,
  });

  factory GPokemonDetailData.fromJson(Map<String, dynamic> json) {
    return GPokemonDetailData(
      pokemon: (json['pokemon'] as List<dynamic>)
          .map((e) =>
              GPokemonDetailData_pokemon.fromJson((e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GPokemonDetailData_pokemon> pokemon;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['pokemon'] = pokemon.map((e) => e.toJson()).toList();
    result['__typename'] = G__typename;
    return result;
  }
}

class GPokemonDetailData_pokemon implements _i1.GPokemonCard {
  const GPokemonDetailData_pokemon({
    required this.id,
    required this.name,
    this.height,
    this.weight,
    required this.pokemonsprites,
    required this.pokemontypes,
    required this.G__typename,
    this.base_experience,
  });

  factory GPokemonDetailData_pokemon.fromJson(Map<String, dynamic> json) {
    return GPokemonDetailData_pokemon(
      id: (json['id'] as int),
      name: (json['name'] as String),
      height: json['height'] == null ? null : (json['height'] as int),
      weight: json['weight'] == null ? null : (json['weight'] as int),
      pokemonsprites: (json['pokemonsprites'] as List<dynamic>)
          .map((e) => GPokemonDetailData_pokemon_pokemonsprites.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pokemontypes: (json['pokemontypes'] as List<dynamic>)
          .map((e) => GPokemonDetailData_pokemon_pokemontypes.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
      base_experience: json['base_experience'] == null
          ? null
          : (json['base_experience'] as int),
    );
  }

  final int id;

  final String name;

  final int? height;

  final int? weight;

  final List<GPokemonDetailData_pokemon_pokemonsprites> pokemonsprites;

  final List<GPokemonDetailData_pokemon_pokemontypes> pokemontypes;

  final String G__typename;

  final int? base_experience;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['id'] = id;
    result['name'] = name;
    final heightValue = height;
    result['height'] = heightValue == null ? null : heightValue;
    final weightValue = weight;
    result['weight'] = weightValue == null ? null : weightValue;
    result['pokemonsprites'] = pokemonsprites.map((e) => e.toJson()).toList();
    result['pokemontypes'] = pokemontypes.map((e) => e.toJson()).toList();
    result['__typename'] = G__typename;
    final base_experienceValue = base_experience;
    result['base_experience'] =
        base_experienceValue == null ? null : base_experienceValue;
    return result;
  }
}

class GPokemonDetailData_pokemon_pokemonsprites
    implements _i1.GPokemonCard_pokemonsprites {
  const GPokemonDetailData_pokemon_pokemonsprites({
    required this.sprites,
    required this.G__typename,
  });

  factory GPokemonDetailData_pokemon_pokemonsprites.fromJson(
      Map<String, dynamic> json) {
    return GPokemonDetailData_pokemon_pokemonsprites(
      sprites: (json['sprites'] as Map<String, dynamic>),
      G__typename: (json['__typename'] as String),
    );
  }

  final Map<String, dynamic> sprites;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['sprites'] = sprites;
    result['__typename'] = G__typename;
    return result;
  }
}

class GPokemonDetailData_pokemon_pokemontypes
    implements _i1.GPokemonCard_pokemontypes {
  const GPokemonDetailData_pokemon_pokemontypes({
    required this.slot,
    this.type,
    required this.G__typename,
  });

  factory GPokemonDetailData_pokemon_pokemontypes.fromJson(
      Map<String, dynamic> json) {
    return GPokemonDetailData_pokemon_pokemontypes(
      slot: (json['slot'] as int),
      type: json['type'] == null
          ? null
          : GPokemonDetailData_pokemon_pokemontypes_type.fromJson(
              (json['type'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final int slot;

  final GPokemonDetailData_pokemon_pokemontypes_type? type;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['slot'] = slot;
    final typeValue = type;
    result['type'] = typeValue == null ? null : typeValue.toJson();
    result['__typename'] = G__typename;
    return result;
  }
}

class GPokemonDetailData_pokemon_pokemontypes_type
    implements _i1.GPokemonCard_pokemontypes_type {
  const GPokemonDetailData_pokemon_pokemontypes_type({
    required this.name,
    required this.G__typename,
  });

  factory GPokemonDetailData_pokemon_pokemontypes_type.fromJson(
      Map<String, dynamic> json) {
    return GPokemonDetailData_pokemon_pokemontypes_type(
      name: (json['name'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String name;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['name'] = name;
    result['__typename'] = G__typename;
    return result;
  }
}
