import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

/// Adds fragment fields to selections if fragment type matches [typename]
/// and deeply merges nested field nodes.
List<FieldNode> expandFragments({
  @required String typename,
  @required SelectionSetNode selectionSet,
  @required Map<String, FragmentDefinitionNode> fragmentMap,
}) {
  final fieldNodes = <FieldNode>[];

  for (var selectionNode in selectionSet.selections) {
    if (selectionNode is FieldNode) {
      fieldNodes.add(selectionNode);
    } else if (selectionNode is InlineFragmentNode) {
      // Only include this fragment if the type name matches
      if (selectionNode.typeCondition.on.name.value == typename) {
        fieldNodes.addAll(expandFragments(
          typename: typename,
          selectionSet: selectionNode.selectionSet,
          fragmentMap: fragmentMap,
        ));
      }
    } else if (selectionNode is FragmentSpreadNode) {
      final fragment = fragmentMap[selectionNode.name.value];
      fieldNodes.addAll(expandFragments(
        typename: typename,
        selectionSet: fragment.selectionSet,
        fragmentMap: fragmentMap,
      ));
    } else {
      throw (FormatException('Unknown selection node type'));
    }
  }
  return List.from(_mergeSelections(fieldNodes));
}

/// Deeply merges field nodes
List<SelectionNode> _mergeSelections(
  List<SelectionNode> selections,
) =>
    selections
        .fold<Map<String, SelectionNode>>(
          {},
          (selectionMap, selection) {
            if (selection is FieldNode) {
              final key = selection.alias?.value ?? selection.name.value;
              if (selection.selectionSet == null) {
                return selectionMap..[key] = selection;
              } else if (!selectionMap.containsKey(key)) {
                return selectionMap..[key] = selection;
              } else {
                final existingNode = selectionMap[key];
                final existingSelections = existingNode is FieldNode &&
                        existingNode.selectionSet != null
                    ? existingNode.selectionSet.selections
                    : <SelectionNode>[];
                final mergedField = FieldNode(
                  name: selection.name,
                  alias: selection.alias,
                  arguments: selection.arguments,
                  selectionSet: SelectionSetNode(
                    selections: _mergeSelections(
                      [
                        ...existingSelections,
                        ...selection.selectionSet.selections
                      ],
                    ),
                  ),
                );
                return selectionMap..[key] = mergedField;
              }
            } else {
              return selectionMap..[selection.hashCode.toString()] = selection;
            }
          },
        )
        .values
        .toList();
