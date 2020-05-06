import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:gql_exec/gql_exec.dart';

import '../../lib/ferry.dart';

class TestLinkException implements LinkException {
  @override
  get originalException => null;
}

void main() {
  group("QueryResponse", () {
    group("hasErrors", () {
      test("is true when linkException not null", () {
        final res = QueryResponse(
          queryRequest: null,
          dataSource: null,
          linkException: TestLinkException(),
        );
        expect(res.hasErrors, true);
      });
      test("is false when graphqlErrors not null and empty", () {
        final res = QueryResponse(
          queryRequest: null,
          dataSource: null,
          graphqlErrors: [],
        );
        expect(res.hasErrors, false);
      });
      test("is true when graphqlErrors not null and not empty", () {
        final res = QueryResponse(
          queryRequest: null,
          dataSource: null,
          graphqlErrors: [GraphQLError(message: "")],
        );
        expect(res.hasErrors, true);
      });
    });
  });
}
