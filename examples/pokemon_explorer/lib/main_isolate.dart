import 'package:ferry/ferry.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_explorer/src/app.dart';

import 'src/client_isolate.dart';

// example for running the client in a separate isolate
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = await initIsolateClient();
  GetIt.I.registerLazySingleton<TypedLink>(() => client);
  runApp(App());
}
