import 'package:ferry/ferry.dart';
import 'package:ferry/ferry_isolate.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_explorer/src/app.dart';
import 'package:pokemon_explorer/src/flush.dart';

import 'src/client_isolate.dart';

// example for running the client in a separate isolate
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = await initIsolateClient();
  GetIt.I.registerLazySingleton<TypedLink>(() => client);
  GetIt.I.registerSingleton<Flush>(_IsolateFlush(client));
  runApp(const App());
}

class _IsolateFlush implements Flush {
  final IsolateClient client;

  _IsolateFlush(this.client);

  @override
  void flush() {
    client.flushStore().then((_) => debugPrint('Store flushed'));
  }
}
