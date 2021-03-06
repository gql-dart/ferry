import 'package:test/test.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';

import 'package:ferry_exec/src/operation_response.dart';

class TestLinkException implements LinkException {
  @override
  Exception get originalException => null;
}

void main() {
  group('OperationResponse', () {
    group('hasErrors', () {
      test('is true when linkException not null', () {
        final res = OperationResponse(
          operationRequest: null,
          dataSource: null,
          linkException: TestLinkException(),
        );
        expect(res.hasErrors, true);
      });
      test('is false when graphqlErrors not null and empty', () {
        final res = OperationResponse(
          operationRequest: null,
          dataSource: null,
          graphqlErrors: [],
        );
        expect(res.hasErrors, false);
      });
      test('is true when graphqlErrors not null and not empty', () {
        final res = OperationResponse(
          operationRequest: null,
          dataSource: null,
          graphqlErrors: [GraphQLError(message: '')],
        );
        expect(res.hasErrors, true);
      });
    });
  });
}
