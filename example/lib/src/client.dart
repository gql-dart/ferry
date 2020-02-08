import 'package:gql_http_link/gql_http_link.dart';
import 'package:gql_client/gql_client.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<GQLClient> initClient() async {
  await Hive.initFlutter();

  final box = await Hive.openBox("graphql");

  final store = HiveStore(box);

  final cache = GQLCache(dataStore: store);

  final link = HttpLink("https://graphql-pokemon.now.sh/graphql");

  final client = GQLClient(
    link: link,
    cache: cache,
  );

  return client;
}
