

// ignore_for_file: prefer_single_quotes

import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.data.gql.dart';
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.req.gql.dart';
import 'package:test/test.dart';

final optimistic = GAllPokemonData((b) => b
  ..pokemons.results.add(GAllPokemonData_pokemons_results((b) => b
    ..id = 1
    ..name = "optimisitc"
    ..avatar = ""
    ..height.in_meter = "123"
    ..weight.in_kg = "345")));

void main() {
  test("can remove optimistic entries", () async {
    final client = Client(link: _FakeLink());

    final res = await client
        .request(GAllPokemonReq((b) => b
      ..optimisticResponse = optimistic.toBuilder()
      ..vars.offset = 0
      ..vars.limit = 100))
        .first;

    print(res.linkException);

    expect(res.dataSource, DataSource.Optimistic);

    await Future.delayed(Duration.zero);

    expect(client.cache.optimisticPatchesStream.value, isEmpty);
  });

  test("can remove optimistic entries when listen", () async {
    final client = Client(link: _FakeLink());

    final completer = Completer();

    client
        .request(GAllPokemonReq((b) => b
      ..optimisticResponse = optimistic.toBuilder()
      ..vars.offset = 0
      ..vars.limit = 100))
        .listen((res) async {
      expect(client.cache.optimisticPatchesStream.value,
          res.dataSource == DataSource.Optimistic ? isNotEmpty : isEmpty);

      if (res.dataSource == DataSource.Link) {
        completer.complete();
      }
    });

    await completer.future;
  });



}

class _FakeLink extends Link {
  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final data = GAllPokemonData((b) => b
      ..pokemons.results.add(GAllPokemonData_pokemons_results((b) => b
        ..id = 1
        ..name = "Pikachu"
        ..avatar = ""
        ..height.in_meter = "123"
        ..weight.in_kg = "345"))).toJson();

    await Future.delayed(Duration.zero);


    yield Response(response: const {}, data: data);
  }
}
