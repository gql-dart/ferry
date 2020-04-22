import 'package:gql/ast.dart' as _i1;
import './pokemon_card_fragment.ast.gql.dart' as _i2;

const AllPokemon = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AllPokemon'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'first')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemons'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'first')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FragmentSpreadNode(
                name: _i1.NameNode(value: 'PokemonCard'), directives: [])
          ]))
    ]));
const document = _i1.DocumentNode(
    definitions: [AllPokemon, _i2.NestedFragment, _i2.PokemonCard]);
