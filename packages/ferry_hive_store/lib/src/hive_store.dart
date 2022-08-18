import 'dart:async';

import 'package:collection/collection.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

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
      .startWith(_getSync(dataId))
      .distinct(
        (prev, next) => const DeepCollectionEquality().equals(
          prev,
          next,
        ),
      );
  
  Map<String, dynamic>? _getSync(String dataId) =>
      box.get(dataId) == null ? null : Map.from(box.get(dataId));

  @override
  Future<Map<String, dynamic>?> get(String dataId) async =>
      box.get(dataId) == null ? null : Map.from(box.get(dataId));

  @override
  Future<void> put(String dataId, Map<String, dynamic>? value) =>
      box.put(dataId, value);

  @override
  Future<void> putAll(Map<String, Map<String, dynamic>?> data) => box.putAll(data);

  @override
  Future<void> delete(String dataId) => box.delete(dataId);

  @override
  Future<void> deleteAll(Iterable<String> dataIds) => box.deleteAll(dataIds);

  // NOTE: we can't currently use box.clear since it isn't synchronous
  // https://github.com/hivedb/hive/issues/219
  @override
  Future<void> clear() => box.deleteAll(keys);

  @override
  Future<void> dispose() => box.close();
}
