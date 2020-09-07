import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src/utils/resolve_data_id.dart';
import 'package:normalize/src/utils/field_name_with_arguments.dart';
import 'package:normalize/src/utils/expand_fragments.dart';
import 'package:normalize/src/config/normalize_config.dart';
import 'package:normalize/src/policies/field_policy.dart';

/// Returns a normalized object for a given [SelectionSetNode].
///
/// This is called recursively as the AST is traversed.
Object normalizeNode({
  @required SelectionSetNode selectionSet,
  @required Object dataForNode,
  @required NormalizeConfig config,
  @required Object existingNormalizedData,
  bool root = false,
}) {
  if (dataForNode == null) return null;

  if (dataForNode is List) {
    return dataForNode
        .map((data) => normalizeNode(
              selectionSet: selectionSet,
              dataForNode: data,
              config: config,
              existingNormalizedData: null,
            ))
        .toList();
  }

  // If this is a leaf node, return the data
  if (selectionSet == null) return dataForNode;

  if (dataForNode is Map) {
    final dataId = resolveDataId(
      data: dataForNode,
      typePolicies: config.typePolicies,
      dataIdFromObject: config.dataIdFromObject,
    );

    if (dataId != null) existingNormalizedData = config.read(dataId);

    final typename = dataForNode['__typename'];
    final typePolicy = (config.typePolicies ?? const {})[typename];

    final subNodes = expandFragments(
      data: dataForNode,
      selectionSet: selectionSet,
      fragmentMap: config.fragmentMap,
    );

    final dataToMerge = <String, dynamic>{
      if (config.addTypename && typename != null) '__typename': typename,
      ...subNodes.fold({}, (data, field) {
        final fieldPolicy = (typePolicy?.fields ?? const {})[field.name.value];
        final fieldName = fieldNameWithArguments(
          field,
          config.variables,
          fieldPolicy,
        );
        final existingFieldData = existingNormalizedData is Map
            ? existingNormalizedData[fieldName]
            : null;
        final fieldData = normalizeNode(
          selectionSet: field.selectionSet,
          dataForNode: dataForNode[field.alias?.value ?? field.name.value],
          config: config,
          existingNormalizedData: existingFieldData,
        );
        if (fieldPolicy?.merge != null) {
          return data
            ..[fieldName] = fieldPolicy.merge(
              existingFieldData,
              fieldData,
              FieldFunctionOptions(
                field: field,
                config: config,
              ),
            );
        }
        return data..[fieldName] = fieldData;
      })
    };

    if (!root && dataId != null) {
      config.write(dataId, dataToMerge);
      return {config.referenceKey: dataId};
    } else {
      return dataToMerge;
    }
  }

  throw Exception(
    'There are sub-selections on this node, but the data is not null, an Array, or a Map',
  );
}
