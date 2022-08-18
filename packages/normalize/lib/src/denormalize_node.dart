import 'package:gql/ast.dart';
import 'package:normalize/src/config/normalization_config.dart';
import 'package:normalize/src/policies/field_policy.dart';
import 'package:normalize/src/utils/exceptions.dart';
import 'package:normalize/src/utils/expand_fragments.dart';
import 'package:normalize/src/utils/field_key.dart';
import 'package:normalize/src/utils/is_dangling_reference.dart';

/// Returns a denormalized object for a given [SelectionSetNode].
///
/// This is called recursively as the AST is traversed.
Future<Object?> denormalizeNode({
  required SelectionSetNode? selectionSet,
  required Object? dataForNode,
  required NormalizationConfig config,
}) async {
  if (dataForNode == null) return null;

  if (dataForNode is List) {
    final list = <Object?>[];
    for (final data in dataForNode) {
      if (!await isDanglingReference(data, config)) list.add(data);
    }
    final denormalizedNodes =
        await Future.wait(list.map((data) => denormalizeNode(
              selectionSet: selectionSet,
              dataForNode: data,
              config: config,
            )));
    return denormalizedNodes;
  }

  // If this is a leaf node, return the data
  if (selectionSet == null) return dataForNode;

  if (dataForNode is Map) {
    final denormalizedData = dataForNode.containsKey(config.referenceKey)
        ? await config.read(dataForNode[config.referenceKey]) ?? {}
        : dataForNode;

    final typename = denormalizedData['__typename'];
    final typePolicy = config.typePolicies[typename];

    final subNodes = expandFragments(
      typename: typename,
      selectionSet: selectionSet,
      fragmentMap: config.fragmentMap,
      possibleTypes: config.possibleTypes,
    );

    final result = await subNodes.fold<Future<Map<String, dynamic>>>(
      Future.value({}),
      (futureResult, fieldNode) async {
        final result = await futureResult;
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
        if (!policyCanRead && !denormalizedData.containsKey(fieldName)) {
          if (config.allowPartialData) {
            return result;
          }
          throw PartialDataException(path: [resultKey]);
        }

        try {
          if (policyCanRead) {
            // we can denormalize missing fields with policies
            // because they may be purely virtualized
            return result
              ..[resultKey] = await fieldPolicy!.read!(
                denormalizedData[fieldName],
                FieldFunctionOptions(
                  field: fieldNode,
                  config: config,
                ),
              );
          }

          return result
            ..[resultKey] = await denormalizeNode(
              selectionSet: fieldNode.selectionSet,
              dataForNode: denormalizedData[fieldName],
              config: config,
            );
        } on PartialDataException catch (e) {
          throw PartialDataException(path: [fieldName, ...e.path]);
        }
      },
    );

    return result.isEmpty ? null : result;
  }

  throw Exception(
    'There are sub-selections on this node, but the data is not null, an Array, or a Map',
  );
}
