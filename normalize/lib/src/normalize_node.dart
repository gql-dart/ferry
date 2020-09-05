import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './utils/resolve_data_id.dart';
import './utils/field_name_with_arguments.dart';
import './utils/expand_fragments.dart';
import './options/normalize_config.dart';

/// Returns a normalized object for a given [SelectionSetNode].
///
/// This is called recursively as the AST is traversed. Accepts either the
/// root [OperationDefinitionNode] or a [FieldNode].
Object normalizeNode({
  @required SelectionSetNode selectionSet,
  @required Object dataForNode,
  @required NormalizeConfig config,
  bool root = false,
}) {
  if (dataForNode == null) return null;

  if (dataForNode is List) {
    return dataForNode
        .map((data) => normalizeNode(
              selectionSet: selectionSet,
              dataForNode: data,
              config: config,
            ))
        .toList();
  }

  // If this is a leaf node, return the data
  if (selectionSet == null) return dataForNode;

  if (dataForNode is Map) {
    final typename = dataForNode['__typename'];
    final typePolicy = (config.typePolicies ?? const {})[typename];

    final subNodes = expandFragments(
      data: dataForNode,
      selectionSet: selectionSet,
      fragmentMap: config.fragmentMap,
    );

    final dataToMerge = {
      if (config.addTypename && typename != null) '__typename': typename,
      for (var fieldNode in subNodes)
        fieldNameWithArguments(
          fieldNode,
          config.variables,
          (typePolicy?.fields ?? const {})[fieldNode.name.value],
        ): normalizeNode(
          selectionSet: fieldNode.selectionSet,
          dataForNode:
              dataForNode[fieldNode.alias?.value ?? fieldNode.name.value],
          config: config,
        )
    };

    final dataId = resolveDataId(
      data: dataForNode,
      typePolicies: config.typePolicies,
      dataIdFromObject: config.dataIdFromObject,
    );

    if (!root && dataId != null) {
      config.merge(dataId, dataToMerge);
      return {config.referenceKey: dataId};
    } else {
      return dataToMerge;
    }
  }

  throw Exception(
    'There are sub-selections on this node, but the data is not null, an Array, or a Map',
  );
}
