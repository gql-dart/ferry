// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i3;
import 'package:pokemon_explorer2/graphql/__generated__/pokemon_card_fragment.ast.gql.dart'
    as _i4;
import 'package:pokemon_explorer2/graphql/__generated__/pokemon_card_fragment.data.gql.dart'
    as _i2;

class GPokemonCardReq
    implements _i1.FragmentRequest<_i2.GPokemonCardData, Null> {
  GPokemonCardReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'PokemonCard',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static final _i3.DocumentNode _document = _i4.document;

  _i2.GPokemonCardData? parseData(Map<String, dynamic> json) =>
      _i2.GPokemonCardData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GPokemonCardData data) => data.toJson();
}
