import 'dart:async';

import './store.dart';

class MemoryStore extends Store {
  final _controller = StreamController<Map<String, Map<String, dynamic>>>();

  final Map<String, Map<String, dynamic>> _data;

  MemoryStore([Map<String, Map<String, dynamic>> data]) : _data = data ?? {} {
    _controller.add(_data);
  }

  @override
  Stream<Map<String, Map<String, dynamic>>> watch() {
    return _controller.stream;
  }

  @override
  Map<String, dynamic> get(String dataId) {
    return _data[dataId];
  }

  @override
  void put(String dataId, Map<String, dynamic> value) {
    _data[dataId] = value;
    _controller.add(_data);
  }

  @override
  void putAll(Map<String, Map<String, dynamic>> data) {
    _data.addAll(data);
    _controller.add(_data);
  }

  @override
  void delete(String dataId) {
    _data.remove(dataId);
    _controller.add(_data);
  }

  @override
  Map<String, Map<String, dynamic>> toMap() {
    return {..._data};
  }
}
