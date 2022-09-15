import 'dart:isolate';
import 'dart:ui';

import 'package:ferry/ferry.dart';
import 'package:ferry/ferry_isolate.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_explorer/main.dart';

Future<IsolateClient> initIsolateClient() async {
  final client = IsolateClient.create(_initClientIsolate, params: {
    'hivePath': (await getApplicationDocumentsDirectory()).path,
    'url': apiUrl,
  });

  return client;
}

// this is called on the new isolate
// if you passed a messageHandler to the IsolateClient, you can use the sendPort
// to send arbitrary messages to the main isolate.
Future<Client> _initClientIsolate(
    Map<String, dynamic>? params, SendPort? sendPort) async {
  // don't use Hive.initFlutter to avoid dealing with method channels in the isolate
  // instead, call getApplicationDocumentsDirectory() on the main isolate
  // and pass the result to the ferry isolate
  Hive.init(params!["hivePath"]);

  final box = await Hive.openBox<Map<String, dynamic>>("graphql");

  await box.clear();

  final store = HiveStore(box);

  final cache = Cache(store: store);

  final link = HttpLink(params["url"]);

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
