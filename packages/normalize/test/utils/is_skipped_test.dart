import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:normalize/src/utils/well_known_directives.dart';
import 'package:test/test.dart';

void main() {
  group("skipped fields", () {
    test("fields without directives are not skipped", () {
      final fields = _getFieldsOfSimpleQuery('''query AllPokemon {
      pokemons {
        id
        name
        avatar
      }
    }''');

      for (final field in fields) {
        expect(isSkipped(field, const {}), false);
      }
    });

    test("fields with skip directive with true literal are skipped", () {
      Iterable<FieldNode> fields = _getFieldsOfSimpleQuery('''query AllPokemon {
      pokemons {
        id
        name
        avatar @skip(if: true)
      }
    }''');

      expect(fields.length, 3);

      bool isAvatarSkipped = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, const {}), true);
          isAvatarSkipped = true;
        } else {
          expect(isSkipped(field, const {}), false);
        }
      }
      expect(isAvatarSkipped, true);
    });

    test("fields with skip directive with false literal are not skipped", () {
      Iterable<FieldNode> fields = _getFieldsOfSimpleQuery('''query AllPokemon {
      pokemons {
        id
        name
        avatar @skip(if: false)
      }
    }''');

      expect(fields.length, 3);

      bool isAvaterVisited = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, const {}), false);
          isAvaterVisited = true;
        } else {
          expect(isSkipped(field, const {}), false);
        }
      }
      expect(isAvaterVisited, true);
    });

    test("fields with include directive with false literal are skipped", () {
      Iterable<FieldNode> fields = _getFieldsOfSimpleQuery('''query AllPokemon {
      pokemons {
        id
        name
        avatar @include(if: false)
      }
    }''');

      expect(fields.length, 3);

      bool isAvatarSkipped = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, const {}), true);
          isAvatarSkipped = true;
        } else {
          expect(isSkipped(field, const {}), false);
        }
      }
      expect(isAvatarSkipped, true);
    });

    test("fields with include directive with true literal are not skipped", () {
      Iterable<FieldNode> fields = _getFieldsOfSimpleQuery('''query AllPokemon {
      pokemons {
        id
        name
        avatar @include(if: true)
      }
    }''');

      expect(fields.length, 3);

      bool isAvatarVisited = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, const {}), false);
          isAvatarVisited = true;
        } else {
          expect(isSkipped(field, const {}), false);
        }
      }
      expect(isAvatarVisited, true);
    });

    test("fields with skip directive with variable set to true are skipped",
        () {
      Iterable<FieldNode> fields =
          _getFieldsOfSimpleQuery('''query AllPokemon(\$skipAvatar: Boolean!) {
      pokemons {
        id
        name
        avatar @skip(if: \$skipAvatar)
      }
    }''');

      expect(fields.length, 3);

      bool isAvatarSkipped = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, {"skipAvatar": true}), true);
          isAvatarSkipped = true;
        } else {
          expect(isSkipped(field, {"skipAvatar": true}), false);
        }
      }
      expect(isAvatarSkipped, true);
    });

    test(
        "fields with skip directive with variable set to false are not skipped",
        () {
      Iterable<FieldNode> fields =
          _getFieldsOfSimpleQuery('''query AllPokemon(\$skipAvatar: Boolean!) {
      pokemons {
        id
        name
        avatar @skip(if: \$skipAvatar)
      }
    }''');

      expect(fields.length, 3);

      bool isAvatarVisited = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, {"skipAvatar": false}), false);
          isAvatarVisited = true;
        } else {
          expect(isSkipped(field, {"skipAvatar": false}), false);
        }
      }
      expect(isAvatarVisited, true);
    });

    test(
        "fields with include directive with variable set to true are not skipped",
        () {
      Iterable<FieldNode> fields = _getFieldsOfSimpleQuery(
          '''query AllPokemon(\$includeAvatar: Boolean!) {
      pokemons {
        id
        name
        avatar @include(if: \$includeAvatar)
      }
    }''');

      expect(fields.length, 3);

      bool isAvatarVisited = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, {"includeAvatar": true}), false);
          isAvatarVisited = true;
        } else {
          expect(isSkipped(field, {"includeAvatar": true}), false);
        }
      }
      expect(isAvatarVisited, true);
    });

    test("fields with include directive with variable set to false are skipped",
        () {
      Iterable<FieldNode> fields = _getFieldsOfSimpleQuery(
          '''query AllPokemon(\$includeAvatar: Boolean!) {
      pokemons {
        id
        name
        avatar @include(if: \$includeAvatar)
      }
    }''');

      expect(fields.length, 3);

      bool isAvatarSkipped = false;

      for (final field in fields) {
        if (field.name.value == "avatar") {
          expect(isSkipped(field, {"includeAvatar": false}), true);
          isAvatarSkipped = true;
        } else {
          expect(isSkipped(field, {"includeAvatar": false}), false);
        }
      }
      expect(isAvatarSkipped, true);
    });
  });

  group("skipped fragments", () {
    test("fragments with skip directive with true literal are skipped", () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ...AvatarNameFragment @skip(if: true)
        }
        fragment AvatarNameFragment on Pokemon {
          name
          avatar
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as FragmentSpreadNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), true);
    });

    test("fragments with skip directive with false literal are not skipped",
        () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ...AvatarNameFragment @skip(if: false)
        }
        fragment AvatarNameFragment on Pokemon {
          name
          avatar
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as FragmentSpreadNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), false);
    });

    test("fragments with include directive with true literal are not skipped",
        () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ...AvatarNameFragment @include(if: true)
        }
        fragment AvatarNameFragment on Pokemon {
          name
          avatar
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as FragmentSpreadNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), false);
    });

    test("fragments with include directive with false literal are skipped", () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ...AvatarNameFragment @include(if: false)
        }
        fragment AvatarNameFragment on Pokemon {
          name
          avatar
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as FragmentSpreadNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), true);
    });

    test(
        "fragments with skip directive with variable is skipped iff true variable is true",
        () {
      final query = parseString('''query AllPokemon(\$skipAvatar: Boolean!) {
        pokemons {
          id
          ...AvatarNameFragment @skip(if: \$skipAvatar)
        }
        fragment AvatarNameFragment on Pokemon {
          name
          avatar
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as FragmentSpreadNode;

      expect(isSkipped(id, {"skipAvatar": false}), false);
      expect(isSkipped(fragment, {"skipAvatar": false}), false);
      expect(isSkipped(id, {"skipAvatar": true}), false);
      expect(isSkipped(fragment, {"skipAvatar": true}), true);
    });

    test(
        "fragments with include directive with variable is skipped iff true variable is false",
        () {
      final query = parseString('''query AllPokemon(\$includeAvatar: Boolean!) {
      pokemons {
        id
        ...AvatarNameFragment @include(if: \$includeAvatar)
      }
      fragment AvatarNameFragment on Pokemon {
        name
        avatar
      }
    }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as FragmentSpreadNode;

      expect(isSkipped(id, {"includeAvatar": true}), false);
      expect(isSkipped(fragment, {"includeAvatar": true}), false);
      expect(isSkipped(id, {"includeAvatar": false}), false);
      expect(isSkipped(fragment, {"includeAvatar": false}), true);
    });
  });

  group("inline fragments", () {
    test("inline fragments with skip directive with true literal are skipped",
        () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ... on Pikachu @skip(if: true) {
            isFavorite
          }
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as InlineFragmentNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), true);
    });

    test(
        "inline fragments with skip directive with false literal are not skipped",
        () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ... on Pikachu @skip(if: false) {
            isFavorite
          }
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as InlineFragmentNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), false);
    });

    test(
        "inline fragments with include directive with true literal are not skipped",
        () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ... on Pikachu @include(if: true) {
            isFavorite
          }
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as InlineFragmentNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), false);
    });

    test(
        "inline fragments with include directive with false literal are skipped",
        () {
      final query = parseString('''query AllPokemon {
        pokemons {
          id
          ... on Pikachu @include(if: false) {
            isFavorite
          }
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as InlineFragmentNode;

      expect(isSkipped(id, const {}), false);
      expect(isSkipped(fragment, const {}), true);
    });

    test(
        "inline fragments with skip directive with variable is skipped iff true variable is true",
        () {
      final query = parseString('''query AllPokemon(\$skipAvatar: Boolean!) {
        pokemons {
          id
          ... on Pikachu @skip(if: \$skipAvatar) {
            isFavorite
          }
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as InlineFragmentNode;

      expect(isSkipped(id, {"skipAvatar": false}), false);
      expect(isSkipped(fragment, {"skipAvatar": false}), false);
      expect(isSkipped(id, {"skipAvatar": true}), false);
      expect(isSkipped(fragment, {"skipAvatar": true}), true);
    });

    test(
        "inline fragments with include directive with variable is skipped iff true variable is false",
        () {
      final query = parseString('''query AllPokemon(\$includeAvatar: Boolean!) {
        pokemons {
          id
          ... on Pikachu @include(if: \$includeAvatar) {
            isFavorite
          }
        }
      }''');

      final selections = (query.definitions[0] as OperationDefinitionNode)
          .selectionSet
          .selections[0] as FieldNode;

      final id = selections.selectionSet!.selections[0] as FieldNode;
      final fragment =
          selections.selectionSet!.selections[1] as InlineFragmentNode;

      expect(isSkipped(id, {"includeAvatar": true}), false);
      expect(isSkipped(fragment, {"includeAvatar": true}), false);
      expect(isSkipped(id, {"includeAvatar": false}), false);
      expect(isSkipped(fragment, {"includeAvatar": false}), true);
    });
  });
}

Iterable<FieldNode> _getFieldsOfSimpleQuery(String queryString) {
  final query = parseString(queryString);

  final selectionSet =
      (query.definitions.first as OperationDefinitionNode).selectionSet;

  final fields = (selectionSet.selections.first as FieldNode)
      .selectionSet!
      .selections
      .whereType<FieldNode>();
  return fields;
}
