// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const AliasedHero = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AliasedHero'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'ep')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Episode'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'hero'),
          alias: _i1.NameNode(value: 'empireHero'),
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'episode'),
                value: _i1.EnumValueNode(name: _i1.NameNode(value: 'EMPIRE')))
          ],
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
                name: _i1.NameNode(value: 'appearsIn'),
                alias: _i1.NameNode(value: 'from'),
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'hero'),
          alias: _i1.NameNode(value: 'jediHero'),
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'episode'),
                value: _i1.EnumValueNode(name: _i1.NameNode(value: 'JEDI')))
          ],
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
                name: _i1.NameNode(value: 'appearsIn'),
                alias: _i1.NameNode(value: 'from'),
                arguments: [],
                directives: [],
                selectionSet: null)
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [AliasedHero]);
