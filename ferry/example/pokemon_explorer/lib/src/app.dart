import 'package:flutter/material.dart';

import './all_pokemon.dart';
import './pokemon_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Demo',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => AllPokemonScreen());
          case 'detail':
            return MaterialPageRoute(
                builder: (_) => PokemonDetailScreen(
                    id: (settings.arguments as Map<String, String>)["id"]));
          default:
            return MaterialPageRoute(builder: (_) => Scaffold());
        }
      },
    );
  }
}
