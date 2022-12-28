import 'package:ferry_cache/ferry_cache.dart';
import 'package:test/test.dart';

import 'package:ferry_test_graphql2/mutations/__generated__/create_review.req.gql.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.data.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';

void main() {
  group('Optimism', () {
    final mutation1 = GCreateReviewReq(
      (b) => b
        ..vars.review.commentary = 'I loved it'
        ..vars.review.stars = 5
        ..vars.episode = GEpisode.EMPIRE,
    );

    final mutation1data = GCreateReviewData(
      (b) => b
        ..createReview.id = '123'
        ..createReview.commentary = 'I loved it'
        ..createReview.stars = 5
        ..createReview.episode = GEpisode.EMPIRE,
    );

    final mutation2 = GCreateReviewReq(
      (b) => b
        ..vars.review.commentary = 'It was OK'
        ..vars.review.stars = 3
        ..vars.episode = GEpisode.NEWHOPE,
    );

    final mutation2data = GCreateReviewData(
      (b) => b
        ..createReview.id = '456'
        ..createReview.commentary = 'It was OK'
        ..createReview.stars = 3
        ..createReview.episode = GEpisode.NEWHOPE,
    );

    group('single optimistic write', () {
      final store = MemoryStore();
      final cache = Cache(store: store);
      cache.writeQuery(
        mutation1,
        mutation1data,
        optimisticRequest: mutation1,
      );

      test('data exists optimistically', () {
        expect(
          cache.readQuery(mutation1, optimistic: true),
          equals(mutation1data),
        );
      });

      test("data doesn't exist non-optimistically", () {
        expect(
          cache.readQuery(mutation1, optimistic: false),
          equals(null),
        );
      });

      test('store is empty', () {
        expect(store.keys.length, equals(0));
      });
    });

    group('multiple optimistic writes', () {
      final store = MemoryStore();
      final cache = Cache(store: store);
      cache.writeQuery(
        mutation1,
        mutation1data,
        optimisticRequest: mutation1,
      );

      cache.writeQuery(
        mutation2,
        mutation2data,
        optimisticRequest: mutation2,
      );
      test('data exists optimistically', () {
        expect(
          cache.readQuery(mutation1, optimistic: true),
          equals(mutation1data),
        );
        expect(
          cache.readQuery(mutation2, optimistic: true),
          equals(mutation2data),
        );
      });

      test("data doesn't exist non-optimistically", () {
        expect(
          cache.readQuery(mutation1, optimistic: false),
          equals(null),
        );
        expect(
          cache.readQuery(mutation2, optimistic: false),
          equals(null),
        );
      });

      test('store is empty', () {
        expect(store.keys.length, equals(0));
      });

      test('can remove a single optimistic patch', () {
        cache.removeOptimisticPatch(mutation1);

        expect(
          cache.readQuery(mutation1, optimistic: true),
          equals(null),
        );
        expect(
          cache.readQuery(mutation2, optimistic: true),
          equals(mutation2data),
        );
      });
    });

    group('remove all patches', () {
      test('remove all patches test', () {
        final store = MemoryStore();
        final cache = Cache(store: store);
        cache.writeQuery(
          mutation1,
          mutation1data,
          optimisticRequest: mutation1,
        );

        expect(
          cache.readQuery(mutation1, optimistic: true),
          equals(mutation1data),
        );

        cache.clearOptimisticPatches();

        expect(
          cache.readQuery(mutation1, optimistic: true),
          equals(null),
        );
      });
    });
  });
}
