import 'package:gql/ast.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/src/config/normalization_config.dart';
import 'package:normalize/src/denormalize_node.dart';
import 'package:normalize/src/utils/add_typename_visitor.dart';
import 'package:normalize/src/utils/constants.dart';
import 'package:normalize/src/utils/get_fragment_map.dart';
import 'package:normalize/src/utils/get_operation_definition.dart';
import 'package:normalize/src/utils/resolve_data_id.dart';
import 'package:normalize/src/utils/resolve_root_typename.dart';

/// Denormalizes data for a given query
///
/// Pass in a [read] function to read the normalized map.
///
/// If any [TypePolicy]s were used to normalize the data, they must be provided
/// to ensure that the appropriate normalized entity can be found.
///
/// Likewise, if a custom [referenceKey] was used to normalize the data, it
/// must be provided. Otherwise, the default '$ref' key will be used.
Future<Map<String, dynamic>?> denormalizeOperation({
  required Future<Map<String, dynamic>?> Function(String dataId) read,
  required DocumentNode document,
  String? operationName,
  Map<String, dynamic> variables = const {},
  Map<String, TypePolicy> typePolicies = const {},
  DataIdResolver? dataIdFromObject,
  bool addTypename = false,
  bool returnPartialData = false,
  bool handleException = true,
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
        data: {'__typename': rootTypeName},
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
    dataIdFromObject: dataIdFromObject,
    addTypename: addTypename,
    allowPartialData: returnPartialData,
    possibleTypes: possibleTypes,
  );

  try {
    final object = await denormalizeNode(
      selectionSet: operationDefinition.selectionSet,
      dataForNode: await read(dataId),
      config: config,
    );
    return object as Map<String, dynamic>?;
  } on PartialDataException {
    if (handleException) {
      return null;
    }
    rethrow;
  }
}
