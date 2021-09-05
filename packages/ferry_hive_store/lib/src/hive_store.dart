import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:ferry_store/ferry_store.dart';

class HiveStore extends Store {
  final Box box;

  HiveStore(this.box);

  @override
  Iterable<String> get keys => List.from(box.keys);

  @override
  Stream<Map<String, dynamic>?> watch(String dataId) => box
      .watch(key: dataId)
      .map<Map<String, dynamic>?>(
          (event) => event.value == null ? null : Map.from(event.value))
      .startWith(get(dataId))
      .distinct(
        (prev, next) => const DeepCollectionEquality().equals(
          prev,
          next,
        ),
      );

  @override
  Map<String, dynamic>? get(String dataId) =>
      box.get(dataId) == null ? null : Map.from(box.get(dataId));

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
