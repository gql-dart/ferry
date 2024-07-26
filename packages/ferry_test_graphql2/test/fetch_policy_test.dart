import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart';
import 'package:test/test.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';

void main() {
  group('Fetch Policies', () {
    final req =
        GReviewsReq((b) => b..fetchPolicy = FetchPolicy.CacheAndNetwork);

    final json = req.toJson();
    final deserialized = GReviewsReq.fromJson(json);

    test('can serialize and deserialize a request with its fetch policy', () {
      expect(req, equals(deserialized));
    });
  });
}
