// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const NestedFragment = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'NestedFragment'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Pokemon'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'avatar'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const PokemonCard = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'PokemonCard'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Pokemon'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'NestedFragment'), directives: []),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'height'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'in_meter'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'weight'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'in_kg'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [NestedFragment, PokemonCard]);
