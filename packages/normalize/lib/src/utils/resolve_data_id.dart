import 'dart:collection';
import 'dart:convert';

import '../policies/type_policy.dart';
import './exceptions.dart';

typedef DataIdResolver = String? Function(Map<String, dynamic> object);

/// Returns a unique ID to use to reference this normalized object.
///
/// First checks if a [TypePolicy] exists for the given type. Next,
/// calls the [dataIdFromObject] function if one is specified.
/// If none is provided, falls back to the 'id' or '_id' field, respectively.
///
/// Returns [null] if this type should not be normalized.
String? resolveDataId({
  required Map<String, dynamic> data,
  required Map<String, TypePolicy> typePolicies,
  DataIdResolver? dataIdFromObject,
}) {
  final typename = data['__typename'];
  if (typename == null) return null;

  final typePolicy = typePolicies[typename];

  if (typePolicy?.keyFields != null) {
    if (typePolicy!.keyFields!.isEmpty) return null;

    try {
      final fields = keyFieldsWithArgs(typePolicy.keyFields!, data);
      return '$typename:${json.encode(fields)}';
    } on MissingKeyFieldException {
      return null;
    }
  }

  if (dataIdFromObject != null) return dataIdFromObject(data);

  final id = data['id'] ?? data['_id'];
  return id == null ? null : '$typename:$id';
}

SplayTreeMap<String, dynamic> keyFieldsWithArgs(
  Map<String, dynamic> keyFields,
  Map data,
) =>
    keyFields.entries.fold(
      SplayTreeMap(),
      (fields, entry) {
        if (entry.value is Map) {
          return fields
            ..[entry.key] =
                keyFieldsWithArgs(entry.value, data[entry.key] ?? {});
        } else if (entry.value == true) {
          if (!data.containsKey(entry.key)) throw MissingKeyFieldException();
          return fields..[entry.key] = data[entry.key];
        }
        return fields;
      },
    );
