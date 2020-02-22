import 'package:flutter/material.dart';

import './graphql/pokemon_card_fragment.data.gql.dart';

class PokemonCard extends StatelessWidget {
  final $PokemonCard pokemon;

  const PokemonCard({this.pokemon});

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
                child: Ink.image(image: NetworkImage(pokemon.image)),
                height: 200,
                width: 200,
              ),
              Text(pokemon.name, style: Theme.of(context).textTheme.title),
              Text('HP: ${pokemon.maxHP}',
                  style: Theme.of(context).textTheme.subhead)
            ],
          ),
        ),
      ),
    );
  }
}
