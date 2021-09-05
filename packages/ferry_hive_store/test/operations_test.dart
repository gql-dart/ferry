import 'package:test/test.dart';
import 'package:hive/hive.dart';

import 'package:ferry_hive_store/ferry_hive_store.dart';

void main() {
  Hive.init('./test/__hive_data__');

  group('CRUD operations', () {
    test('starts empty', () async {
      final box = await Hive.openBox('graphql');
      await box.clear();
      final store = HiveStore(box);

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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      for (var entry in data.entries) {
        expect(store.get(entry.key), equals(entry.value));
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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

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

      final box = await Hive.openBox('graphql');
      await box.clear();
      final store = HiveStore(box);

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

      final box = await Hive.openBox('graphql');
      await box.clear();
      final store = HiveStore(box);

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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      store.clear();
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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      expect(store.watch(data.keys.first), emits(data.values.first));
    });

    test('put method triggers new data', () async {
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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

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
      store.put(data.keys.first, newData);
    });

    test('changes to underlying box triggers new data', () async {
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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

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
      await box.put(data.keys.first, newData);
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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      expect(
        store.watch(data.keys.first),
        emitsInOrder([
          data.values.first,
          emitsDone,
        ]),
      );

      await Future.delayed(Duration.zero);
      store.put(data.keys.first, data.values.first);
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

      final box = await Hive.openBox('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

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
      store.put(newPostKey, newPostValue);
      await store.dispose();
    });
  });
}
