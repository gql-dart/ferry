import 'package:ferry/ferry_isolate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry/ferry.dart';

import './src/client.dart';
import './src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = await initIsolateClient();
  GetIt.I.registerLazySingleton<IsolateClient>(() => client);
  runApp(App());
}
