import "package:ferry_generator2/src/selection/add_typenames.dart";
import "package:gql/ast.dart";
import "package:gql/language.dart";
import "package:test/test.dart";

void main() {
  test("query roots still get __typename", () {
    final document = parseString("""
      query Hero {
        hero {
          id
        }
      }
    """);

    final transformed = addTypenames(document);
    final operation = transformed.definitions.single as OperationDefinitionNode;

    expect(_fieldNames(operation.selectionSet), contains("__typename"));
    final heroField = operation.selectionSet.selections.singleWhere(
      (selection) => selection is FieldNode && selection.name.value == "hero",
    ) as FieldNode;
    expect(_fieldNames(heroField.selectionSet!), contains("__typename"));
  });

  test("subscription roots skip __typename but nested payloads still get it",
      () {
    final document = parseString("""
      subscription ReviewAdded {
        reviewAdded {
          stars
        }
      }
    """);

    final transformed = addTypenames(document);
    final operation = transformed.definitions.single as OperationDefinitionNode;

    expect(_fieldNames(operation.selectionSet), isNot(contains("__typename")));
    final reviewAddedField =
        operation.selectionSet.selections.single as FieldNode;
    expect(_fieldNames(reviewAddedField.selectionSet!), contains("__typename"));
  });
}

Iterable<String> _fieldNames(SelectionSetNode selectionSet) sync* {
  for (final selection in selectionSet.selections) {
    if (selection is FieldNode) {
      yield selection.name.value;
    }
  }
}
