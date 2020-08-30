import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './utils/field_name_with_arguments.dart';
import './utils/expand_fragments.dart';
import './options/type_policy.dart';
import './utils/resolve_data_id.dart';
import './utils/add_typename_visitor.dart';
import './utils/exceptions.dart';

/// Denormalizes data for a given fragment.
///
/// Pass in a [reader] function to read the normalized map.
///
/// An [idFields] Map must be provided that includes all identifying data, per
/// any pertinent [TypePolicy] or [dataIdFromObject] funciton. If entities of
/// this type are simply identified by their [__typename] & [id] fields, you
/// can simply provide a map with just the [id] field (i.e. `{ "id": "1234" }`).
///
/// If any [TypePolicy]s or a [dataIdFromObject] function were used to
/// normalize the data, they must be provided to ensure that the appropriate
/// normalized entity can be found.
///
/// Likewise, if a custom [referenceKey] was used to normalize the data, it
/// must be provided. Otherwise, the default '$ref' key will be used.
Map<String, dynamic> denormalizeFragment({
  @required Map<String, dynamic> Function(String dataId) reader,
  @required DocumentNode fragment,
  @required Map<String, dynamic> idFields,
  String fragmentName,
  Map<String, dynamic> variables,
  Map<String, TypePolicy> typePolicies,
  DataIdResolver dataIdFromObject,
  bool addTypename = false,
  bool returnPartialData = false,
  String referenceKey = '\$ref',
}) {
  // Add typenames
  if (addTypename) {
    fragment = transform(
      fragment,
      [AddTypenameVisitor()],
    );
  }

  final hasOperationDefinition = fragment.definitions
      .any((definition) => definition is OperationDefinitionNode);
  if (hasOperationDefinition) {
    throw Exception(
      'Operation definition found, but expected a fragment definition',
    );
  }

  final fragmentMap = {
    for (var fragmentDefinition
        in fragment.definitions.whereType<FragmentDefinitionNode>())
      fragmentDefinition.name.value: fragmentDefinition
  };

  if (fragmentMap.length > 1 && fragmentName == null) {
    throw Exception(
      'Multiple fragments defined, but no fragmentName provided',
    );
  }

  if (fragmentName != null && fragmentMap[fragmentName] == null) {
    throw Exception(
      'Fragment "$fragmentName" not found',
    );
  }

  final fragmentDefinition = fragmentName != null
      ? fragmentMap[fragmentName]
      : fragmentMap.values.first;

  final dataId = resolveDataId(
    data: {
      ...idFields,
      '__typename': fragmentDefinition.typeCondition.on.name.value,
    },
    typePolicies: typePolicies,
    dataIdFromObject: dataIdFromObject,
  );

  /// Returns a denormalized object for a given node.
  ///
  /// This is called recursively as the AST is traversed. Accepts either the
  /// root [FragmentDefinitionNode] or a [FieldNode].
  Object denormalizeNode({
    @required Node node,
    @required Object dataForNode,
  }) {
    SelectionSetNode selectionSet;
    if (node is FragmentDefinitionNode) {
      selectionSet = node.selectionSet;
    } else if (node is FieldNode) {
      selectionSet = node.selectionSet;
    } else {
      throw Exception('Unexpected node type');
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
        data: denormalizedData,
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
      node: fragmentDefinition,
      dataForNode: reader(dataId),
    );
  } on PartialDataException {
    return null;
  }
}
