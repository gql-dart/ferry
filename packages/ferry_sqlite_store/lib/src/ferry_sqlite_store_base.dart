import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ferry_store/ferry_store.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:rxdart/rxdart.dart';

final _jsonUtf8Encoder = const JsonEncoder().fuse(const Utf8Encoder());
final _jsonUtf8Decoder = const Utf8Decoder().fuse(const JsonDecoder());

/// A store that loads data from a SQLite table into memory at startup,
/// and writes back to disk only on [flush] or [dispose].
/// Uses BehaviorSubject so that watch() immediately yields
/// the current value and doesn't leak memory when unsubscribed.
/// Note: if you're using this in a Flutter app, consider flushing
/// in [WidgetsBindingObserver.didChangeAppLifecycleState].
/// If you don't flush, you will not persist changes to disk.
class Sqlite3StoreInMemoryFlush extends Store {
  final Database _db;
  final JsonEquals _jsonEquals;

  // Holds everything in memory to skip JSON parse each time.
  final Map<String, Map<String, dynamic>?> _memoryData = {};

  // Each dataId has its own BehaviorSubject, so new subscribers
  // always get the latest value immediately. We'll remove them
  // from this map when the last subscriber unsubscribes.
  final Map<String, BehaviorSubject<Map<String, dynamic>?>> _watchers = {};

  // Precompiled statements
  late final _deleteStmt =
      _db.prepare('DELETE FROM ferry_store WHERE data_id = ?');
  late final _putStmt = _db.prepare(
    'INSERT OR REPLACE INTO ferry_store (data_id, data) VALUES (?, ?)',
  );

  Sqlite3StoreInMemoryFlush(this._db, [JsonEquals? jsonEquals])
      : _jsonEquals = jsonEquals ?? jsonMapEquals {
    _ensureInitialized();
    _loadAllFromDb();
  }

  void _ensureInitialized() {
    _db.execute('PRAGMA journal_mode = WAL;');
    _db.execute('CREATE TABLE IF NOT EXISTS ferry_store ('
        'data_id TEXT PRIMARY KEY NOT NULL,'
        'data BLOB'
        ')');
    _db.execute(
      'CREATE UNIQUE INDEX IF NOT EXISTS ferry_store_data_id '
      'ON ferry_store (data_id)',
    );
  }

  void _loadAllFromDb() {
    final result = _db.select('SELECT data_id, data FROM ferry_store');
    for (final row in result) {
      final dataId = row['data_id'] as String;
      final bytes = row['data'] as Uint8List;
      final json = _jsonUtf8Decoder.convert(bytes);
      _memoryData[dataId] = json as Map<String, dynamic>?;
    }
  }

  @override
  void clear() {
    _memoryData.clear();
    // No DB write until flush
    _notifyWatchersAll(null);
  }

  @override
  void delete(String dataId) {
    if (!_memoryData.containsKey(dataId)) return;
    _memoryData.remove(dataId);
    // No DB write until flush
    _notifyWatcher(dataId, null);
  }

  @override
  void deleteAll(Iterable<String> dataIds) {
    for (final id in dataIds) {
      if (_memoryData.containsKey(id)) {
        _memoryData.remove(id);
        _notifyWatcher(id, null);
      }
    }
  }

  @override

  /// Get the data from memory.
  /// You MUST NOT modify the returned map.
  Map<String, dynamic>? get(String dataId) {
    return _memoryData[dataId];
  }

  @override
  Iterable<String> get keys => _memoryData.keys;

  @override
  void put(String dataId, Map<String, dynamic>? value) {
    final oldValue = _memoryData[dataId];
    _memoryData[dataId] = value;
    if (!_jsonEquals(oldValue, value)) {
      _notifyWatcher(dataId, value);
    }
  }

  @override
  void putAll(Map<String, Map<String, dynamic>?> data) {
    data.forEach((dataId, newValue) {
      final oldValue = _memoryData[dataId];
      _memoryData[dataId] = newValue;
      if (!_jsonEquals(oldValue, newValue)) {
        _notifyWatcher(dataId, newValue);
      }
    });
  }

