import 'dart:async';

import 'package:collection/collection.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:rxdart/rxdart.dart';

class MemoryStore extends Store {
  final BehaviorSubject<Map<String, Map<String, dynamic>?>> _valueStream;

  MemoryStore([Map<String, Map<String, dynamic>> initialData = const {}])
      : _valueStream = BehaviorSubject.seeded(initialData);

  @override
  Iterable<String> get keys => _valueStream.value.keys;

  @override
  Stream<Map<String, dynamic>?> watch(String dataId) =>
      _valueStream.map((data) => data[dataId]).distinct(
            (prev, next) => const DeepCollectionEquality().equals(
              prev,
              next,
            ),
          );

  @override
  Future<Map<String, dynamic>?> get(String dataId) async => _valueStream.value[dataId];

  @override
  Future<void> put(String dataId, Map<String, dynamic>? value) async => _valueStream.add(
        Map.from(_valueStream.value)..addAll({dataId: value}),
      );

  @override
  Future<void> putAll(Map<String, Map<String, dynamic>?> data) async => _valueStream.add(
        Map.from(_valueStream.value)..addAll(data),
      );

  @override
  Future<void> delete(String dataId) async => _valueStream.add(
        Map.from(_valueStream.value)..remove(dataId),
      );

  @override
  Future<void> deleteAll(Iterable<String> dataIds) async => _valueStream.add(
        Map.from(_valueStream.value)
          ..removeWhere((key, _) => dataIds.contains(key)),
      );

  @override
  Future<void> clear() async => _valueStream.add({});

  @override
  Future<void> dispose() => _valueStream.close();
}
