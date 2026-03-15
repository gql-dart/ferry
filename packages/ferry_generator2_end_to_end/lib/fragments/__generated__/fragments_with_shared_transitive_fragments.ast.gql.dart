// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_friends_and_name.ast.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_name_and_id.ast.gql.dart'
    as _i4;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/shared_fragment.ast.gql.dart'
    as _i3;
import 'package:gql/ast.dart' as _i1;

const HeroWith2FragmentsWithSharedTransitiveFragments =
    _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'HeroWith2FragmentsWithSharedTransitiveFragments'),
  variableDefinitions: [],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'hero'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'episode'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'JEDI')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'heroNameAndId'),
          directives: [],
        ),
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'heroFriendsAndName'),
          directives: [],
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const document = _i1.DocumentNode(definitions: [
  HeroWith2FragmentsWithSharedTransitiveFragments,
  _i2.heroFriendsAndName,
  _i3.SharedFragment,
  _i4.heroNameAndId,
]);
