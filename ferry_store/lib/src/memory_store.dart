import 'dart:async';
import 'package:rxdart/rxdart.dart';

import './store.dart';

class MemoryStore extends Store {
  @override
  final BehaviorSubject<Map<String, Map<String, dynamic>>> valueStream;

  MemoryStore([Map<String, Map<String, dynamic>> initialData])
      : valueStream = BehaviorSubject.seeded(initialData ?? {});

  @override
  Map<String, dynamic> get(String dataId) => valueStream.value[dataId];

  @override
  void put(String dataId, Map<String, dynamic> value) =>
      valueStream.add(valueStream.value..[dataId] = value);

  @override
  void putAll(Map<String, Map<String, dynamic>> data) =>
      valueStream.add(valueStream.value..addAll(data));

  @override
  void delete(String dataId) =>
      valueStream.add(valueStream.value..remove(dataId));

  @override
  void deleteAll(Iterable<String> dataIds) => valueStream
      .add(valueStream.value..removeWhere((key, _) => dataIds.contains(key)));

  @override
  void clear() => valueStream.add(valueStream.value..clear());

  @override
  Future<void> dispose() => valueStream.close();
}
