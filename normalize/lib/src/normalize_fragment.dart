import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './utils/resolve_data_id.dart';
import './options/type_policy.dart';
import './utils/add_typename_visitor.dart';
import './normalize_node.dart';
import './options/normalize_config.dart';

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
  @required void Function(String dataId, Map<String, dynamic> value) merge,
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

  final config = NormalizeConfig(
    merge: merge,
    variables: variables,
    typePolicies: typePolicies,
    referenceKey: referenceKey,
    fragmentMap: fragmentMap,
    addTypename: addTypename,
    dataIdFromObject: dataIdFromObject,
  );

  final dataId = resolveDataId(
    data: dataForFragment,
    typePolicies: typePolicies,
    dataIdFromObject: dataIdFromObject,
  );

  merge(
    dataId,
    normalizeNode(
      selectionSet: fragmentDefinition.selectionSet,
      dataForNode: dataForFragment,
      config: config,
      root: true,
    ),
  );
}
