/// compare two json-like objects for equality
/// parameters must be either null, num, bool, String or a List or Map of these types
/// this is an alternative too DeepCollectionEquality().equals, which is very slow and has
/// O(n^2) complexity:
bool jsonMapEquals(Object? a, Object? b) {
  if (identical(a, b)) {
    return true;
  }
  if (a == b) {
    return true;
  }
  if (a is Map) {
    if (b is! Map) {
      return false;
    }
    if (a.length != b.length) return false;
    for (var key in a.keys) {
      if (!b.containsKey(key)) return false;
      if (!jsonMapEquals(a[key], b[key])) return false;
    }
    return true;
  }
  if (a is List) {
    if (b is! List) {
      return false;
    }
    final length = a.length;
    if (length != b.length) return false;
    for (var i = 0; i < length; i++) {
      if (!jsonMapEquals(a[i], b[i])) return false;
    }
    return true;
  }
  return false;
}
