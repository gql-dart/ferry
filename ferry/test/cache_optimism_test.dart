import 'package:ferry_cache/ferry_cache.dart';
import 'package:test/test.dart';

import 'package:ferry_test_graphql/mutations/variables/create_review.req.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.data.gql.dart';
import 'package:ferry_test_graphql/schema/schema.schema.gql.dart';

void main() {
  group("Optimism", () {
    final mutation1 = GCreateReviewReq(
      (b) => b
        ..vars.review.commentary = "I loved it"
        ..vars.review.stars = 5
        ..vars.episode = GEpisode.EMPIRE,
    );

    final mutation1data = GCreateReviewData(
      (b) => b
        ..createReview.id = "123"
        ..createReview.commentary = "I loved it"
        ..createReview.stars = 5
        ..createReview.episode = GEpisode.EMPIRE,
    );

    final mutation2 = GCreateReviewReq(
      (b) => b
        ..vars.review.commentary = "It was OK"
        ..vars.review.stars = 3
        ..vars.episode = GEpisode.NEWHOPE,
    );

    final mutation2data = GCreateReviewData(
      (b) => b
        ..createReview.id = "456"
        ..createReview.commentary = "It was OK"
        ..createReview.stars = 3
        ..createReview.episode = GEpisode.NEWHOPE,
    );

    group("single optimistic write", () {
      final store = MemoryStore();
      final cache = Cache(store: store);
      cache.writeQuery(
        mutation1.execRequest,
        mutation1data.toJson(),
        optimistic: true,
        requestId: mutation1.requestId,
      );

      test("data exists optimistically", () {
        expect(
          cache.readQuery(mutation1.execRequest, optimistic: true),
          equals(mutation1data.toJson()),
        );
      });

      test("data doesn't exist non-optimistically", () {
        expect(
          cache.readQuery(mutation1.execRequest, optimistic: false),
          equals(null),
        );
      });

      test("store is empty", () {
        expect(store.toMap(), equals({}));
      });
    });

    group("multiple optimistic writes", () {
      final store = MemoryStore();
      final cache = Cache(store: store);
      cache.writeQuery(
        mutation1.execRequest,
        mutation1data.toJson(),
        optimistic: true,
        requestId: mutation1.requestId,
      );

      cache.writeQuery(
        mutation2.execRequest,
        mutation2data.toJson(),
        optimistic: true,
        requestId: mutation2.requestId,
      );
      test("data exists optimistically", () {
        expect(
          cache.readQuery(mutation1.execRequest, optimistic: true),
          equals(mutation1data.toJson()),
        );
        expect(
          cache.readQuery(mutation2.execRequest, optimistic: true),
          equals(mutation2data.toJson()),
        );
      });

      test("data doesn't exist non-optimistically", () {
        expect(
          cache.readQuery(mutation1.execRequest, optimistic: false),
          equals(null),
        );
        expect(
          cache.readQuery(mutation2.execRequest, optimistic: false),
          equals(null),
        );
      });

      test("store is empty", () {
        expect(store.toMap(), equals({}));
      });

      test("can remove a single optimistic patch", () {
        cache.removeOptimisticPatch(mutation1.requestId);

        expect(
          cache.readQuery(mutation1.execRequest, optimistic: true),
          equals(null),
        );
        expect(
          cache.readQuery(mutation2.execRequest, optimistic: true),
          equals(mutation2data.toJson()),
        );
      });
    });
  });
}
