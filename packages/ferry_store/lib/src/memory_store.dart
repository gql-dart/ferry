import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';
import 'package:ferry_store/ferry_store.dart';

class MemoryStore extends Store {
  final BehaviorSubject<Map<String, Map<String, dynamic>?>> _valueStream;
  final JsonEquals _jsonEquals;

  MemoryStore(
      [Map<String, Map<String, dynamic>> initialData = const {},
      JsonEquals? jsonEquals])
      : _valueStream = BehaviorSubject.seeded(initialData),
        _jsonEquals = jsonEquals ?? jsonMapEquals;

  @override
  Iterable<String> get keys => _valueStream.value.keys;

  @override
  Stream<Map<String, dynamic>?> watch(String dataId, {bool distinct = true}) {
    final stream = _valueStream.map((data) => data[dataId]);
    if (distinct) {
      return stream.distinct(_jsonEquals);
    }
    return stream;
  }

  @override
  Map<String, dynamic>? get(String dataId) => _valueStream.value[dataId];

  @override
  void put(String dataId, Map<String, dynamic>? value) => _valueStream.add(
        Map.from(_valueStream.value)..addAll({dataId: value}),
      );

  @override
  void putAll(Map<String, Map<String, dynamic>?> data) => _valueStream.add(
        Map.from(_valueStream.value)..addAll(data),
      );

  @override
  void delete(String dataId) => _valueStream.add(
        Map.from(_valueStream.value)..remove(dataId),
      );

  @override
  void deleteAll(Iterable<String> dataIds) => _valueStream.add(
        Map.from(_valueStream.value)
          ..removeWhere((key, _) => dataIds.contains(key)),
      );

  @override
  void clear() => _valueStream.add({});

  @override
  Future<void> dispose() => _valueStream.close();
}
