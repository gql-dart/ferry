import 'package:gql/ast.dart';
import 'package:normalize/src/config/normalization_config.dart';
import 'package:normalize/src/policies/field_policy.dart';
import 'package:normalize/src/utils/exceptions.dart';
import 'package:normalize/src/utils/expand_fragments.dart';
import 'package:normalize/src/utils/field_key.dart';
import 'package:normalize/src/utils/is_dangling_reference.dart';
import 'package:normalize/src/utils/well_known_directives.dart';

/// Returns a denormalized object for a given [SelectionSetNode].
///
/// This is called recursively as the AST is traversed.
Object? denormalizeNode({
  required SelectionSetNode? selectionSet,
  required Object? dataForNode,
  required NormalizationConfig config,
}) {
  if (dataForNode == null) return null;

  if (dataForNode is List) {
    final reachableData = dataForNode.where(
      (data) => !isDanglingReference(data, config),
    );
    final newList = <Object?>[];
    for (final node in reachableData) {
      try {
        final denormalizedSubNode = denormalizeNode(
          selectionSet: selectionSet,
          dataForNode: node,
          config: config,
        );
        newList.add(denormalizedSubNode);
      } on DanglingReferenceException {
        // Ignore the list items with partial data.
        if (!config.allowDanglingReference) rethrow;
      }
    }
    return newList;
  }

  // If this is a leaf node, return the data
  if (selectionSet == null) return dataForNode;

  if (dataForNode is Map) {
    final isReference = dataForNode.containsKey(config.referenceKey);
    Map<String, dynamic>? referenceData;
    if (isReference) {
      referenceData = config.read(dataForNode[config.referenceKey]);
      if (referenceData == null) {
        throw const DanglingReferenceException(path: []);
      }
    }
    final denormalizedData = isReference
        ? referenceData ?? const {}
        : Map<String, dynamic>.from(dataForNode);

    final typename = denormalizedData['__typename'];
    final typePolicy = config.typePolicies[typename];

    final subNodes = expandFragments(
      typename: typename,
      selectionSet: selectionSet,
      fragmentMap: config.fragmentMap,
      possibleTypes: config.possibleTypes,
      variables: config.variables,
    );

    final result = subNodes.fold<Map<String, dynamic>>(
      {},
      (result, fieldNode) {
        final fieldPolicy =
            (typePolicy?.fields ?? const {})[fieldNode.name.value];
        final policyCanRead = fieldPolicy?.read != null;

        final fieldName = FieldKey(
          fieldNode,
          config.variables,
          fieldPolicy,
        ).toString();

        final resultKey = fieldNode.alias?.value ?? fieldNode.name.value;

        /// If the policy can't read,
        /// and the key is missing from the data,
        /// we have partial data
        bool isSkippedValue = false;
        if (!policyCanRead &&
            !denormalizedData.containsKey(fieldName) &&
            !(isSkippedValue = isSkipped(fieldNode, config.variables))) {
          if (config.allowPartialData) {
            return result;
          }
          throw PartialDataException(path: [resultKey]);
        }
        if (isSkippedValue) {
          return result;
        }

        try {
          if (policyCanRead) {
            // we can denormalize missing fields with policies
            // because they may be purely virtualized
            return result
              ..[resultKey] = fieldPolicy!.read!(
                denormalizedData[fieldName],
                FieldFunctionOptions(
                  field: fieldNode,
                  config: config,
                ),
              );
          }
          return result
            ..[resultKey] = denormalizeNode(
              selectionSet: fieldNode.selectionSet,
              dataForNode: denormalizedData[fieldName],
              config: config,
            );
        } on PartialDataException catch (e) {
          throw e.copyWith(fieldName: fieldName);
        }
      },
    );

    return result.isEmpty ? null : result;
  }

  throw Exception(
    'There are sub-selections on this node, but the data is not null, an Array, or a Map',
  );
}
