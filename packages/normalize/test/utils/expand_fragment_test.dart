import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:normalize/src/utils/expand_fragments.dart';
import 'package:test/test.dart';

void main() {
  test("expands fragments", () {
    final query = parseString('''
query AllPokemons {
    allPokemons {
        id
        ...nameAndAvatar
    }
}
fragment nameAndAvatar on Pokemon {
    name
    avatar
}''');

    final fragmentMap = {
      'nameAndAvatar': query.definitions[1] as FragmentDefinitionNode,
    };

    final expanded = expandFragments(
      typename: 'Pokemon',
      selectionSet: ((query.definitions.first as OperationDefinitionNode)
              .selectionSet
              .selections
              .first as FieldNode)
          .selectionSet!,
      fragmentMap: fragmentMap,
      possibleTypes: {},
      variables: {},
    );

    expect(expanded, [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'avatar'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]);
  });

  test("does not expand skipped fragments", () {
    final query = parseString('''
query AllPokemons {
    allPokemons {
        id
        ...nameAndAvatar @skip(if: true)
    }
}    
fragment nameAndAvatar on Pokemon {
    name
    avatar
}''');

    final fragmentMap = {
      'nameAndAvatar': query.definitions[1] as FragmentDefinitionNode,
    };

    final expanded = expandFragments(
      typename: 'Pokemon',
      selectionSet: ((query.definitions.first as OperationDefinitionNode)
              .selectionSet
              .selections
              .first as FieldNode)
          .selectionSet!,
      fragmentMap: fragmentMap,
      possibleTypes: {},
      variables: {},
    );

    expect(expanded, [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]);
  });

  test("does not expand skipped fragments with variables", () {
    final query = parseString('''query AllPokemons {  
        allPokemons {
          id
          ...nameAndAvatar @skip(if: \$skip)
        }
      }
      fragment nameAndAvatar on Pokemon {
        name
        avatar
      }''');

    final fragmentMap = {
      'nameAndAvatar': query.definitions[1] as FragmentDefinitionNode,
    };

    final expanded = expandFragments(
      typename: 'Pokemon',
      selectionSet: ((query.definitions.first as OperationDefinitionNode)
              .selectionSet
              .selections
              .first as FieldNode)
          .selectionSet!,
      fragmentMap: fragmentMap,
      possibleTypes: {},
      variables: {
        'skip': true,
      },
    );

    expect(expanded, [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]);
  });

  test(
      "expands fragments with skip directive with argument that evaluates to false",
      () {
    final query = parseString('''query AllPokemons {  
        allPokemons {
          id
          ...nameAndAvatar @skip(if: \$skip)
        }
      }
      fragment nameAndAvatar on Pokemon {
        name
        avatar
      }''');

    final fragmentMap = {
      'nameAndAvatar': query.definitions[1] as FragmentDefinitionNode,
    };

    final expanded = expandFragments(
      typename: 'Pokemon',
      selectionSet: ((query.definitions.first as OperationDefinitionNode)
              .selectionSet
              .selections
              .first as FieldNode)
          .selectionSet!,
      fragmentMap: fragmentMap,
      possibleTypes: {},
      variables: {
        'skip': false,
      },
    );

    expect(expanded, [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'avatar'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]);
  });
}
