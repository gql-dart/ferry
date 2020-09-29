import 'dart:async';

import 'package:test/test.dart';
import 'package:ferry_cache/ferry_cache.dart';

import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart';

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
    test('can emit null when no data exists', () {
      final cache = Cache();
      expect(cache.watchQuery(reviewsReq), emitsInOrder([null, emitsDone]));
      cache.dispose();
    });

    test('can return data', () {
      final cache = Cache();

      cache.writeQuery(reviewsReq, reviewsData);

      expect(
        cache.watchQuery(reviewsReq),
        emitsInOrder([
          reviewsData,
          emitsDone,
        ]),
      );

      cache.dispose();
    });

    test('can receive updates to data', () async {
      final cache = Cache();
      cache.writeQuery(reviewsReq, reviewsData);

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

      cache.writeQuery(reviewsReq, nextData);

      await Future.delayed(Duration.zero);

      await cache.dispose();
    });
  });
}
