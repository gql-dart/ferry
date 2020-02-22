import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';

import './graphql/all_pokemon.data.gql.dart';
import './graphql/all_pokemon.req.gql.dart';
import './pokemon_card.dart';

class AllPokemonScreen extends StatelessWidget {
  final client = GetIt.I<Client>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Pokemon'),
      ),
      body: Query(
        client: client,
        queryRequest: AllPokemon(
          buildVars: (vars) => vars..first = 500,
        ),
        builder: (BuildContext context, QueryResponse<$AllPokemon> response) {
          if (response.loading)
            return Center(child: CircularProgressIndicator());

          final pokemons = response.data?.pokemons ?? [];

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
