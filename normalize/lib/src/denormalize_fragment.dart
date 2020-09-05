import 'package:gql/ast.dart';
import 'package:meta/meta.dart';
import 'package:normalize/normalize.dart';

import './options/denormalize_config.dart';
import './options/type_policy.dart';
import './utils/resolve_data_id.dart';
import './utils/add_typename_visitor.dart';
import './utils/exceptions.dart';
import './denormalize_node.dart';

/// Denormalizes data for a given fragment.
///
/// Pass in a [reader] function to read the normalized map.
///
/// An [idFields] Map must be provided that includes all identifying data, per
/// any pertinent [TypePolicy] or [dataIdFromObject] funciton. If entities of
/// this type are simply identified by their [__typename] & [id] fields, you
/// can simply provide a map with just the [id] field (i.e. `{ "id": "1234" }`).
///
/// If any [TypePolicy]s or a [dataIdFromObject] function were used to
/// normalize the data, they must be provided to ensure that the appropriate
/// normalized entity can be found.
///
/// Likewise, if a custom [referenceKey] was used to normalize the data, it
/// must be provided. Otherwise, the default '$ref' key will be used.
Map<String, dynamic> denormalizeFragment({
  @required Map<String, dynamic> Function(String dataId) read,
  @required DocumentNode fragment,
  @required Map<String, dynamic> idFields,
  String fragmentName,
  Map<String, dynamic> variables = const {},
  Map<String, TypePolicy> typePolicies = const {},
  DataIdResolver dataIdFromObject,
  bool addTypename = false,
  bool returnPartialData = false,
  String referenceKey = '\$ref',
}) {
  if (addTypename) {
    fragment = transform(
      fragment,
      [AddTypenameVisitor()],
    );
  }

  final fragmentMap = {
    for (var fragmentDefinition
        in fragment.definitions.whereType<FragmentDefinitionNode>())
      fragmentDefinition.name.value: fragmentDefinition
  };

  if (fragmentMap.length > 1 && fragmentName == null) {
    throw Exception(
      'Multiple fragments defined, but no fragmentName provided',
    );
  }

  if (fragmentName != null && fragmentMap[fragmentName] == null) {
    throw Exception(
      'Fragment "$fragmentName" not found',
    );
  }

  final fragmentDefinition = fragmentName != null
      ? fragmentMap[fragmentName]
      : fragmentMap.values.first;

  final dataId = resolveDataId(
    data: {
      ...idFields,
      '__typename': fragmentDefinition.typeCondition.on.name.value,
    },
    typePolicies: typePolicies,
    dataIdFromObject: dataIdFromObject,
  );

  final config = DenormalizeConfig(
    read: read,
    variables: variables,
    typePolicies: typePolicies,
    returnPartialData: returnPartialData,
    referenceKey: referenceKey,
    fragmentMap: fragmentMap,
  );

  try {
    return denormalizeNode(
      selectionSet: fragmentDefinition.selectionSet,
      dataForNode: read(dataId),
      config: config,
    );
  } on PartialDataException {
    return null;
  }
}
