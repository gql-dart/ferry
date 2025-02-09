import 'package:ferry_sqlite_store/ferry_sqlite_store.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    late Sqlite3StoreInMemoryFlush store;

    setUp(() {
      store = Sqlite3StoreInMemoryFlush(sqlite3.openInMemory());
    });

    tearDown(() {
      return store.dispose();
    });

    test('can get data', () async {
      final data = {
        'Query': {
          'posts': [
            {'\$ref': 'Post:123'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
        },
      };

      store.putAll(data);

      for (var entry in data.entries) {
        expect(store.get(entry.key), equals(entry.value));
      }
    });

    test('can put data', () async {
      final data = {
        'Query': {
          'posts': [
            {'\$ref': 'Post:123'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
        },
      };

      for (var entry in data.entries) {
        store.put(entry.key, entry.value);
      }

      for (var entry in data.entries) {
        expect(store.get(entry.key), equals(entry.value));
      }
    });

    test('can put all data', () async {
      final data = {
        'Query': {
          'posts': [
            {'\$ref': 'Post:123'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
        },
      };

      store.putAll(data);

      for (var entry in data.entries) {
        expect(store.get(entry.key), equals(entry.value));
      }
    });

    test('can delete data', () async {
      final data = {
        'Query': {
          'posts': [
            {'\$ref': 'Post:123'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
        },
      };

      store.putAll(data);

      final key = store.keys.first;

      store.delete(key);
      expect(
        store.get(key),
        equals(null),
      );
    });

    test('can clear data', () async {
      final data = {
        'Query': {
          'posts': [
            {'\$ref': 'Post:123'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
        },
      };

      store.putAll(data);

      store.clear();
      expect(store.keys.length, equals(0));
    });
  });
}
