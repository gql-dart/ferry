import 'package:ferry/ferry_isolate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry/ferry.dart';

import './src/client.dart';
import './src/app.dart';

const apiUrl = "https://pokeapi.dev";

void main() async {
  final client = await initClient();
  GetIt.I.registerLazySingleton<TypedLink>(() => client);
  runApp(App());
}