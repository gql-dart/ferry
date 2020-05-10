// GENERATED CODE - DO NOT MODIFY BY HAND

class $NestedFragment {
  const $NestedFragment(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
}

class $PokemonCard implements $NestedFragment {
  const $PokemonCard(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
  int get maxHP => (data['maxHP'] as int);
  String get image => (data['image'] as String);
}
