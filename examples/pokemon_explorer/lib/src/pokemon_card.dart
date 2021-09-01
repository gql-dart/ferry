import 'package:flutter/material.dart';

import './graphql/__generated__/pokemon_card_fragment.data.gql.dart';

class PokemonCard extends StatelessWidget {
  final GPokemonCard pokemon;

  const PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed('detail', arguments: {'id': pokemon.id}),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Ink.image(image: NetworkImage(pokemon.avatar)),
                height: 200,
                width: 200,
              ),
              Text(
                pokemon.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'height: ${pokemon.height?.in_meter ?? 0}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                'weight: ${pokemon.weight?.in_kg ?? 0}',
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
