import 'package:test/test.dart';
import 'package:ferry/cache.dart';

import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart';
import 'package:ferry_test_graphql/fragments/review_fragment.req.gql.dart';
import 'package:ferry_test_graphql/fragments/review_fragment.data.gql.dart';

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

final reviewFragmentReq =
    GReviewFragmentReq((b) => b..idFields = {'id': review.id});

final reviewFragmentData = GReviewFragmentData.fromJson(review.toJson());

void main() {
  group('sync operations', () {
    test('can read and write queries', () {
      final cache = Cache();
      cache.writeQuery(reviewsReq, reviewsData);
      expect(cache.readQuery(reviewsReq), equals(reviewsData));
    });

    test('can read fragments written by queries', () {
      final cache = Cache();
      cache.writeQuery(reviewsReq, reviewsData);
      expect(cache.readFragment(reviewFragmentReq), equals(reviewFragmentData));
    });

    test('can read and write fragments', () {
      final cache = Cache();
      cache.writeFragment(reviewFragmentReq, reviewFragmentData);
      expect(cache.readFragment(reviewFragmentReq), equals(reviewFragmentData));
    });

    test('can clear cache', () {
      final cache = Cache();

      cache.writeQuery(reviewsReq, reviewsData);
      expect(
        cache.readQuery(reviewsReq),
        equals(reviewsData),
      );

      cache.clear();
      expect(
        cache.readQuery(reviewsReq),
        equals(null),
      );
    });
  });
}
