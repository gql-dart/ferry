import 'dart:async';

import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_test_graphql/queries/__generated__/review_by_id.data.gql.dart';
import 'package:ferry_test_graphql/queries/__generated__/review_by_id.req.gql.dart';
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

final review2 = GReviewsData_reviews(
  (b) => b
    ..id = '456'
    ..stars = 3
    ..commentary = 'Okay',
);

final reviewsData = GReviewsData(
  (b) => b..reviews.add(review),
);

final reviewsData2 = GReviewsData(
  (b) => b..reviews.addAll([review, review2]),
);

void main() {
  group('Watch', () {
    test('can emit null when no data exists', () {
      final cache = Cache();
      expect(cache.watchQuery(reviewsReq), emitsInOrder([null, emitsDone]));
      cache.dispose();
    });

    test('can return data with', () {
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

    test('can receive updates to data when starting with empty data', () async {
      final cache = Cache();

      final nextData = reviewsData
          .rebuild((b) => b.reviews.add(review.rebuild((b) => b..id = '456')));

      expect(
        cache.watchQuery(reviewsReq),
        emitsInOrder([
          isNull,
          reviewsData,
          nextData,
          emitsDone,
        ]),
      );

      await Future.delayed(Duration.zero);

      cache.writeQuery(reviewsReq, reviewsData);

      await Future.delayed(Duration.zero);

      cache.writeQuery(reviewsReq, nextData);

      await Future.delayed(Duration.zero);

      await cache.dispose();
    });

    test('can resume watch after reading corrupt data from cache', () async {
      final cache = Cache();

      cache.writeQuery(reviewsReq, reviewsData);

      final dataId = cache.identify(reviewsData.reviews!.first)!;

      final data = cache.store.get(dataId);

      //corrupt the data -> write String where an int should be
      data!['stars'] = '100';
      cache.store.put(dataId, data);

      final nextData = reviewsData
          .rebuild((b) => b.reviews.add(review.rebuild((b) => b..id = '456')));

      expect(
          cache.watchQuery(reviewsReq),
          emitsInOrder([
            emitsError(isA<Error>()),
            reviewsData,
            nextData,
            emitsDone,
          ]));

      await Future.delayed(Duration.zero);

      cache.writeQuery(reviewsReq, reviewsData);

      await Future.delayed(Duration.zero);

      cache.writeQuery(reviewsReq, nextData);

      await Future.delayed(Duration.zero);

      await cache.dispose();
    });

    test('can receive updates when child objects are updated by other queries',
        () async {
      final cache = Cache();
      cache.writeQuery(reviewsReq, reviewsData);

      final updatedReview =
          reviewsData2.reviews![1].rebuild((b) => b.commentary = 'first');

      expect(
          cache.watchQuery(reviewsReq),
          emitsInOrder([
            reviewsData,
            reviewsData2,
            reviewsData2.rebuild((b) => b..reviews[1] = updatedReview),
            emitsDone,
          ]));

      await Future.delayed(Duration.zero);
      cache.writeQuery(reviewsReq, reviewsData2);
      await Future.delayed(Duration.zero);
      cache.writeQuery(
          GReviewsByIDReq((b) => b..vars.id = reviewsData2.reviews![1].id),
          GReviewsByIDData((b) => b.review
            ..id = updatedReview.id
            ..stars = updatedReview.stars
            ..createdAt = updatedReview.createdAt
            ..seenOn = updatedReview.seenOn.toBuilder()
            ..commentary = updatedReview.commentary));

      await Future.delayed(Duration.zero);

      await cache.dispose();
    });

    test('mutating data of multiple data ids at once emits only one update',
        () async {
      final cache = Cache();
      cache.writeQuery(reviewsReq, reviewsData2);

      expect(
        cache.watchQuery(reviewsReq).toList(),
        completion(hasLength(2)),
      );

      await Future.delayed(Duration.zero);
      cache.writeQuery(reviewsReq, reviewsData2);
      await Future.delayed(Duration.zero);
      cache.writeQuery(
          reviewsReq,
          GReviewsData((b) => b
            ..reviews.addAll([
              review.rebuild((p) => p.stars = 100),
              review2.rebuild((p) => p.stars = 100)
            ])));

      await Future.delayed(Duration.zero);

      await cache.dispose();
    });

    test('clearing cache emits only one update', () async {
      final cache = Cache();
      cache.writeQuery(reviewsReq, reviewsData2);

      expect(
        cache.watchQuery(reviewsReq).toList(),
        completion(hasLength(2)),
      );

      await Future.delayed(Duration.zero);
      cache.clear();
      await Future.delayed(Duration.zero);

      await cache.dispose();
    });
  });
}
