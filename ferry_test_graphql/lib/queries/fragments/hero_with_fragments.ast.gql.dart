// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const HeroWithFragments = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'HeroWithFragments'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'first')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'hero'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'episode'),
                value: _i1.EnumValueNode(name: _i1.NameNode(value: 'JEDI')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FragmentSpreadNode(
                name: _i1.NameNode(value: 'comparisonFields'), directives: [])
          ]))
    ]));
const heroData = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'heroData'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Character'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const comparisonFields = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'comparisonFields'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Character'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'heroData'), directives: []),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'friendsConnection'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'first')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'node'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FragmentSpreadNode(
                            name: _i1.NameNode(value: 'heroData'),
                            directives: [])
                      ]))
                ]))
          ]))
    ]));
const document = _i1.DocumentNode(
    definitions: [HeroWithFragments, heroData, comparisonFields]);
