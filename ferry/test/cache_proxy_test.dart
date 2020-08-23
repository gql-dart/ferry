import 'package:ferry/ferry.dart';
import 'package:test/test.dart';

import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.data.gql.dart';

void main() {
  group("CacheProxy", () {
    group("writing queries", () {
      final cache = Cache();

      final req = GHumanWithArgsReq((b) => b..vars.id = "123");
      final data = GHumanWithArgsData(
        (b) => b
          ..human.name = "Han Solo"
          ..human.height = 1.85,
      );

      final cacheProxy = CacheProxy(cache, true, req.requestId);
      test("can write queries", () {
        expect(cacheProxy.readQuery(req), equals(null));
        cacheProxy.writeQuery(req, data);
        expect(cacheProxy.readQuery(req), equals(data));
      });
    });
  });
}
