import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_explorer/src/flush.dart';

import 'pokemon_list.dart';
import './pokemon_detail.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Demo',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => PokemonListScreen());
          case 'detail':
            return MaterialPageRoute(
                builder: (_) => PokemonDetailScreen(
                    id: (settings.arguments as Map)["id"]!));
          default:
            return MaterialPageRoute(builder: (_) => const Scaffold());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('AppLifecycleState: $state');
    if (state == AppLifecycleState.hidden) {
      GetIt.I<Flush>().flush();
    }
  }
}
