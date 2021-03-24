import 'dart:async';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';
import 'package:ferry_exec/ferry_exec.dart';

import 'package:ferry/src/gql_typed_link.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';

import './gql_typed_link_test.mocks.dart';

@GenerateMocks([Link])
void main() {
  group('GraphQL Errors', () {
    test('Returns a response with GraphQL errors', () async {
      final mockLink = MockLink();

      final req = GHumanWithArgsReq((b) => b..vars.id = '123');

      final graphQLErrors = [
        GraphQLError(message: 'Your GraphQL is not valid')
      ];

      when(mockLink.request(req.execRequest, any)).thenAnswer(
        (_) => Stream.value(Response(errors: graphQLErrors)),
      );

      final typedLink = GqlTypedLink(mockLink);

      final response = OperationResponse(
        operationRequest: req,
        graphqlErrors: graphQLErrors,
        dataSource: DataSource.Link,
      );

      expect(typedLink.request(req), emits(response));
    });
  });

  group('Network Errors', () {
    test('Wraps error events of a stream into OperationResponse', () async {
      final mockLink = MockLink();

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = '123'
          ..fetchPolicy = FetchPolicy.NetworkOnly,
      );

      final exception = ServerException(parsedResponse: Response());

      when(mockLink.request(req.execRequest, any))
          .thenAnswer((_) => Stream.error(exception));

      final response = OperationResponse(
        operationRequest: req,
        linkException: exception,
        dataSource: DataSource.Link,
      );

      final typedLink = GqlTypedLink(mockLink);

      expect(typedLink.request(req), emits(response));
    });
  });

  group('Behavior after receiving errors', () {
    test('Can emit data after emitting errors', () {
      final mockLink = MockLink();

      final req = GHumanWithArgsReq((b) => b..vars.id = '123');

      when(mockLink.request(req.execRequest, any)).thenAnswer((_) async* {
        final controller = StreamController<Response>();

        controller.addError('error');
        controller.add(Response(data: {}));
        controller.close();

        yield* controller.stream;
      });

      final typedLink = GqlTypedLink(mockLink);

      expect(
        typedLink.request(req),
        emitsInOrder(
          [isA<OperationResponse>(), isA<OperationResponse>()],
        ),
      );
    });
  });
}
