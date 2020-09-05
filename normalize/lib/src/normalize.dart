import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './utils/resolve_data_id.dart';
import './options/type_policy.dart';
import './utils/resolve_root_typename.dart';
import './utils/get_operation_definition.dart';
import './normalize_node.dart';
import './options/normalize_config.dart';

/// Normalizes data for a given query
///
/// Pass in a [writer] function to write the result to the denormalized map.
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
void normalize({
  @required void Function(String dataId, Map<String, dynamic> value) merge,
  @required DocumentNode query,
  @required Map<String, dynamic> data,
  String operationName,
  Map<String, dynamic> variables = const {},
  Map<String, TypePolicy> typePolicies = const {},
  DataIdResolver dataIdFromObject,
  bool addTypename = false,
  String referenceKey = '\$ref',
}) {
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

  final config = NormalizeConfig(
    merge: merge,
    variables: variables,
    typePolicies: typePolicies,
    referenceKey: referenceKey,
    fragmentMap: fragmentMap,
    addTypename: addTypename,
    dataIdFromObject: dataIdFromObject,
  );

  merge(
    rootTypename,
    normalizeNode(
      selectionSet: operationDefinition.selectionSet,
      dataForNode: data,
      config: config,
      root: true,
    ),
  );
}
