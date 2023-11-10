import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:test/test.dart';
import 'package:ferry_cache/ferry_cache.dart';

import 'package:gql_exec/gql_exec.dart' show Operation;

import 'package:gql/language.dart' as gql;

import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.req.gql.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.data.gql.dart';

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

    test('dataIdFromObject overrides cache.identify', () {
      final cache = Cache(dataIdFromObject: (object) => 'OVERRIDE');
      expect(cache.identify(reviewFragmentData), equals('OVERRIDE'));
    });

    test('can read and write with a data id override', () {
      final cache = Cache(dataIdFromObject: (object) => 'OVERRIDE');
      cache.writeFragment(reviewFragmentReq, reviewFragmentData);

      reviewFragmentReq.idFields['id'] = 'OVERRIDE';

      expect(cache.readFragment(reviewFragmentReq), equals(reviewFragmentData));
    });

    test('can read json operation request', () {
      final cache = Cache();
      addTearDown(cache.dispose);
      cache.writeQuery(
          reviewsReq.rebuild((b) => b.vars
            ..first = 1
            ..offset = 0
            ..episode = GEpisode.EMPIRE),
          reviewsData);

      final jsonReq = JsonOperationRequest(
        fetchPolicy: FetchPolicy.CacheFirst,
        operation: Operation(
          document: gql.parseString(r'''
          query Reviews {
            reviews(episode: $episode, first: $first, offset: $offset) {
              id
              stars
            }
          }
        '''),
          operationName: 'Reviews',
        ),
        vars: {
          'episode': 'EMPIRE',
          'first': 1,
          'offset': 0,
        },
      );

      final data = cache.readQuery(jsonReq);

      expect(data, {
        '__typename': 'Query',
        'reviews': [
          {'__typename': 'Review', 'id': '123', 'stars': 4}
        ]
      });
    });

    test('json operation request read null if not in cache', () {
      final cache = Cache();
      addTearDown(cache.dispose);
      cache.writeQuery(
          reviewsReq.rebuild((b) => b.vars
            ..first = 1
            ..offset = 0
            ..episode = GEpisode.EMPIRE),
          reviewsData);

      final jsonReq = JsonOperationRequest(
        fetchPolicy: FetchPolicy.CacheFirst,
        operation: Operation(
          document: gql.parseString(r'''
          query Reviews {
            reviews(episode: $episode, first: $first, offset: $offset) {
              id
              stars
            }
          }
        '''),
          operationName: 'Reviews',
        ),
        vars: {
          'episode': 'NEWHOPE',
          'first': 1,
          'offset': 0,
        },
      );

      final data = cache.readQuery(jsonReq);

      expect(data, null);
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
