import 'package:normalize/src/policies/type_policy.dart';
import 'package:normalize/src/utils/resolve_root_typename.dart';

/// Returns a set of dataIds that can be reached by any root query.
Set<String> reachableIds(
  Map<String, dynamic> Function(String dataId) read, [
  Map<String, TypePolicy> typePolicies = const {},
  String referenceKey = '\$ref',
]) =>
    defaultRootTypenames.keys
        .map(
      (type) => typenameForOperationType(
        type,
        typePolicies,
      ),
    )
        .fold(
      {},
      (ids, rootTypename) => ids
        ..add(rootTypename)
        ..addAll(
          _idsInObject(
            read(rootTypename),
            read,
            referenceKey,
          ),
        ),
    );

Set<String> _idsInObject(
  Object object,
  Map<String, dynamic> Function(String dataId) read,
  String referenceKey,
) {
  if (object is Map) {
    if (object.containsKey(referenceKey)) {
      return {object[referenceKey]}..addAll(
          _idsInObject(
            read(object[referenceKey]),
            read,
            referenceKey,
          ),
        );
    }
    return object.values.fold(
      {},
      (ids, element) => ids
        ..addAll(
          _idsInObject(
            element,
            read,
            referenceKey,
          ),
        ),
    );
  } else if (object is List) {
    return object.fold(
      {},
      (ids, element) => ids
        ..addAll(
          _idsInObject(
            element,
            read,
            referenceKey,
          ),
        ),
    );
  }
  return {};
}
