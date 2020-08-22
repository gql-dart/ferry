import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:ferry/ferry.dart";
import 'package:test/test.dart';

import 'package:test_graphql/queries/variables/human_with_args.req.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  group("GraphQL Errors", () {
    test('Returns a response with GraphQL errors', () async {
      final mockLink = MockLink();

      final req = GHumanWithArgsReq((b) => b..vars.id = "123");

      final graphQLErrors = [
        GraphQLError(message: "Your GraphQL is not valid")
      ];

      when(mockLink.request(req.execRequest, any)).thenAnswer(
        (_) => Stream.value(Response(errors: graphQLErrors)),
      );

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      final response = OperationResponse(
        operationRequest: req,
        graphqlErrors: graphQLErrors,
        dataSource: DataSource.Link,
      );

      expect(client.responseStream(req), emits(response));
    });
  });

  group("Network Errors", () {
    test('Returns a stream that emits an error if link throws an exception',
        () async {
      final mockLink = MockLink();

      final req = GHumanWithArgsReq((b) => b..vars.id = "123");

      final exception = ServerException(parsedResponse: Response());

      when(mockLink.request(req.execRequest, any)).thenThrow(exception);

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      final response = OperationResponse(
        operationRequest: req,
        linkException: exception,
        dataSource: DataSource.Link,
      );

      // TODO: check that also emits response

      expect(client.responseStream(req), emitsError(equals(exception)));
    });

    test('Wraps error events of a stream into OperationResponse', () async {
      final mockLink = MockLink();

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = "123"
          ..fetchPolicy = FetchPolicy.NetworkOnly,
      );

      final exception = ServerException(parsedResponse: Response());

      when(mockLink.request(req.execRequest, any))
          .thenAnswer((_) => Stream.error(exception));

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      final response = OperationResponse(
        operationRequest: req,
        linkException: exception,
        dataSource: DataSource.Link,
      );

      expect(client.responseStream(req), emits(response));
    });
  });

  group('Behavior after receiving errors', () {
    test('Can emit data after emitting errors', () {
      final mockLink = MockLink();

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = "123"
          ..fetchPolicy = FetchPolicy
              .CacheAndNetwork, // default is CacheFirst, which allows only 1 item from Link
      );

      when(mockLink.request(req.execRequest, any)).thenAnswer((_) async* {
        final controller = StreamController<Response>();

        controller.addError("error");
        controller.add(Response(data: {}));
        controller.close();

        yield* controller.stream;
      });

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      expect(client.responseStream(req),
          emitsInOrder([isA<OperationResponse>(), isA<OperationResponse>()]));
    });
  });
}
