import 'package:flutter/material.dart';

import 'pokemon_list.dart';
import './pokemon_detail.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Demo',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => PokemonListScreen(),
            );
          case 'detail':
            return MaterialPageRoute(
              builder: (_) =>
                  PokemonDetailScreen(id: (settings.arguments as Map)["id"]!),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const Scaffold(body: Text('Route not found.')),
            );
        }
      },
    );
  }
}
