import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './utils/field_name_with_arguments.dart';
import './utils/expand_fragments.dart';
import './options/type_policy.dart';
import './utils/resolve_root_typename.dart';
import './utils/add_typename_visitor.dart';
import './utils/exceptions.dart';
import './utils/get_operation_definition.dart';

/// Denormalizes data for a given query
///
/// Pass in a [reader] function to read the normalized map.
///
/// If any [TypePolicy]s were used to normalize the data, they must be provided
/// to ensure that the appropriate normalized entity can be found.
///
/// Likewise, if a custom [referenceKey] was used to normalize the data, it
/// must be provided. Otherwise, the default '$ref' key will be used.
Map<String, dynamic> denormalize({
  @required Map<String, dynamic> Function(String dataId) reader,
  @required DocumentNode query,
  String operationName,
  Map<String, dynamic> variables,
  Map<String, TypePolicy> typePolicies,
  bool addTypename = false,
  bool returnPartialData = false,
  String referenceKey = '\$ref',
}) {
  // Add typenames
  if (addTypename) {
    query = transform(
      query,
      [AddTypenameVisitor()],
    );
  }

  final operationDefinition = getOperationDefinition(query, operationName);

  final rootTypename = resolveRootTypename(
    operationDefinition,
    typePolicies,
  );

  final fragmentMap = {
    for (var fragmentDefinition
        in query.definitions.whereType<FragmentDefinitionNode>())
      fragmentDefinition.name.value: fragmentDefinition
  };

  /// Returns a denormalized object for a given node.
  ///
  /// This is called recursively as the AST is traversed. Accepts either the
  /// root [OperationDefinitionNode] or a [FieldNode].
  Object denormalizeNode({
    @required Node node,
    @required Object dataForNode,
  }) {
    SelectionSetNode selectionSet;
    if (node is OperationDefinitionNode) {
      selectionSet = node.selectionSet;
    } else if (node is FieldNode) {
      selectionSet = node.selectionSet;
    } else {
      throw Exception(
        "Unexpected node type. Expected 'OperationDefinitionNode' or 'FieldNode'",
      );
    }

    if (dataForNode == null) return null;

    if (dataForNode is List) {
      return dataForNode
          .map((data) => denormalizeNode(
                node: node,
                dataForNode: data,
              ))
          .toList();
    }

    // If this is a leaf node, return the data
    if (selectionSet == null) return dataForNode;

    if (dataForNode is Map) {
      final denormalizedData = dataForNode.containsKey(referenceKey)
          ? reader(dataForNode[referenceKey])
          : dataForNode;
      final typename = denormalizedData['__typename'];
      final typePolicy = (typePolicies ?? const {})[typename];

      final subNodes = expandFragments(
        data: Map.from(denormalizedData),
        selectionSet: selectionSet,
        fragmentMap: fragmentMap,
      );

      final result = subNodes.fold<Map<String, dynamic>>(
        {},
        (result, selection) {
          final fieldName = fieldNameWithArguments(
            selection,
            variables,
            typePolicy,
          );
          if (!denormalizedData.containsKey(fieldName)) {
            if (!returnPartialData) throw PartialDataException();
          } else {
            result[selection.alias?.value ?? selection.name.value] =
                denormalizeNode(
              node: selection,
              dataForNode: denormalizedData[fieldName],
            );
          }
          return result;
        },
      );

      return result.isEmpty ? null : result;
    }

    throw Exception(
      'There are sub-selections on this node, but the data is not null, an Array, or a Map',
    );
  }

  try {
    return denormalizeNode(
      node: operationDefinition,
      dataForNode: reader(rootTypename),
    );
  } on PartialDataException {
    return null;
  }
}
