import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src/utils/resolve_data_id.dart';
import 'package:normalize/src/policies/type_policy.dart';
import 'package:normalize/src/utils/resolve_root_typename.dart';
import 'package:normalize/src/utils/get_operation_definition.dart';
import 'package:normalize/src/normalize_node.dart';
import 'package:normalize/src/config/normalize_config.dart';

/// Normalizes data for a given query
///
/// Pass in a [merge] function to merge the result into the denormalized map.
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
void normalizeOperation({
  @required void Function(String dataId, Map<String, dynamic> value) write,
  @required Map<String, dynamic> Function(String dataId) read,
  @required DocumentNode document,
  @required Map<String, dynamic> data,
  String operationName,
  Map<String, dynamic> variables = const {},
  Map<String, TypePolicy> typePolicies = const {},
  DataIdResolver dataIdFromObject,
  bool addTypename = false,
  String referenceKey = '\$ref',
}) {
  final operationDefinition = getOperationDefinition(document, operationName);

  final rootTypename = resolveRootTypename(
    operationDefinition,
    typePolicies,
  );

  final fragmentMap = {
    for (var fragmentDefinition
        in document.definitions.whereType<FragmentDefinitionNode>())
      fragmentDefinition.name.value: fragmentDefinition
  };

  final config = NormalizeConfig(
    write: write,
    read: read,
    variables: variables,
    typePolicies: typePolicies,
    referenceKey: referenceKey,
    fragmentMap: fragmentMap,
    addTypename: addTypename,
    dataIdFromObject: dataIdFromObject,
  );

  config.write(
    rootTypename,
    normalizeNode(
      selectionSet: operationDefinition.selectionSet,
      dataForNode: data,
      config: config,
      existingNormalizedData: config.read(rootTypename),
      root: true,
    ),
  );
}
