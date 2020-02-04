import 'dart:async';
import 'package:hive/hive.dart';

import './store.dart';

class HiveStore extends Store {
  final _controller = StreamController<Map<String, Map<String, dynamic>>>();

  final Box box;

  HiveStore(this.box) {
    _controller.add(_recast(box.toMap()));
  }

  // Workaround for correct typecasting
  Map<String, Map<String, dynamic>> _recast(Map<dynamic, dynamic> data) =>
      data.map<String, Map<String, dynamic>>(
        (key, value) => MapEntry(
          key,
          Map.from(value),
        ),
      );

  @override
  Stream<Map<String, Map<String, dynamic>>> watch() {
    return _controller.stream;
  }

  @override
  Map<String, dynamic> get(String dataId) {
    final result = box.get(dataId);
    if (result == null) return null;
    return Map.from(result);
  }

  @override
  void put(String dataId, Map<String, dynamic> value) {
    box.put(dataId, value);
    _controller.add(_recast(box.toMap()));
  }

  @override
  void putAll(Map<String, Map<String, dynamic>> data) {
    box.putAll(data);
    _controller.add(_recast(box.toMap()));
  }

  @override
  void delete(String dataId) {
    box.delete(dataId);
    _controller.add(_recast(box.toMap()));
  }

  @override
  Map<String, Map<String, dynamic>> toMap() {
    return _recast(box.toMap());
  }
}
