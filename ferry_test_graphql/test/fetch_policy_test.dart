import 'package:ferry_exec/ferry_exec.dart';
import 'package:test/test.dart';
import 'package:ferry_test_graphql/queries/__generated__/reviews.req.gql.dart';

void main() {
  group('Fetch Policies', () {
    final req =
        GReviewsReq((b) => b..fetchPolicy = FetchPolicy.CacheAndNetwork);

    final json = <String, dynamic>{};
    test('can serialize and deserialize a request with its fetch policy', () {
      expect(req.toJson(), equals(json));
      expect(GReviewsReq.fromJson(json), equals(req));
    });
  });
}
