// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

@pragma('vm:prefer-inline')
bool listEquals<T>(
  List<T>? left,
  List<T>? right,
) {
  if (identical(left, right)) return true;
  if (left == null || right == null) return false;
  final _$length = left.length;
  if (_$length != right.length) return false;
  for (var _$i = 0; _$i < _$length; _$i++) {
    if (left[_$i] != right[_$i]) return false;
  }
  return true;
}

@pragma('vm:prefer-inline')
bool listEqualsDeep<T>(
  List<T>? left,
  List<T>? right,
) {
  if (identical(left, right)) return true;
  if (left == null || right == null) return false;
  final _$length = left.length;
  if (_$length != right.length) return false;
  for (var _$i = 0; _$i < _$length; _$i++) {
    if (!deepEquals(left[_$i], right[_$i])) return false;
  }
  return true;
}

@pragma('vm:prefer-inline')
int listHash<T>(List<T>? values) {
  if (values == null) return 0;
  return Object.hashAll(values);
}

@pragma('vm:prefer-inline')
int listHashDeep<T>(List<T>? values) {
  if (values == null) return 0;
  var _$hash = 0;
  for (final _$value in values) {
    _$hash = Object.hash(_$hash, deepHash(_$value));
  }
  return _$hash;
}

@pragma('vm:prefer-inline')
bool deepEquals(
  Object? left,
  Object? right,
) {
  if (identical(left, right)) return true;
  if (left == null || right == null) return false;
  if (left is List && right is List) {
    return listEqualsDeep(left, right);
  }
  if (left is Map && right is Map) {
    if (left.length != right.length) return false;
    for (final _$entry in left.entries) {
      if (!right.containsKey(_$entry.key)) return false;
      if (!deepEquals(_$entry.value, right[_$entry.key])) return false;
    }
    return true;
  }
  return left == right;
}

@pragma('vm:prefer-inline')
int deepHash(Object? value) {
  if (value == null) return 0;
  if (value is List) {
    return listHashDeep(value);
  }
  if (value is Map) {
    return Object.hashAllUnordered(
      value.entries.map(
        (_$entry) => Object.hash(
          deepHash(_$entry.key),
          deepHash(_$entry.value),
        ),
      ),
    );
  }
  return value.hashCode;
}
