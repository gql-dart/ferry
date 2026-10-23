import 'dart:async';
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'package:hive_ce/hive.dart';
import 'package:ferry_store/ferry_store.dart';

class HiveStore extends Store {
  final Box<dynamic> box;
  final JsonEquals _jsonEquals;

  /// Listeners of [watch], by key.
  ///
  /// `box.watch(key: key)` filters every box event in every subscription, so
  /// writing n keys while m keys are watched delivers n * m events. One box
  /// subscription that hands each event to the listeners of its key costs n
  /// map lookups instead.
  final _listeners = <Object?, Set<_KeyListener>>{};

  /// Writes made through this store whose box events haven't arrived yet, by
  /// key and in write order.
  final _pendingWrites = <Object?, Queue<_Write>>{};

  /// Number of writes made through this store while it watched the box.
  int _writeCount = 0;

  StreamSubscription<BoxEvent>? _boxSubscription;

  HiveStore(this.box, [JsonEquals? jsonEquals])
      : _jsonEquals = jsonEquals ?? jsonMapEquals;

  @override
  Iterable<String> get keys => List.from(box.keys);

  @override
  Stream<Map<String, dynamic>?> watch(String dataId, {bool distinct = true}) {
    // hive_ce puts the deleted value into the event of a delete.
    final stream = _events(dataId)
        .map<Map<String, dynamic>?>((event) =>
            event.deleted || event.value == null
                ? null
                : Map.from(event.value as Map))
        .startWith(get(dataId));

    if (distinct) {
      return stream.distinct(_jsonEquals);
    }
    return stream;
  }

  Stream<BoxEvent> _events(String dataId) => Stream.multi((controller) {
        _boxSubscription ??= box.watch().listen(
          _dispatch,
          onError: (Object error, StackTrace stackTrace) {
            for (final listener in _allListeners()) {
              listener.controller.addErrorSync(error, stackTrace);
            }
          },
          onDone: () {
            for (final listener in _allListeners()) {
              listener.controller.closeSync();
            }
            _listeners.clear();
            _pendingWrites.clear();
          },
        );

        final listener = _KeyListener(controller, _writeCount);
        final listeners = _listeners.putIfAbsent(dataId, () => {});
        listeners.add(listener);
        controller.onCancel = () {
          listeners.remove(listener);
          if (listeners.isEmpty && identical(_listeners[dataId], listeners)) {
            _listeners.remove(dataId);
          }
        };
      });

  /// Hands a box event to the listeners of its key.
  ///
  /// The box subscription receives each event asynchronously and in write
  /// order, as a `box.watch(key: key)` subscription would, so listeners get it
  /// right away. Handing out writes when they are made instead would deliver
  /// them earlier than before, which changes how the Cache debounce merges
  /// them.
  void _dispatch(BoxEvent event) {
    int? writeIndex;
    final pending = _pendingWrites[event.key];
    if (pending != null && pending.first.causedBy(event)) {
      writeIndex = pending.removeFirst().index;
      if (pending.isEmpty) _pendingWrites.remove(event.key);
    }

    final listeners = _listeners[event.key];
    if (listeners == null) return;
    for (final listener in listeners.toList()) {
      // Like a box.watch subscription, a listener doesn't get the writes made
      // before it subscribed. Writes made to the box directly can't be told
      // apart, so they go to everyone listening when they arrive.
      if (writeIndex == null || writeIndex >= listener.subscribedAt) {
        listener.controller.addSync(event);
      }
    }
  }

  List<_KeyListener> _allListeners() =>
      [for (final listeners in _listeners.values) ...listeners];

  /// Whether box events of writes made now will reach [_dispatch].
  bool get _dispatching => _boxSubscription != null && box.isOpen;

  /// Records a write that makes the box emit an event.
  void _wrote(String dataId, {required bool deleted, Object? value}) {
    _pendingWrites
        .putIfAbsent(dataId, Queue.new)
        .add(_Write(_writeCount++, deleted, value));
  }

  @override
  Map<String, dynamic>? get(String dataId) {
    final value = box.get(dataId);
    return value == null ? null : Map.from(value as Map);
  }

  @override
  void put(String dataId, Map<String, dynamic>? value) {
    box.put(dataId, value);
    if (_dispatching) _wrote(dataId, deleted: false, value: value);
  }

  @override
  void putAll(Map<String, Map<String, dynamic>?> data) {
    box.putAll(data);
    if (!_dispatching) return;
    for (final MapEntry(:key, :value) in data.entries) {
      _wrote(key, deleted: false, value: value);
    }
  }

  @override
  void delete(String dataId) => deleteAll([dataId]);

  @override
  void deleteAll(Iterable<String> dataIds) {
    if (!_dispatching) {
      box.deleteAll(dataIds);
      return;
    }
    // The box only emits an event for the first delete of a key it holds.
    final deleted = {
      for (final dataId in dataIds)
        if (box.containsKey(dataId)) dataId,
    };
    box.deleteAll(dataIds);
    for (final dataId in deleted) {
      _wrote(dataId, deleted: true);
    }
  }

  // NOTE: we can't currently use box.clear since it isn't synchronous
  // https://github.com/hivedb/hive/issues/219
  @override
  void clear() => deleteAll(keys);

  @override
  Future<void> dispose() => box.close();

  @override
  Future<void> flush() => box.flush();
}

class _KeyListener {
  final MultiStreamController<BoxEvent> controller;

  /// The number of writes made before this listener subscribed.
  final int subscribedAt;

  _KeyListener(this.controller, this.subscribedAt);
}

class _Write {
  final int index;
  final bool deleted;
  final Object? value;

  _Write(this.index, this.deleted, this.value);

  bool causedBy(BoxEvent event) =>
      deleted ? event.deleted : !event.deleted && identical(event.value, value);
}
