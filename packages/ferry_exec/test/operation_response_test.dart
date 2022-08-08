import 'package:test/test.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';

import 'package:ferry_exec/src/operation_response.dart';
import 'package:ferry_test_graphql/queries/__generated__/hero_no_vars.req.gql.dart';

class TestLinkException extends LinkException {
  TestLinkException({
    dynamic originalException,
  }) : super(originalException, StackTrace.current);
}

void main() {
  final req = GHeroNoVarsReq();

  group('OperationResponse', () {
    group('hasErrors', () {
      test('is true when linkException not null', () {
        final res = OperationResponse(
          operationRequest: req,
          dataSource: DataSource.Link,
          linkException: TestLinkException(),
        );
        expect(res.hasErrors, true);
      });
      test('is false when graphqlErrors not null and empty', () {
        final res = OperationResponse(
          operationRequest: req,
          dataSource: DataSource.Link,
          graphqlErrors: [],
        );
        expect(res.hasErrors, false);
      });
      test('is true when graphqlErrors not null and not empty', () {
        final res = OperationResponse(
          operationRequest: req,
          dataSource: DataSource.Link,
          graphqlErrors: [GraphQLError(message: '')],
        );
        expect(res.hasErrors, true);
      });
    });
  });
}
