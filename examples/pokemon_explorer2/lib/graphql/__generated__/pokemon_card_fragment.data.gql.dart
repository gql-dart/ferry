// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

abstract class GPokemonCard {
  int get id;
  String get name;
  int? get height;
  int? get weight;
  List<GPokemonCard_pokemonsprites> get pokemonsprites;
  List<GPokemonCard_pokemontypes> get pokemontypes;
  String get G__typename;
}

abstract class GPokemonCard_pokemonsprites {
  Map<String, dynamic> get sprites;
  String get G__typename;
}

abstract class GPokemonCard_pokemontypes {
  int get slot;
  GPokemonCard_pokemontypes_type? get type;
  String get G__typename;
}

abstract class GPokemonCard_pokemontypes_type {
  String get name;
  String get G__typename;
}

class GPokemonCardData implements GPokemonCard {
  const GPokemonCardData({
    required this.id,
    required this.name,
    this.height,
    this.weight,
    required this.pokemonsprites,
    required this.pokemontypes,
    required this.G__typename,
  });

  factory GPokemonCardData.fromJson(Map<String, dynamic> json) {
    return GPokemonCardData(
      id: (json['id'] as int),
      name: (json['name'] as String),
      height: json['height'] == null ? null : (json['height'] as int),
      weight: json['weight'] == null ? null : (json['weight'] as int),
      pokemonsprites: (json['pokemonsprites'] as List<dynamic>)
          .map((e) => GPokemonCardData_pokemonsprites.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pokemontypes: (json['pokemontypes'] as List<dynamic>)
          .map((e) => GPokemonCardData_pokemontypes.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final String name;

  final int? height;

  final int? weight;

  final List<GPokemonCardData_pokemonsprites> pokemonsprites;

  final List<GPokemonCardData_pokemontypes> pokemontypes;

  final String G__typename;

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
    return result;
  }
}

class GPokemonCardData_pokemonsprites implements GPokemonCard_pokemonsprites {
  const GPokemonCardData_pokemonsprites({
    required this.sprites,
    required this.G__typename,
  });

  factory GPokemonCardData_pokemonsprites.fromJson(Map<String, dynamic> json) {
    return GPokemonCardData_pokemonsprites(
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

class GPokemonCardData_pokemontypes implements GPokemonCard_pokemontypes {
  const GPokemonCardData_pokemontypes({
    required this.slot,
    this.type,
    required this.G__typename,
  });

  factory GPokemonCardData_pokemontypes.fromJson(Map<String, dynamic> json) {
    return GPokemonCardData_pokemontypes(
      slot: (json['slot'] as int),
      type: json['type'] == null
          ? null
          : GPokemonCardData_pokemontypes_type.fromJson(
              (json['type'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final int slot;

  final GPokemonCardData_pokemontypes_type? type;

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

class GPokemonCardData_pokemontypes_type
    implements GPokemonCard_pokemontypes_type {
  const GPokemonCardData_pokemontypes_type({
    required this.name,
    required this.G__typename,
  });

  factory GPokemonCardData_pokemontypes_type.fromJson(
      Map<String, dynamic> json) {
    return GPokemonCardData_pokemontypes_type(
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
