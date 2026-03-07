// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

class GPokemonDetailVars {
  const GPokemonDetailVars({required this.id});

  factory GPokemonDetailVars.fromJson(Map<String, dynamic> json) {
    return GPokemonDetailVars(id: (json['id'] as int));
  }

  final int id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }
}
