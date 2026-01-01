import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

const apiUrl = 'https://graphql.pokeapi.co/v1beta2';

Client initClient() {
  final link = HttpLink(apiUrl);
  return Client(
    link: link,
    cache: Cache(
      store: MemoryStore(),
      typePolicies: const {
        'query_root': TypePolicy(queryType: true),
        'mutation_root': TypePolicy(mutationType: true),
        'subscription_root': TypePolicy(subscriptionType: true),
      },
    ),
  );
}
