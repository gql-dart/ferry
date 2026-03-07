import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';

import 'pokemon_list.dart';

class PokemonExplorerApp extends StatelessWidget {
  const PokemonExplorerApp({super.key, required this.client});

  final Client client;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.redAccent,
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'Pokemon Explorer 2',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: PokemonListScreen(client: client),
    );
  }
}
