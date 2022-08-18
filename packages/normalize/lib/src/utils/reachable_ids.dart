import 'package:normalize/src/policies/type_policy.dart';
import 'package:normalize/src/utils/resolve_root_typename.dart';

import 'constants.dart';

/// Returns a set of dataIds that can be reached by any root query.
Future<Set<String>> reachableIds(
  Future<Map<String, dynamic>?> Function(String dataId) read, [
  Map<String, TypePolicy> typePolicies = const {},
  String referenceKey = kDefaultReferenceKey,
]) =>
    defaultRootTypenames.keys
        .map(
          (type) => typenameForOperationType(
            type,
            typePolicies,
          ),
        )
        .fold(
          Future.value({}),
          (ids, rootTypename) async => await ids
            ..add(rootTypename)
            ..addAll(
              await _idsInObject(
                await read(rootTypename),
                read,
                referenceKey,
                {},
              ),
            ),
        );

/// Returns a set of all IDs reachable from the given data ID.
///
/// Includes the given [dataId] itself.
Future<Set<String>> reachableIdsFromDataId(
  String dataId,
  Future<Map<String, dynamic>?> Function(String dataId) read, [
  String referenceKey = kDefaultReferenceKey,
]) async =>
    await _idsInObject(read(dataId), read, referenceKey, {})
      ..add(dataId);

/// Recursively finds reachable IDs in [object]
Future<Set<String>> _idsInObject(
  Object? object,
  Future<Map<String, dynamic>?> Function(String dataId) read,
  String referenceKey,
  Set<String> visited,
) async {
  if (object is Map) {
    if (object.containsKey(referenceKey)) {
      if (visited.contains(object[referenceKey])) return {};
      return {object[referenceKey]}..addAll(
          await _idsInObject(
            await read(object[referenceKey]),
            read,
            referenceKey,
            visited..add(object[referenceKey]),
          ),
        );
    }
    return object.values.fold(
      {},
      (ids, element) async => await ids
        ..addAll(
          await _idsInObject(
            element,
            read,
            referenceKey,
            visited,
          ),
        ),
    );
  } else if (object is List) {
    return object.fold(
      {},
      (ids, element) async => await ids
        ..addAll(
          await _idsInObject(
            element,
            read,
            referenceKey,
            visited,
          ),
        ),
    );
  }
  return {};
}
