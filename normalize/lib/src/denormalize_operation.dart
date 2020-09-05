import 'package:gql/ast.dart';
import 'package:meta/meta.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/src/options/denormalize_config.dart';

import 'options/type_policy.dart';
import 'utils/resolve_root_typename.dart';
import 'utils/add_typename_visitor.dart';
import 'utils/exceptions.dart';
import 'utils/get_operation_definition.dart';
import 'denormalize_node.dart';

/// Denormalizes data for a given query
///
/// Pass in a [read] function to read the normalized map.
///
/// If any [TypePolicy]s were used to normalize the data, they must be provided
/// to ensure that the appropriate normalized entity can be found.
///
/// Likewise, if a custom [referenceKey] was used to normalize the data, it
/// must be provided. Otherwise, the default '$ref' key will be used.
Map<String, dynamic> denormalizeOperation({
  @required Map<String, dynamic> Function(String dataId) read,
  @required DocumentNode document,
  String operationName,
  Map<String, dynamic> variables = const {},
  Map<String, TypePolicy> typePolicies = const {},
  bool addTypename = false,
  bool returnPartialData = false,
  String referenceKey = '\$ref',
}) {
  // Add typenames
  if (addTypename) {
    document = transform(
      document,
      [AddTypenameVisitor()],
    );
  }

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

  final config = DenormalizeConfig(
    read: read,
    variables: variables,
    typePolicies: typePolicies,
    returnPartialData: returnPartialData,
    referenceKey: referenceKey,
    fragmentMap: fragmentMap,
  );

  /// TODO: make fieldPolicy read work with root operation
  final fieldPolicy = (typePolicies[rootTypename]?.fields ??
      const {})[operationDefinition.name.value];

  try {
    return denormalizeNode(
      selectionSet: operationDefinition.selectionSet,
      dataForNode: read(rootTypename) ?? const {},
      config: config,
    );
  } on PartialDataException {
    return null;
  }
}
