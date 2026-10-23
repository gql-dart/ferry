import 'package:ferry_hive_ce_store/ferry_hive_ce_store.dart';
import 'package:test/test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  Hive.init('./test/__hive_data__');

  group('CRUD operations', () {
    test('starts empty', () async {
      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      await Future<void>.delayed(Duration.zero);
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      await Future<void>.delayed(Duration.zero);
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      await Future<void>.delayed(Duration.zero);
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

      final box = await Hive.openBox<dynamic>('graphql');
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

      await Future<void>.delayed(Duration.zero);
      store.put(newPostKey, newPostValue);
      await store.dispose();
    });
  });

  group('watch dispatch', () {
    test("doesn't emit writes made before listening", () async {
      final box = await Hive.openBox<dynamic>('graphql');
      await box.clear();
      final store = HiveStore(box);
      final other = store.watch('Post:456').listen((_) {});

      // The box events of these writes are still in flight when the
      // listener below subscribes.
      store.put('Post:123', {'id': '1'});
      store.put('Post:123', {'id': '2'});

      expect(
        store.watch('Post:123', distinct: false),
        emitsInOrder([
          {'id': '2'},
          {'id': '3'},
          emitsDone,
        ]),
      );

      await Future<void>.delayed(Duration.zero);
      store.put('Post:123', {'id': '3'});
      await Future<void>.delayed(Duration.zero);
      await other.cancel();
      await store.dispose();
    });

    test('emits null when a watched key is deleted', () async {
      final box = await Hive.openBox<dynamic>('graphql');
      await box.clear();
      await box.put('Post:123', {'id': '123'});
      final store = HiveStore(box);

      expect(
        store.watch('Post:123'),
        emitsInOrder([
          {'id': '123'},
          null,
          emitsDone,
        ]),
      );

      await Future<void>.delayed(Duration.zero);
      store.delete('Post:123');
      await Future<void>.delayed(Duration.zero);
      await store.dispose();
    });

    test('emits to every listener of a key, and only to those', () async {
      final box = await Hive.openBox<dynamic>('graphql');
      await box.clear();
      final store = HiveStore(box);

      final first = <Map<String, dynamic>?>[];
      final second = <Map<String, dynamic>?>[];
      final unrelated = <Map<String, dynamic>?>[];
      final subscriptions = [
        store.watch('Post:1', distinct: false).listen(first.add),
        store.watch('Post:1', distinct: false).listen(second.add),
        store.watch('Post:2', distinct: false).listen(unrelated.add),
      ];
      await Future<void>.delayed(Duration.zero);

      store.putAll({
        'Post:1': {'id': '1'},
        'Post:3': {'id': '3'},
      });
      await Future<void>.delayed(Duration.zero);

      expect(first, [
        null,
        {'id': '1'},
      ]);
      expect(second, first);
      expect(unrelated, [null]);

      for (final subscription in subscriptions) {
        await subscription.cancel();
      }
      await store.dispose();
    });
  });

  test('mutating map does not break hive', () async {
    final box = await Hive.openBox<dynamic>('graphql');

    addTearDown(() async {
      await box.clear();
      return box.close();
    });

    final store = HiveStore(box);

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

    final post = store.get('Post:123') as Map<String, dynamic>;

    post['id'] = '456';

    final updatedPost = store.get('Post:123') as Map<String, dynamic>;

    expect(updatedPost['id'], equals('123'));
  });
}
