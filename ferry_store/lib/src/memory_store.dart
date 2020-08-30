import 'dart:async';
import 'package:rxdart/rxdart.dart';

import './store.dart';

class MemoryStore extends Store {
  final BehaviorSubject<Map<String, Map<String, dynamic>>> _dataController;

  MemoryStore([Map<String, Map<String, dynamic>> initialData])
      : _dataController = BehaviorSubject.seeded(initialData ?? {});

  @override
  Stream<Map<String, Map<String, dynamic>>> watch() {
    return _dataController.stream;
  }

  @override
  Map<String, dynamic> get(String dataId) {
    return _dataController.value[dataId];
  }

  @override
  void put(String dataId, Map<String, dynamic> value) =>
      _dataController.add(_dataController.value..[dataId] = value);

  @override
  void putAll(Map<String, Map<String, dynamic>> data) =>
      _dataController.add(_dataController.value..addAll(data));

  @override
  void delete(String dataId) =>
      _dataController.add(_dataController.value..remove(dataId));

  @override
  Map<String, Map<String, dynamic>> toMap() => Map.from(_dataController.value);

  Future<void> dispose() => _dataController.close();
}
