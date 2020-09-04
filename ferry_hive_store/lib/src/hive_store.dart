import 'dart:async';
import 'package:collection/collection.dart';

import 'package:hive/hive.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:rxdart/rxdart.dart';

class HiveStore extends Store {
  final Box box;

  @override
  final BehaviorSubject<Map<String, Map<String, dynamic>>> valueStream;

  StreamSubscription<BoxEvent> _boxStreamSubscription;

  HiveStore(this.box) : valueStream = BehaviorSubject.seeded(_toMap(box)) {
    _boxStreamSubscription = box.watch().listen(_onBoxEvent);
  }

  // Workaround for correct typecasting
  static Map<String, Map<String, dynamic>> _toMap(
    Box box,
  ) =>
      box.keys.fold<Map<String, Map<String, dynamic>>>(
          {}, (map, key) => map..[key] = Map.from(box.get(key)));

  void _onBoxEvent(BoxEvent event) {
    final isEqual = const DeepCollectionEquality().equals(
      valueStream.value[event.key],
      event.value,
    );
    if (isEqual == false) {
      valueStream.add(_boxData);
    }
  }

  Map<String, Map<String, dynamic>> get _boxData => _toMap(box);

  @override
  Map<String, dynamic> get(String dataId) => valueStream.value[dataId];

  @override
  void put(String dataId, Map<String, dynamic> value) {
    box.put(dataId, value);
    valueStream.add(_boxData);
  }

  @override
  void putAll(Map<String, Map<String, dynamic>> data) {
    box.putAll(data);
    valueStream.add(_boxData);
  }

  @override
  void delete(String dataId) {
    box.delete(dataId);
    valueStream.add(_boxData);
  }

  @override
  void clear() {
    box.clear();
    valueStream.add({});
  }

  @override
  void dispose() {
    _boxStreamSubscription.cancel();
    valueStream.close();
  }
}
