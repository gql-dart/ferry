import 'dart:async';

import 'package:hive/hive.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:rxdart/rxdart.dart';

class HiveStore extends Store {
  final Box<Map<String, dynamic>> box;

  @override
  final BehaviorSubject<Map<String, Map<String, dynamic>>> valueStream;

  StreamSubscription<BoxEvent> _boxStreamSubscription;

  HiveStore(this.box)
      : valueStream = BehaviorSubject.seeded(
            box.toMap().cast<String, Map<String, dynamic>>()) {
    _boxStreamSubscription = box.watch().listen(_onBoxEvent);
  }

  void _onBoxEvent(BoxEvent event) {
    if (valueStream.value[event.key] != event.value) {
      valueStream.add(_boxData);
    }
  }

  Map<String, Map<String, dynamic>> get _boxData =>
      box.toMap().cast<String, Map<String, dynamic>>();

  @override
  Map<String, dynamic> get(String dataId) => box.get(dataId);

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
