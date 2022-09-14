
import 'package:ferry/ferry_isolate.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_explorer/__generated__/schema.schema.gql.dart';

Future<Client> initClient({Map<String, dynamic>? params}) async {

  Hive.init(params!["hivePath"]);

  final box = await Hive.openBox<Map<String, dynamic>>("graphql");

  await box.clear();

  final store = HiveStore(box);

  final cache = Cache(store: store);

  final link = HttpLink("https://pokeapi.dev");

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}

Future<IsolateClient> initIsolateClient() async {

  final client = IsolateClient.spawn(initClient, params: {'hivePath': (await getApplicationDocumentsDirectory()).path});

  return client;


}


