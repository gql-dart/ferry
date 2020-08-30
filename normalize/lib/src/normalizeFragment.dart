import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './utils/resolve_data_id.dart';
import './utils/field_name_with_arguments.dart';
import './utils/expand_fragments.dart';
import './options/type_policy.dart';
import './utils/add_typename_visitor.dart';

/// Normalizes data for a given fragment
///
/// Pass in a [writer] function to write the result to the denormalized map.
///
/// An [idFields] Map must be provided that includes all identifying data, per
/// any pertinent [TypePolicy] or [dataIdFromObject] funciton. If entities of
/// this type are simply identified by their [__typename] & [id] fields, you
/// can simply provide a map with just the [id] field (i.e. `{ "id": "1234" }`).
///
/// IDs are generated for each entity based on the following:
/// 1. If no __typename field exists, the entity will not be normalized.
/// 2. If a [TypePolicy] is provided for the given type, it's [TypePolicy.keyFields] are used.
/// 3. If a [dataIdFromObject] funciton is provided, the result is used.
/// 4. The 'id' or '_id' field (respectively) are used.
///
/// The [referenceKey] is used to reference the ID of a normalized object. It
/// should begin with '$' since a graphl response object key cannot begin with
/// that symbol. If none is provided, we will use '$ref' by default.
void normalizeFragment({
  @required void Function(String dataId, Map<String, dynamic> value) writer,
  @required DocumentNode fragment,
  @required Map<String, dynamic> idFields,
  @required Map<String, dynamic> data,
  String fragmentName,
  Map<String, dynamic> variables,
  Map<String, TypePolicy> typePolicies,
  DataIdResolver dataIdFromObject,
  bool addTypename = false,
  String referenceKey = '\$ref',
}) {
  // Always add typenames to ensure data is stored with typename
  fragment = transform(
    fragment,
    [AddTypenameVisitor()],
  );

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
    throw Exception('Multiple fragments defined, but no fragmentName provided');
  }

  if (fragmentName != null && fragmentMap[fragmentName] == null) {
    throw Exception('Fragment "$fragmentName" not found');
  }

  final fragmentDefinition = fragmentName != null
      ? fragmentMap[fragmentName]
      : fragmentMap.values.first;

  final dataForFragment = {
    ...data,
    '__typename': fragmentDefinition.typeCondition.on.name.value,
    ...idFields,
  };

  /// Returns a normalized object for a given node.
  ///
  /// This is called recursively as the AST is traversed. Accepts either the
  /// root [FragmentDefinitionNode] or a [FieldNode].
  Object normalizeNode({
    @required Node node,
    @required Object dataForNode,
    @required Map<String, Map<String, dynamic>> normalizedMap,
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
          .map((data) => normalizeNode(
                node: node,
                dataForNode: data,
                normalizedMap: normalizedMap,
              ))
          .toList();
    }

    // If this is a leaf node, return the data
    if (selectionSet == null) return dataForNode;

    if (dataForNode is Map) {
      final typename = dataForNode['__typename'];
      final typePolicy = (typePolicies ?? const {})[typename];

      final subNodes = expandFragments(
        data: dataForNode,
        selectionSet: selectionSet,
        fragmentMap: fragmentMap,
      );

      final dataToMerge = {
        if (addTypename && typename != null) '__typename': typename,
        for (var selection in subNodes)
          fieldNameWithArguments(
            selection,
            variables,
            typePolicy,
          ): normalizeNode(
            node: selection,
            dataForNode:
                dataForNode[selection.alias?.value ?? selection.name.value],
            normalizedMap: normalizedMap,
          )
      };

      final dataId = resolveDataId(
        data: dataForNode,
        typePolicies: typePolicies,
        dataIdFromObject: dataIdFromObject,
      );

      if (node is FragmentDefinitionNode) {
        (normalizedMap[dataId] ??= {}).addAll(dataToMerge);
        return normalizedMap;
      } else if (dataId != null) {
        (normalizedMap[dataId] ??= {}).addAll(dataToMerge);
        return {referenceKey: dataId};
      } else {
        return dataToMerge;
      }
    }

    throw Exception(
      'There are sub-selections on this node, but the data is not null, an Array, or a Map',
    );
  }

  final Map<String, Map<String, dynamic>> normalized = normalizeNode(
    node: fragmentDefinition,
    dataForNode: dataForFragment,
    normalizedMap: {},
  );

  normalized.entries.forEach((entry) => writer(entry.key, entry.value));
}
