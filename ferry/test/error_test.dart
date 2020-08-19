import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:ferry/ferry.dart";
import 'package:test/test.dart';

import './graphql/all_pokemon.req.gql.dart';
import './graphql/all_pokemon.data.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  group("GraphQL Errors", () {
    test('Returns a response with GraphQL errors', () async {
      final mockLink = MockLink();

      final allPokemonReq = AllPokemon(
        buildVars: (b) => b..first = 3,
      );

      final graphQLErrors = [
        GraphQLError(message: "Your GraphQL is not valid")
      ];

      when(mockLink.request(allPokemonReq, any)).thenAnswer(
        (_) => Stream.value(Response(errors: graphQLErrors)),
      );

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      final response = QueryResponse<$AllPokemon>(
        queryRequest: allPokemonReq,
        graphqlErrors: graphQLErrors,
        dataSource: DataSource.Link,
      );

      expect(client.responseStream(allPokemonReq), emits(response));
    });
  });

  group("Network Errors", () {
    test('Returns a stream that emits an error if link throws an exception',
        () async {
      final mockLink = MockLink();

      final allPokemonReq = AllPokemon(
          buildVars: (b) => b..first = 3, fetchPolicy: FetchPolicy.NetworkOnly);

      final exception = ServerException(parsedResponse: Response());

      when(mockLink.request(allPokemonReq, any)).thenThrow(exception);

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      final response = QueryResponse<$AllPokemon>(
        queryRequest: allPokemonReq,
        linkException: exception,
        dataSource: DataSource.Link,
      );

      expect(
          client.responseStream(allPokemonReq), emitsError(equals(exception)));
    });

    test('Wraps error events of a stream into QueryResponse', () async {
      final mockLink = MockLink();

      final allPokemonReq = AllPokemon(
          buildVars: (b) => b..first = 3, fetchPolicy: FetchPolicy.NetworkOnly);

      final exception = ServerException(parsedResponse: Response());

      when(mockLink.request(allPokemonReq, any))
          .thenAnswer((_) => Stream.error(exception));

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      final response = QueryResponse<$AllPokemon>(
        queryRequest: allPokemonReq,
        linkException: exception,
        dataSource: DataSource.Link,
      );

      expect(client.responseStream(allPokemonReq), emits(response));
    });
  });

  group('Behavior after receiving errors', () {
    test('Can emit data after emitting errors', () {
      final mockLink = MockLink();

      final allPokemonReq = AllPokemon(
          buildVars: (b) => b..first = 3,
          fetchPolicy: FetchPolicy
              .CacheAndNetwork // default is CacheFirst, which allows only 1 item from Link
          );

      when(mockLink.request(allPokemonReq, any)).thenAnswer((_) async* {
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

      expect(client.responseStream(allPokemonReq),
          emitsInOrder([isA<QueryResponse>(), isA<QueryResponse>()]));
    });
  });
}

abstract class Mockable {
  int stream();
}

class MyMock extends Mock implements Mockable {}
