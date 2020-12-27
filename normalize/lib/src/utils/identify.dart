import 'package:normalize/src/policies/type_policy.dart';
import './resolve_data_id.dart';

/// Returns the canonical ID for a given object or reference.
String identify(
  Map data, {
  String referenceKey = '\$ref',
  Map<String, TypePolicy> typePolicies,
  DataIdResolver dataIdFromObject,
}) =>
    data.containsKey(referenceKey)
        ? data[referenceKey]
        : resolveDataId(
            data: Map.from(data),
            typePolicies: typePolicies,
            dataIdFromObject: dataIdFromObject,
          );
