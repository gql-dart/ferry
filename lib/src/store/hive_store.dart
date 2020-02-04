import 'dart:async';
import 'package:hive/hive.dart';

import './store.dart';

class HiveStore extends Store {
  final _controller = StreamController<Map<String, Map<String, dynamic>>>();

  final Box box;

  HiveStore(this.box) {
    _controller.add(Map.from(box.toMap()));
  }

  @override
  Stream<Map<String, Map<String, dynamic>>> watch() {
    return _controller.stream;
  }

  @override
  Map<String, dynamic> get(String dataId) {
    return Map.from(box.get(dataId));
  }

  @override
  void put(String dataId, Map<String, dynamic> value) {
    box.put(dataId, value);
    _controller.add(Map.from(box.toMap()));
  }

  @override
  void putAll(Map<String, Map<String, dynamic>> data) {
    box.putAll(data);
    _controller.add(Map.from(box.toMap()));
  }

  @override
  void delete(String dataId) {
    box.delete(dataId);
    _controller.add(Map.from(box.toMap()));
  }

  @override
  Map<String, Map<String, dynamic>> toMap() {
    return Map.from(box.toMap());
  }
}
