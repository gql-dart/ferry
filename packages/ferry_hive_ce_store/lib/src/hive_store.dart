import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:hive_ce/hive.dart';
import 'package:ferry_store/ferry_store.dart';

class HiveStore extends Store {
  final Box<dynamic> box;
  final JsonEquals _jsonEquals;

  HiveStore(this.box, [JsonEquals? jsonEquals])
      : _jsonEquals = jsonEquals ?? jsonMapEquals;

  @override
  Iterable<String> get keys => List.from(box.keys);

  @override
  Stream<Map<String, dynamic>?> watch(String dataId, {bool distinct = true}) {
    final stream = box
        .watch(key: dataId)
        .map<Map<String, dynamic>?>((event) =>
            event.value == null ? null : Map.from(event.value as Map))
        .startWith(get(dataId));

    if (distinct) {
      return stream.distinct(_jsonEquals);
    }
    return stream;
  }

  @override
  Map<String, dynamic>? get(String dataId) {
    final value = box.get(dataId);
    return value == null ? null : Map.from(value as Map);
  }

  @override
  void put(String dataId, Map<String, dynamic>? value) =>
      box.put(dataId, value);

  @override
  void putAll(Map<String, Map<String, dynamic>?> data) => box.putAll(data);

  @override
  void delete(String dataId) => box.delete(dataId);

  @override
  void deleteAll(Iterable<String> dataIds) => box.deleteAll(dataIds);

  // NOTE: we can't currently use box.clear since it isn't synchronous
  // https://github.com/hivedb/hive/issues/219
  @override
  void clear() => box.deleteAll(keys);

  @override
  Future<void> dispose() => box.close();
}
