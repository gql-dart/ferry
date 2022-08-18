import 'package:gql/ast.dart';
import 'package:normalize/src/config/normalization_config.dart';
import 'package:normalize/src/normalize_node.dart';
import 'package:normalize/src/policies/type_policy.dart';
import 'package:normalize/src/utils/add_typename_visitor.dart';
import 'package:normalize/src/utils/constants.dart';
import 'package:normalize/src/utils/get_fragment_map.dart';
import 'package:normalize/src/utils/get_operation_definition.dart';
import 'package:normalize/src/utils/resolve_data_id.dart';
import 'package:normalize/src/utils/resolve_root_typename.dart';

/// Normalizes data for a given query
///
/// Pass in [read] and [write] functions to read and write the result to the
/// denormalized map.
///
/// IDs are generated for each entity based on the following:
/// 1. If no __typename field exists, the entity will not be normalized.
/// 2. If a [TypePolicy] is provided for the given type, it's [TypePolicy.keyFields] are used.
/// 3. If a [dataIdFromObject] function is provided, the result is used.
/// 4. The 'id' or '_id' field (respectively) are used.
///
/// The [referenceKey] is used to reference the ID of a normalized object. It
/// should begin with '$' since a graphql response object key cannot begin with
/// that symbol. If none is provided, we will use '$ref' by default.
Future<void> normalizeOperation({
  required Future<void> Function(String dataId, Map<String, dynamic>? value) write,
  required Future<Map<String, dynamic>?> Function(String dataId) read,
  required DocumentNode document,
  required Map<String, dynamic> data,
  String? operationName,
  Map<String, dynamic> variables = const {},
  Map<String, TypePolicy> typePolicies = const {},
  DataIdResolver? dataIdFromObject,
  bool addTypename = false,
  bool acceptPartialData = true,
  String referenceKey = kDefaultReferenceKey,
  Map<String, Set<String>> possibleTypes = const {},
}) async {
  if (addTypename) {
    document = transform(
      document,
      [AddTypenameVisitor()],
    );
  }

  final operationDefinition = getOperationDefinition(document, operationName);
  final rootTypeName = resolveRootTypename(operationDefinition, typePolicies);

  final dataId = resolveDataId(
        data: {
          '__typename': rootTypeName,
          ...data,
        },
        typePolicies: typePolicies,
        dataIdFromObject: dataIdFromObject,
      ) ??
      rootTypeName;

  final config = NormalizationConfig(
    read: read,
    variables: variables,
    typePolicies: typePolicies,
    referenceKey: referenceKey,
    fragmentMap: getFragmentMap(document),
    addTypename: addTypename,
    dataIdFromObject: dataIdFromObject,
    allowPartialData: acceptPartialData,
    possibleTypes: possibleTypes,
  );

  await write(
    dataId,
    (await normalizeNode(
      selectionSet: operationDefinition.selectionSet,
      dataForNode: data,
      existingNormalizedData: await config.read(dataId),
      config: config,
      write: write,
      root: true,
    )) as Map<String, dynamic>?,
  );
}
