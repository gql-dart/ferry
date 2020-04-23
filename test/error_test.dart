import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:flutter_test/flutter_test.dart";
import "package:ferry/ferry.dart";

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
    test('Returns a network error when Link throws', () async {
      final mockLink = MockLink();

      final allPokemonReq = AllPokemon(
        buildVars: (b) => b..first = 3,
      );

      final networkError = ServerException(parsedResponse: Response());

      when(mockLink.request(allPokemonReq, any)).thenThrow(networkError);

      final client = Client(
        link: mockLink,
        options: ClientOptions(addTypename: false),
      );

      final response = QueryResponse<$AllPokemon>(
        queryRequest: allPokemonReq,
        networkError: networkError,
        dataSource: DataSource.Link,
      );

      expect(client.responseStream(allPokemonReq), emits(response));
    });
  });
}