  /// Writes all in-memory data to the database.
  @override
  Future<void> flush() async {
    try {
      _db.execute('BEGIN TRANSACTION;');
      _db.execute('DELETE FROM ferry_store;');

      for (final entry in _memoryData.entries) {
        final dataId = entry.key;
        final value = entry.value;
        final blob = _jsonUtf8Encoder.convert(value);
        _putStmt.execute([dataId, blob]);
      }
      _db.execute('COMMIT;');
    } catch (e) {
      _db.execute('ROLLBACK;');
      rethrow;
    }
  }

  @override
  Future<void> dispose() async {
    // Make sure we persist changes before closing
    await flush();
    _deleteStmt.dispose();
    _putStmt.dispose();
    _db.dispose();

    // Close watchers
    for (final subject in _watchers.values) {
      await subject.close();
    }
    _watchers.clear();
  }

  /// Return a stream that immediately emits the current value.
  /// Because we use BehaviorSubject, new subscribers will always see
  /// the "most recent" event as soon as they listen.
  ///
  /// We also apply `.distinct()` to avoid spamming watchers if `distinct = true`.
  @override
  Stream<Map<String, dynamic>?> watch(String dataId, {bool distinct = true}) {
    // If there's already a BehaviorSubject for this dataId, use it.
    final subject = _watchers.putIfAbsent(dataId, () {
      // Create a new subject seeded with the current in-memory value.
      final s =
          BehaviorSubject<Map<String, dynamic>?>.seeded(_memoryData[dataId]);

      // When the last subscriber cancels, automatically close + remove from the map
      s.onCancel = () {
        // If no more listeners remain on this subject, close and remove it
        if (!s.hasListener) {
          s.close();
          _watchers.remove(dataId);
        }
      };
      return s;
    });

    // If distinct, filter out consecutive duplicates:
    if (distinct) {
      return subject.distinct((prev, next) => _jsonEquals(prev, next));
    } else {
      return subject;
    }
  }

  /// Notify watchers of a specific dataId about new value.
  void _notifyWatcher(String dataId, Map<String, dynamic>? newValue) {
    _watchers[dataId]?.add(newValue);
  }

  /// Notify all watchers that everything changed (e.g. cleared).
  void _notifyWatchersAll(Map<String, dynamic>? newValue) {
    for (final subject in _watchers.values) {
      subject.add(newValue);
    }
  }
}

/// A store that reads/writes from/to a SQLite table,
/// but also keeps an in-memory map to avoid repeated JSON parsing on [get].
/// On every [put]/[delete], it writes to the database immediately.
/// It uses BehaviorSubject so that watch() immediately yields
/// the current value and cleans up watchers when they're unsubscribed.
class Sqlite3StoreInMemoryWriteThrough extends Store {
  final Database _db;
  final JsonEquals _jsonEquals;

  // Holds everything in memory to skip JSON parse each time.
  final Map<String, Map<String, dynamic>?> _memoryData = {};

  // Each dataId gets its own BehaviorSubject with the latest value.
  // We'll remove the subject once all subscribers unsubscribe.
  final Map<String, BehaviorSubject<Map<String, dynamic>?>> _watchers = {};

  // Precompiled statements
  late final _deleteStmt =
      _db.prepare('DELETE FROM ferry_store WHERE data_id = ?');

  late final _putStmt = _db.prepare(
      'INSERT OR REPLACE INTO ferry_store (data_id, data) VALUES (?, ?)');

  Sqlite3StoreInMemoryWriteThrough(this._db, [JsonEquals? jsonEquals])
      : _jsonEquals = jsonEquals ?? jsonMapEquals {
    _ensureInitialized();
    _loadAllFromDb();
  }

  void _ensureInitialized() {
    _db.execute('PRAGMA journal_mode = WAL;'
        'CREATE TABLE IF NOT EXISTS ferry_store (data_id TEXT PRIMARY KEY NOT NULL, data BLOB); '
        'CREATE UNIQUE INDEX IF NOT EXISTS ferry_store_data_id ON ferry_store (data_id);');
  }

