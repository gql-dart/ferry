import 'dart:async';

import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_test_graphql/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql/queries/__generated__/reviews.req.gql.dart';
import 'package:test/test.dart';

final reviewsReq = GReviewsReq();

final review = GReviewsData_reviews(
  (b) => b
    ..id = '123'
    ..stars = 4
    ..commentary = 'Pretty Good',
);

final reviewsData = GReviewsData(
  (b) => b..reviews.add(review),
);

void main() {
  group('Watch', () {
    test('can emit null when no data exists', () async {
      final cache = Cache();
      expect(cache.watchQuery(reviewsReq), emitsInOrder([null, emitsDone]));
      await cache.dispose();
    });

    test('can return data', () async {
      final cache = Cache();

      await cache.writeQuery(reviewsReq, reviewsData);

      expect(
        cache.watchQuery(reviewsReq),
        emitsInOrder([
          reviewsData,
          emitsDone,
        ]),
      );

      await cache.dispose();
    });

    test('can receive updates to data', () async {
      final cache = Cache();
      await cache.writeQuery(reviewsReq, reviewsData);

      final nextData = reviewsData
          .rebuild((b) => b.reviews.add(review.rebuild((b) => b..id = '456')));

      expect(
        cache.watchQuery(reviewsReq),
        emitsInOrder([
          reviewsData,
          nextData,
          emitsDone,
        ]),
      );
      await Future.delayed(Duration.zero);

      await cache.writeQuery(reviewsReq, nextData);

      await Future.delayed(Duration.zero);

      await cache.dispose();
    });
  });
}
