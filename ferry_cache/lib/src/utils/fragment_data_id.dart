import 'package:normalize/policies.dart';
import 'package:normalize/utils.dart';
import 'package:normalize/normalize.dart';

import 'package:ferry_exec/ferry_exec.dart';

/// Returns the dataId for the given fragment request
String? fragmentDataId(
  FragmentRequest req,
  Map<String, TypePolicy> typePolicies,
) {
  final fragmentMap = getFragmentMap(req.document);

  final fragmentDefinition = req.fragmentName != null
      ? fragmentMap[req.fragmentName!]!
      : fragmentMap.values.first;

  return resolveDataId(
    data: {
      ...req.idFields,
      '__typename': fragmentDefinition.typeCondition.on.name.value,
    },
    typePolicies: typePolicies,
  );
}
