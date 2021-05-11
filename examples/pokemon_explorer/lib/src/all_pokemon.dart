import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:built_collection/built_collection.dart';

import './graphql/all_pokemon.data.gql.dart';
import './graphql/all_pokemon.req.gql.dart';
import './graphql/all_pokemon.var.gql.dart';
import './pokemon_card.dart';

class AllPokemonScreen extends StatelessWidget {
  final client = GetIt.I<Client>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Pokemon'),
      ),
      body: Operation<GAllPokemonData, GAllPokemonVars>(
        client: client,
        operationRequest: GAllPokemonReq(
          (b) => b
            ..vars.limit = 50
            ..vars.offset = 0,
        ),
        builder: (context, response, error) {
          if (response!.loading)
            return Center(child: CircularProgressIndicator());

          final pokemons = response.data?.pokemons?.results ?? BuiltList();

          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) => PokemonCard(
              pokemon: pokemons[index],
            ),
          );
        },
      ),
    );
  }
}
