import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry/ferry.dart';

import './src/client.dart';
import './src/app.dart';

void main() async {
  final client = await initClient();
  GetIt.I.registerLazySingleton<Client>(() => client);
  runApp(const App());
}
