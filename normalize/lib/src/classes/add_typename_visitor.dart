import "package:gql/ast.dart";

class AddTypenameVisitor extends TransformingVisitor {
  @override
  visitFieldNode(FieldNode node) {
    if (node.selectionSet == null) {
      return node;
    }

    final hasTypename = node.selectionSet.selections
        .whereType<FieldNode>()
        .any((node) => node.name.value == '__typename');

    if (hasTypename) return node;

    return FieldNode(
      name: node.name,
      alias: node.alias,
      arguments: node.arguments,
      directives: node.directives,
      selectionSet: SelectionSetNode(
        selections: <SelectionNode>[
          FieldNode(
            name: NameNode(value: "__typename"),
          ),
          ...node.selectionSet.selections,
        ],
      ),
    );
  }

  @override
  visitFragmentDefinitionNode(FragmentDefinitionNode node) {
    if (node.selectionSet == null) {
      return node;
    }

    final hasTypename = node.selectionSet.selections
        .whereType<FieldNode>()
        .any((node) => node.name.value == '__typename');

    if (hasTypename) return node;

    return FragmentDefinitionNode(
      name: node.name,
      typeCondition: node.typeCondition,
      directives: node.directives,
      selectionSet: SelectionSetNode(
        selections: <SelectionNode>[
          FieldNode(
            name: NameNode(value: "__typename"),
          ),
          ...node.selectionSet.selections,
        ],
      ),
    );
  }
}
