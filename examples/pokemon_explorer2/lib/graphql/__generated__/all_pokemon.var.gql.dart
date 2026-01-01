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
    final result = <String, dynamic>{};
    final limitValue = limit;
    result['limit'] = limitValue;
    final offsetValue = offset;
    result['offset'] = offsetValue;
    return result;
  }
}
