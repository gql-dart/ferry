import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';
import 'package:ferry_store/ferry_store.dart';

class MemoryStore extends Store {
  final BehaviorSubject<Map<String, Map<String, dynamic>>> _valueStream;

  MemoryStore([Map<String, Map<String, dynamic>> initialData])
      : _valueStream = BehaviorSubject.seeded(initialData ?? {});

  @override
  Iterable<String> get keys => _valueStream.value.keys;

  @override
  Stream<Map<String, dynamic>> watch(String dataId) =>
      _valueStream.map((data) => data[dataId]).distinct(
            (prev, next) => const DeepCollectionEquality().equals(
              prev,
              next,
            ),
          );

  @override
  Map<String, dynamic> get(String dataId) => _valueStream.value[dataId];

  @override
  void put(String dataId, Map<String, dynamic> value) =>
      _valueStream.add(_valueStream.value..[dataId] = value);

  @override
  void putAll(Map<String, Map<String, dynamic>> data) =>
      _valueStream.add(_valueStream.value..addAll(data));

  @override
  void delete(String dataId) =>
      _valueStream.add(_valueStream.value..remove(dataId));

  @override
  void deleteAll(Iterable<String> dataIds) => _valueStream
      .add(_valueStream.value..removeWhere((key, _) => dataIds.contains(key)));

  @override
  void clear() => _valueStream.add(_valueStream.value..clear());

  @override
  Future<void> dispose() => _valueStream.close();
}
