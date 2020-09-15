import 'package:gql/ast.dart';
import 'package:meta/meta.dart';
import 'package:normalize/normalize.dart';

import 'package:normalize/src/config/normalization_config.dart';
import 'package:normalize/src/policies/type_policy.dart';
import 'package:normalize/src/utils/get_fragment_map.dart';
import 'package:normalize/src/utils/resolve_data_id.dart';
import 'package:normalize/src/utils/add_typename_visitor.dart';
import 'package:normalize/src/utils/exceptions.dart';
import 'package:normalize/src/denormalize_node.dart';

/// Denormalizes data for a given fragment.
///
/// Pass in a [read] function to read the normalized map.
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
  @required DocumentNode document,
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
    document = transform(
      document,
      [AddTypenameVisitor()],
    );
  }

  final fragmentMap = getFragmentMap(document);

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

  final config = NormalizationConfig(
    read: read,
    variables: variables,
    typePolicies: typePolicies,
    referenceKey: referenceKey,
    fragmentMap: fragmentMap,
    dataIdFromObject: dataIdFromObject,
    addTypename: addTypename,
  );

  try {
    return denormalizeNode(
      selectionSet: fragmentDefinition.selectionSet,
      dataForNode: read(dataId),
      config: config,
      returnPartialData: returnPartialData,
    );
  } on PartialDataException {
    return null;
  }
}
