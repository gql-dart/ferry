// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_friends_and_name.ast.gql.dart'
    as _i4;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_friends_and_name.data.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/shared_fragment.ast.gql.dart'
    as _i5;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql/ast.dart' as _i3;

class GheroFriendsAndNameReq
    implements _i1.FragmentRequest<_i2.GheroFriendsAndNameData, Null> {
  GheroFriendsAndNameReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'heroFriendsAndName',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.heroFriendsAndName,
    _i5.SharedFragment,
  ]);

  _i2.GheroFriendsAndNameData? parseData(Map<String, dynamic> json) =>
      _i2.GheroFriendsAndNameData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GheroFriendsAndNameData data) =>
      data.toJson();

  GheroFriendsAndNameReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GheroFriendsAndNameReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroFriendsAndNameReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            document == other.document &&
            fragmentName == other.fragmentName &&
            _gqlUtils.deepEquals(idFields, other.idFields));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(varsToJson()), document,
        fragmentName, _gqlUtils.deepHash(idFields));
  }

  @override
  String toString() {
    return 'GheroFriendsAndNameReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
