import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry/ferry.dart';
import 'package:pokemon_explorer/src/flush.dart';

import './src/client.dart';
import './src/app.dart';

const apiUrl = "https://pokeapi.dev";

void main() async {
  final client = await initClient();
  GetIt.I.registerLazySingleton<TypedLink>(() => client);
  GetIt.I.registerSingleton<Flush>(_SyncFlush(client));

  runApp(const App());
}

class _SyncFlush implements Flush {
  final Client client;

  _SyncFlush(this.client);

  @override
  void flush() {
    client.cache.store.flush();
  }
}
