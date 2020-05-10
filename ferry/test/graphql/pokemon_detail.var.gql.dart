class PokemonDetailVarBuilder {
  final Map<String, dynamic> variables = <String, dynamic>{};

  set id(String value) => variables['id'] = value;
  set name(String value) => variables['name'] = value;
}
