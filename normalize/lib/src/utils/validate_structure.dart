import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src/utils/add_typename_visitor.dart';
import 'package:normalize/src/utils/exceptions.dart';
import 'package:normalize/src/utils/get_operation_definition.dart';
import 'package:normalize/src/denormalize_node.dart';
import 'package:normalize/src/config/normalization_config.dart';
import 'package:normalize/src/utils/get_fragment_map.dart';

/// Validates the structure of [data] against the operation [operationName] in [document].
///
/// Throws a [PartialDataException] if the data is invalid,
/// unless [handleException] is specified, in which case it returns `false`
///
/// This is essentially a simplified version of [denormalizeOperation],
/// but without any real denormalization logic
bool validateOperationDataStructure({
  @required DocumentNode document,
  String operationName,
  Map<String, dynamic> variables = const {},
  Map<String, dynamic> data,
  bool addTypename = false,
  bool handleException = false,
}) {
  if (addTypename) {
    document = transform(
      document,
      [AddTypenameVisitor()],
    );
  }

  final operationDefinition = getOperationDefinition(document, operationName);

  final config = NormalizationConfig(
    read: (_) => data,
    variables: variables,
    typePolicies: const {},
    referenceKey: '\$ref',
    fragmentMap: getFragmentMap(document),
    dataIdFromObject: (_) => null,
    addTypename: addTypename,
    allowPartialData: false,
  );
  try {
    denormalizeNode(
      selectionSet: operationDefinition.selectionSet,
      dataForNode: data,
      config: config,
    );
  } on PartialDataException {
    if (handleException) {
      return false;
    }
    rethrow;
  }
  return true;
}
