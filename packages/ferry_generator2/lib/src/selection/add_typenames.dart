import "package:gql/ast.dart";

import "../source/source.dart";

DocumentSource addTypenamesToSource(DocumentSource source) => DocumentSource(
      url: source.url,
      document: addTypenames(source.document),
      imports: source.imports.map(addTypenamesToSource).toSet(),
    );

DocumentNode addTypenames(DocumentNode document) => DocumentNode(
      definitions: document.definitions.map(_addTypenameDefinition).toList(),
    );

DefinitionNode _addTypenameDefinition(DefinitionNode definition) {
  if (definition is OperationDefinitionNode) {
    return OperationDefinitionNode(
      type: definition.type,
      name: definition.name,
      variableDefinitions: definition.variableDefinitions,
      directives: definition.directives,
      selectionSet: _addTypenameSelectionSet(definition.selectionSet),
    );
  }

  if (definition is FragmentDefinitionNode) {
    return FragmentDefinitionNode(
      name: definition.name,
      typeCondition: definition.typeCondition,
      directives: definition.directives,
      selectionSet: _addTypenameSelectionSet(definition.selectionSet),
    );
  }

  return definition;
}

SelectionSetNode _addTypenameSelectionSet(SelectionSetNode selectionSet) {
  final selections =
      selectionSet.selections.map(_addTypenameSelection).toList();
  if (!_hasTypename(selections)) {
    selections.add(
      FieldNode(
        name: NameNode(value: "__typename"),
      ),
    );
  }
  return SelectionSetNode(selections: selections);
}

SelectionNode _addTypenameSelection(SelectionNode selection) {
  if (selection is FieldNode) {
    if (selection.selectionSet == null) return selection;
    return FieldNode(
      alias: selection.alias,
      name: selection.name,
      arguments: selection.arguments,
      directives: selection.directives,
      selectionSet: _addTypenameSelectionSet(selection.selectionSet!),
    );
  }

  if (selection is InlineFragmentNode) {
    return InlineFragmentNode(
      typeCondition: selection.typeCondition,
      directives: selection.directives,
      selectionSet: _addTypenameSelectionSet(selection.selectionSet),
    );
  }

  return selection;
}

bool _hasTypename(List<SelectionNode> selections) {
  for (final selection in selections) {
    if (selection is FieldNode &&
        selection.name.value == "__typename" &&
        selection.selectionSet == null) {
      return true;
    }
  }
  return false;
}
