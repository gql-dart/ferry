import 'package:ferry/ferry.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';

void main() {
  test('re-fetches data from network when cached data is partial', () async {
    // network response
    final link = Link.function((request, [forward]) {
      final data = GReviewsData((b) => b
        ..reviews.addAll([
          GReviewsData_reviews((b) => b
            ..id = '1'
            ..commentary = 'Review 1'
            ..stars = 5),
          GReviewsData_reviews((b) => b
            ..id = '2'
            ..commentary = 'Review 2'
            ..stars = 5),
        ])).toJson();

      return Stream.value(Response(
        errors: [],
        data: data,
        response: data,
      ));
    });

    // cache with partial data (e.g. from a previous version of the query with less fields)
    final cache = Cache(
        store: MemoryStore({
      'Query': {
        'reviews({"episode":null,"first":3,"offset":0})': {
          {'\$ref': 'Review:1'},
          {'\$ref': 'Review:2'}
        }
      },
      'Review:1': {
        'id': '1', // missing required field starts
      },
      'Review:2': {
        'id': '2',
      }
    }));

    final client = Client(cache: cache, link: link);

    final req = GReviewsReq((b) => b
      ..fetchPolicy = FetchPolicy.CacheFirst
      ..vars.first = 3
      ..vars.offset = 0);

    final result = await client.request(req).first;

    // response must come from link, since cached data is partial
    expect(result.dataSource, DataSource.Link);
  });
}
