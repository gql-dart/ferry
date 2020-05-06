import 'dart:typed_data';
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import "package:flutter_test/flutter_test.dart";
import "package:ferry/ferry.dart";
import 'package:hive/hive.dart';

import './graphql/all_pokemon.req.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  group("Cache write read tests", () {
    test("check cach write", () async {
      var box = await Hive.openBox('graphqlBoxTests', bytes: Uint8List(0));

      await box.clear();
      var store = HiveStore(box);

      final cache = Cache(dataStore: store);

      final req1 = AllPokemon(
        queryId: "123",
        buildVars: (b) => b..first = 3,
      );

      CacheProxy proxy = CacheProxy(cache, false, '123');

      proxy.writeQuery(req1, {'id': 1});

      expect(
          proxy.readQuery(req1),
          equals({
            'pokemons': {'id': 1}
          }));
    });
  });
}
