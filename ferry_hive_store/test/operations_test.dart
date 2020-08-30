import 'package:test/test.dart';
import 'package:hive/hive.dart';

import 'package:ferry_hive_store/ferry_hive_store.dart';

void main() {
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

  Hive.init('./test/__hive_data__');

  group('CRUD operations', () {
    test('starts empty', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      final store = HiveStore(box);

      expect(store.toMap(), equals({}));
    });
    test('can include seeded data', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      expect(store.toMap(), equals(data));
    });

    test('can get data', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      for (var entry in data.entries) {
        expect(store.get(entry.key), equals(entry.value));
      }
    });

    test('can put data', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      final store = HiveStore(box);

      for (var entry in data.entries) {
        store.put(entry.key, entry.value);
      }
      expect(store.toMap(), equals(data));
    });

    test('can put all data', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      final store = HiveStore(box);

      store.putAll(data);
      expect(store.toMap(), equals(data));
    });

    test('can delete data', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      store.delete(data.keys.first);
      expect(
        store.toMap(),
        equals({data.keys.last: data.values.last}),
      );
    });
  });

  group('watch operation', () {
    test('gets initial data when watching', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      expect(store.watch(), emits(data));
    });

    test('put method triggers new data', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      final newPostKey = 'Post:456';
      final newPostValue = {
        'id': '456',
        '__typename': 'Post',
      };

      expect(
        store.watch(),
        emitsInOrder([
          data,
          {...data, newPostKey: newPostValue},
        ]),
      );

      store.put(newPostKey, newPostValue);
    });

    test('changes to underlying box triggers new data', () async {
      final box = await Hive.openBox<Map<String, dynamic>>('graphql');
      await box.clear();
      await box.putAll(data);
      final store = HiveStore(box);

      final newPostKey = 'Post:456';
      final newPostValue = {
        'id': '456',
        '__typename': 'Post',
      };

      expect(
        store.watch(),
        emitsInOrder([
          data,
          {...data, newPostKey: newPostValue},
        ]),
      );

      await box.put(newPostKey, newPostValue);
    });
  });
}
