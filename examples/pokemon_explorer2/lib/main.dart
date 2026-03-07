import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/pokemon_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final client = initClient();
  runApp(PokemonExplorerApp(client: client));
}
