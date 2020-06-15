import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

/// Adds fragment fields to selections if type of data matches fragment type
List<FieldNode> expandFragments({
  @required Map<String, dynamic> data,
  @required SelectionSetNode selectionSet,
  @required Map<String, FragmentDefinitionNode> fragmentMap,
}) {
  final List<FieldNode> fieldNodes = [];

  for (var selectionNode in selectionSet.selections) {
    if (selectionNode is FieldNode) {
      fieldNodes.add(selectionNode);
    } else if (selectionNode is InlineFragmentNode) {
      // Only include this fragment if the type name matches
      if (selectionNode.typeCondition.on.name.value == data["__typename"]) {
        fieldNodes.addAll(expandFragments(
          data: data,
          selectionSet: selectionNode.selectionSet,
          fragmentMap: fragmentMap,
        ));
      }
    } else if (selectionNode is FragmentSpreadNode) {
      final fragment = fragmentMap[selectionNode.name.value];
      fieldNodes.addAll(expandFragments(
        data: data,
        selectionSet: fragment.selectionSet,
        fragmentMap: fragmentMap,
      ));
    } else {
      throw (FormatException("Unknown selection node type"));
    }
  }
  return fieldNodes;
}
