import 'package:ferry/ferry.dart';
import 'package:test/test.dart';

import 'package:test_graphql/queries/variables/human_with_args.req.gql.dart';
import 'package:test_graphql/queries/variables/human_with_args.data.gql.dart';

void main() {
  group("CacheProxy", () {
    group("optimistic", () {
      final cache = Cache();

      final cacheProxy = CacheProxy(cache, true, null);

      final req = GHumanWithArgs((b) => b..vars.id = "123");
      final data = GHumanWithArgsData(
        (b) => b
          ..human.name = "Han Solo"
          ..human.height = 1.85,
      );

      test("can write queries", () {
        expect(cacheProxy.readQuery(req), equals(null));
        cacheProxy.writeQuery(req, data);
        expect(cacheProxy.readQuery(req), equals(data));
      });
    });
  });
}
