import 'package:meta/meta.dart';

import '../options/type_policy.dart';

typedef DataIdResolver = String Function(Map<String, dynamic> object);

/// Returns a unique ID to use to reference this normalized object.
///
/// First checks if a [TypePolicy] exists for the given type. Next,
/// calls the [dataIdFromObject] function if one is specified. Finally,
/// falls back to the 'id' or '_id' field, respectively.
///
/// Returns [null] if this type should not be normalized.
String resolveDataId({
  @required Map data,
  Map<String, TypePolicy> typePolicies,
  DataIdResolver dataIdFromObject,
}) {
  final typename = data['__typename'];
  if (typename == null) return null;

  final typePolicy = (typePolicies ?? const {})[typename];
  if (typePolicy?.keyFields != null) {
    if (typePolicy.keyFields.isEmpty) return null;
    return [typename, ...typePolicy.keyFields.map((field) => data[field])]
        .join(':');
  }

  if (dataIdFromObject != null) return dataIdFromObject(data);

  final id = data['id'] ?? data['_id'];
  return id == null ? null : '$typename:$id';
}