  void _loadAllFromDb() {
    final result = _db.select('SELECT data_id, data FROM ferry_store');
    for (final row in result) {
      final dataId = row['data_id'] as String;
      final bytes = row['data'] as Uint8List;
      final json = _jsonUtf8Decoder.convert(bytes);
      _memoryData[dataId] = json as Map<String, dynamic>?;
    }
  }

  @override
  void clear() {
    _memoryData.clear();
    // Immediately write to DB
    _db.execute('DELETE FROM ferry_store;');
    // Notify watchers
    _notifyWatchersAll(null);
  }

  @override
  void delete(String dataId) {
    if (!_memoryData.containsKey(dataId)) {
      return;
    }
    _memoryData.remove(dataId);
    // Immediately write to DB
    _deleteStmt.execute([dataId]);
    // Notify watchers
    _notifyWatcher(dataId, null);
  }

  @override
  void deleteAll(Iterable<String> dataIds) {
    for (final id in dataIds) {
      if (_memoryData.containsKey(id)) {
        _memoryData.remove(id);
        _deleteStmt.execute([id]);
        _notifyWatcher(id, null);
      }
    }
  }

  @override
  Map<String, dynamic>? get(String dataId) {
    return _memoryData[dataId];
  }

  @override
  Iterable<String> get keys => _memoryData.keys;

  @override
  void put(String dataId, Map<String, dynamic>? value) {
    final oldValue = _memoryData[dataId];
    // If the new value is the same, skip the DB write & watchers
    if (_jsonEquals(oldValue, value)) {
      return;
    }

    // Write to memory
    _memoryData[dataId] = value;

    // Immediately write to DB
    final blob = _jsonUtf8Encoder.convert(value);
    _putStmt.execute([dataId, blob]);

    // Notify watchers
    _notifyWatcher(dataId, value);
  }

  @override
  void putAll(Map<String, Map<String, dynamic>?> data) {
    data.forEach((dataId, newValue) {
      final oldValue = _memoryData[dataId];
      if (_jsonEquals(oldValue, newValue)) {
        return;
      }

      _memoryData[dataId] = newValue;
      final blob = _jsonUtf8Encoder.convert(newValue);
      _putStmt.execute([dataId, blob]);

      _notifyWatcher(dataId, newValue);
    });
  }

  /// In write-through, everything is already saved to DB as we go.
  @override
  Future<void> flush() async {
    // No-op: data is already persisted on each put/delete
  }

  @override
  Future<void> dispose() async {
    // Optional: flush in case you have leftover changes in memory
    await flush();

    _deleteStmt.dispose();
    _putStmt.dispose();
    _db.dispose();

    // Close watchers
    for (final subject in _watchers.values) {
      await subject.close();
    }
    _watchers.clear();
  }

  /// Return a stream that immediately emits the current value (BehaviorSubject)
  /// and then any future updates. Each dataId has its own subject.
  /// We remove the subject once all subscribers unsubscribe.
  @override
  Stream<Map<String, dynamic>?> watch(String dataId, {bool distinct = true}) {
    final subject = _watchers.putIfAbsent(dataId, () {
      // Seed the subject with the current in-memory value
      final s =
          BehaviorSubject<Map<String, dynamic>?>.seeded(_memoryData[dataId]);

      // Auto-cleanup when the last subscriber unsubscribes
      s.onCancel = () {
        if (!s.hasListener) {
          s.close();
          _watchers.remove(dataId);
        }
      };

      return s;
    });

    if (distinct) {
      return subject.distinct((prev, next) => _jsonEquals(prev, next));
    } else {
      return subject;
    }
  }

  void _notifyWatcher(String dataId, Map<String, dynamic>? newValue) {
    _watchers[dataId]?.add(newValue);
  }

  void _notifyWatchersAll(Map<String, dynamic>? newValue) {
    for (final subject in _watchers.values) {
      subject.add(newValue);
    }
  }
}
