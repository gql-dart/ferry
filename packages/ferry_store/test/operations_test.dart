import 'package:ferry_store/ferry_store.dart';
import 'package:test/test.dart';

void main() {
  group('CRUD operations', () {
    test('starts empty', () {
      final store = MemoryStore();
      expect(store.keys.length, equals(0));
    });
    test('can include seeded data', () async {
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

      final store = MemoryStore(data);

      for (var key in store.keys) {
        expect(await store.get(key), equals(data[key]));
      }
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

      final store = MemoryStore(data);

      for (var entry in data.entries) {
        expect(await store.get(entry.key), equals(entry.value));
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

      final store = MemoryStore();

      for (var entry in data.entries) {
        await store.put(entry.key, entry.value);
      }
      for (var key in store.keys) {
        expect(await store.get(key), equals(data[key]));
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

      final store = MemoryStore();

      await store.putAll(data);

      for (var key in store.keys) {
        expect(await store.get(key), equals(data[key]));
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

      final store = MemoryStore(data);

      await store.delete(data.keys.first);
      expect(
        store.keys,
        equals([data.keys.last]),
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

      final store = MemoryStore(data);

      await store.clear();
      expect(store.keys.length, equals(0));
    });
  });

  group('watch operation', () {
    test('gets initial data when watching', () async {
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

      final store = MemoryStore(data);

      expect(store.watch(data.keys.first), emits(data.values.first));
    });

    test('dispose method triggers done event', () async {
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

      final store = MemoryStore(data);

      expect(store.watch(data.keys.first),
          emitsInOrder([data.values.first, emitsDone]));

      await store.dispose();
    });

    test('put method triggers with correct key and new data', () async {
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

      final store = MemoryStore(data);

      final newData = {
        'posts': [
          {'\$ref': 'Post:456'}
        ]
      };

      expect(
        store.watch(data.keys.first),
        emitsInOrder([
          data.values.first,
          newData,
        ]),
      );

      await Future.delayed(Duration.zero);
      await store.put(data.keys.first, newData);
    });

    test("put method doesn't trigger with correct key and same data", () async {
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

      final store = MemoryStore(data);

      expect(
        store.watch(data.keys.first),
        emitsInOrder([
          data.values.first,
          emitsDone,
        ]),
      );

      await Future.delayed(Duration.zero);
      await store.put(data.keys.first, data.values.first);
      await store.dispose();
    });

    test("put method doesn't trigger with different key", () async {
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

      final store = MemoryStore(data);

      final newPostKey = 'Post:456';
      final newPostValue = {
        'id': '456',
        '__typename': 'Post',
      };

      expect(
        store.watch(data.keys.first),
        emitsInOrder([
          data.values.first,
          emitsDone,
        ]),
      );

      await Future.delayed(Duration.zero);
      await store.put(newPostKey, newPostValue);
      await store.dispose();
    });
  });
}
