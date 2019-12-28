/// Deeply merges nested properties, returning a new [Map].
///
/// Properties of [other] will overwrite properties of [object].
Map<String, dynamic> deepMerge(
    Map<String, dynamic> object, Map<String, dynamic> other) {
  return {
    ...object,
    for (var entry in other.entries)
      entry.key: object[entry.key] is Map<String, Object> &&
              entry.value is Map<String, Object>
          ? deepMerge(object[entry.key], entry.value)
          : entry.value
  };
}
