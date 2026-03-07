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
          .map((_$e) => GPokemonDetailData_pokemon.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GPokemonDetailData_pokemon> pokemon;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['pokemon'] = this.pokemon.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
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
          .map((_$e) => GPokemonDetailData_pokemon_pokemonsprites.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      pokemontypes: (json['pokemontypes'] as List<dynamic>)
          .map((_$e) => GPokemonDetailData_pokemon_pokemontypes.fromJson(
              (_$e as Map<String, dynamic>)))
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
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    final _$heightValue = this.height;
    _$result['height'] = _$heightValue == null ? null : _$heightValue;
    final _$weightValue = this.weight;
    _$result['weight'] = _$weightValue == null ? null : _$weightValue;
    _$result['pokemonsprites'] =
        this.pokemonsprites.map((_$e) => _$e.toJson()).toList();
    _$result['pokemontypes'] =
        this.pokemontypes.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    final _$base_experienceValue = this.base_experience;
    _$result['base_experience'] =
        _$base_experienceValue == null ? null : _$base_experienceValue;
    return _$result;
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
    final _$result = <String, dynamic>{};
    _$result['sprites'] = this.sprites;
    _$result['__typename'] = this.G__typename;
    return _$result;
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
    final _$result = <String, dynamic>{};
    _$result['slot'] = this.slot;
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue == null ? null : _$typeValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
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
    final _$result = <String, dynamic>{};
    _$result['name'] = this.name;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}
