import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Client> initClient() async {
  await Hive.initFlutter();

  final box = await Hive.openBox("graphql");

  await box.clear();

  final store = HiveStore(box);

  final cache = Cache(dataStore: store);

  final link = HttpLink("https://ferry.us-west-2.aws.cloud.dgraph.io/graphql");

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
