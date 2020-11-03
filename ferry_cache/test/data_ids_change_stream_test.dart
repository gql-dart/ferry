import 'package:test/test.dart';

import 'package:ferry_cache/src/utils/data_ids_change_stream.dart';
import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart';

final existingData = {
  'Query': {
    '__typename': 'Query',
    'reviews({"episode":null,"first":null,"offset":null})': [
      {'\$ref': 'Review:123'},
    ],
    'reviews({"episode":null,"first":3,"offset":0})': [
      {'\$ref': 'Review:123'},
    ],
  },
  'Review:123': {
    '__typename': 'Review',
    'id': '123',
    'stars': 5,
    'commentary': 'I loved it!',
    'episode': null,
    'createdAt': null,
    'seenOn': [],
  },
  'Review:456': {
    '__typename': 'Review',
    'id': '456',
    'stars': 2,
    'commentary': 'It was OK',
    'episode': null,
    'createdAt': null,
    'seenOn': [],
  },
  'Review:789': {
    '__typename': 'Review',
    'id': '789',
    'stars': 1,
    'commentary': 'Terrible',
    'episode': null,
    'createdAt': null,
    'seenOn': [],
  }
};

final reviewsReq = GReviewsReq();

final review = GReviewsData_reviews.fromJson(existingData['Review:123']);

final reviewsData = GReviewsData(
  (b) => b..reviews.add(review),
);

void main() {
  group('dataIdsChangeStream', () {
    test("doesn't trigger before a change", () async {
      final store = MemoryStore(existingData);
      final cache = Cache(store: store);

      final stream = dataIdsChangeStream(
        reviewsReq,
        reviewsData,
        true,
        cache.optimisticPatchesStream,
        cache.optimisticReader,
        store,
        {},
        true,
      );

      expect(
        stream,
        emitsDone,
      );

      await Future.delayed(Duration.zero);
      await cache.dispose();
    });

    group('root operation data changes', () {
      test("doesn't trigger with changes to unused root operation fields",
          () async {
        final store = MemoryStore(existingData);
        final cache = Cache(store: store);

        final stream = dataIdsChangeStream(
          reviewsReq,
          reviewsData,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.writeQuery(
          reviewsReq.rebuild((b) => b..vars.first = 3),
          reviewsData.rebuild((b) => b..reviews.add(review)),
        );

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test("doesn't trigger with the same data for operation fields", () async {
        final store = MemoryStore(existingData);
        final cache = Cache(store: store);

        final stream = dataIdsChangeStream(
          reviewsReq,
          reviewsData,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.writeQuery(reviewsReq, reviewsData);

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with different data for operation fields', () async {
        final store = MemoryStore(existingData);
        final cache = Cache(store: store);

        final stream = dataIdsChangeStream(
          reviewsReq,
          reviewsData,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Query'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.writeQuery(
          reviewsReq,
          reviewsData.rebuild((b) => b..reviews.add(review)),
        );

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });
    });

    group('dependent reference data changes', () {
      test('triggers with change to dependent reference', () async {
        final store = MemoryStore(existingData);
        final cache = Cache(store: store);

        final stream = dataIdsChangeStream(
          reviewsReq,
          reviewsData,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Review:123'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        store.delete('Review:123');

        /// Only trigger the first time
        await Future.delayed(Duration.zero);
        store.delete('Review:123');

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });
    });

    group('optimistic patch changes', () {
      test(
          "doesn't trigger with optimistic patches that don't affect operation root",
          () async {
        final store = MemoryStore(existingData);
        final cache = Cache(store: store);

        final stream = dataIdsChangeStream(
          reviewsReq,
          reviewsData,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.optimisticPatchesStream.add({
          reviewsReq: {
            'Query': {
              'someQuery': [
                {'\$ref': 'Review:123'},
              ],
            },
          },
        });

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with optimistic patches that affect operation root',
          () async {
        final store = MemoryStore(existingData);
        final cache = Cache(store: store);

        final stream = dataIdsChangeStream(
          reviewsReq,
          reviewsData,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Query'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.optimisticPatchesStream.add({
          reviewsReq: {
            'Query': {
              'reviews({"episode":null,"first":null,"offset":null})': [
                {'\$ref': 'Review:456'},
              ],
            },
          },
        });

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with optimistic patches that affect referenced entities',
          () async {
        final store = MemoryStore(existingData);
        final cache = Cache(store: store);

        final stream = dataIdsChangeStream(
          reviewsReq,
          reviewsData,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Review:123'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.optimisticPatchesStream.add({
          reviewsReq: {
            'Review:123': {
              '__typename': 'Review',
              'id': '123',
              'stars': 3,
              'commentary': 'It was ok',
            },
          },
        });

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });
    });
  });
}
