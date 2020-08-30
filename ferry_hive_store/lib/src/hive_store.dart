import 'dart:async';
import 'package:hive/hive.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:rxdart/rxdart.dart';

class HiveStore extends Store {
  final Box<Map<String, dynamic>> box;

  HiveStore(this.box);

  @override
  Stream<Map<String, Map<String, dynamic>>> watch() => box
      .watch()
      .map((_) => box.toMap().cast<String, Map<String, dynamic>>())
      .shareValueSeeded(box.toMap().cast<String, Map<String, dynamic>>());

  @override
  Map<String, dynamic> get(String dataId) {
    final result = box.get(dataId);
    if (result == null) return null;
    return Map.from(result);
  }

  @override
  void put(String dataId, Map<String, dynamic> value) => box.put(dataId, value);

  @override
  void putAll(Map<String, Map<String, dynamic>> data) => box.putAll(data);

  @override
  void delete(String dataId) => box.delete(dataId);

  @override
  Map<String, Map<String, dynamic>> toMap() =>
      box.toMap().cast<String, Map<String, dynamic>>();
}
