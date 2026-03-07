// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

class GAllPokemonVars {
  const GAllPokemonVars({
    required this.limit,
    required this.offset,
  });

  factory GAllPokemonVars.fromJson(Map<String, dynamic> json) {
    return GAllPokemonVars(
      limit: (json['limit'] as int),
      offset: (json['offset'] as int),
    );
  }

  final int limit;

  final int offset;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$limitValue = this.limit;
    _$result['limit'] = _$limitValue;
    final _$offsetValue = this.offset;
    _$result['offset'] = _$offsetValue;
    return _$result;
  }
}
