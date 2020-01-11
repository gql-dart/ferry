import "dart:async";
import "package:test/test.dart";
import 'package:normalize/normalize.dart';

import '../example/lib/graphql_api.dart';
import '../lib/src/cache/cache.dart';

void main() {
  test("Empty", () {
    final cache = GQLCache();

    expect(cache.optimisticDataStream, emits({}));
  });
}
