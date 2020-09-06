import 'package:gql/ast.dart';
import 'package:meta/meta.dart';
import 'package:normalize/normalize.dart';

import './utils/field_name_with_arguments.dart';
import './utils/expand_fragments.dart';
import './utils/exceptions.dart';
import './options/denormalize_config.dart';
import './utils/is_dangling_reference.dart';

/// Returns a denormalized object for a given [SelectionSetNode].
///
/// This is called recursively as the AST is traversed. Accepts either the
/// root [OperationDefinitionNode] or a [FieldNode].
Object denormalizeNode({
  @required SelectionSetNode selectionSet,
  @required Object dataForNode,
  @required DenormalizeConfig config,
}) {
  if (dataForNode == null) return null;

  if (dataForNode is List) {
    return dataForNode
        .where((data) => !isDanglingReference(data, config))
        .map(
          (data) => denormalizeNode(
            selectionSet: selectionSet,
            dataForNode: data,
            config: config,
          ),
        )
        .toList();
  }

  // If this is a leaf node, return the data
  if (selectionSet == null) return dataForNode;

  if (dataForNode is Map) {
    final denormalizedData = dataForNode.containsKey(config.referenceKey)
        ? config.read(dataForNode[config.referenceKey])
        : Map<String, dynamic>.from(dataForNode);
    final typename = denormalizedData['__typename'];
    final typePolicy = config.typePolicies[typename];

    final subNodes = expandFragments(
      data: denormalizedData,
      selectionSet: selectionSet,
      fragmentMap: config.fragmentMap,
    );

    final result = subNodes.fold<Map<String, dynamic>>(
      {},
      (result, fieldNode) {
        final fieldPolicy =
            (typePolicy?.fields ?? const {})[fieldNode.name.value];

        final fieldName = fieldNameWithArguments(
          fieldNode,
          config.variables,
          fieldPolicy,
        );

        final resultKey = fieldNode.alias?.value ?? fieldNode.name.value;

        if (fieldPolicy?.read != null) {
          return result
            ..[resultKey] = fieldPolicy.read(
              denormalizeNode(
                selectionSet: fieldNode.selectionSet,
                dataForNode: denormalizedData[fieldName],
                config: config..returnPartialData = true,
              ),
              FieldFunctionOptions(
                parentObject: denormalizedData,
                field: fieldNode,
                variables: config.variables,
                isReference: (object) =>
                    object.containsKey(config.referenceKey),
                resolveReference: (reference) =>
                    config.read(reference[config.referenceKey]),
              ),
            );
        } else if (!denormalizedData.containsKey(fieldName)) {
          if (!config.returnPartialData) throw PartialDataException();
          return result;
        } else {
          return result
            ..[resultKey] = denormalizeNode(
              selectionSet: fieldNode.selectionSet,
              dataForNode: denormalizedData[fieldName],
              config: config,
            );
        }
      },
    );

    return result.isEmpty ? null : result;
  }

  throw Exception(
    'There are sub-selections on this node, but the data is not null, an Array, or a Map',
  );
}
