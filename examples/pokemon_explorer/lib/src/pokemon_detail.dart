import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

import './graphql/__generated__/pokemon_detail.data.gql.dart';
import './graphql/__generated__/pokemon_detail.req.gql.dart';
import './graphql/__generated__/pokemon_detail.var.gql.dart';
import './pokemon_card.dart';

class PokemonDetailScreen extends StatelessWidget {
  final client = GetIt.I<Client>();

  final int id;

  PokemonDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Operation<GPokemonDetailData, GPokemonDetailVars>(
      client: client,
      operationRequest: GPokemonDetailReq(
        (b) => b..vars.id = id.toString(),
      ),
      builder: (
        context,
        response,
        error,
      ) {
        if (response!.loading)
          return Scaffold(
              appBar: AppBar(),
              body: Center(child: CircularProgressIndicator()));

        final pokemon = response.data?.pokemon;

        return Scaffold(
          appBar: AppBar(title: Text(pokemon?.name ?? '')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (pokemon != null)
                PokemonCard(
                  pokemon: pokemon,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                'Height',
                style: Theme.of(context).textTheme.headline6,
              ),
              if (pokemon != null) Text('${pokemon.height?.in_meter ?? 0}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                'Weight',
                style: Theme.of(context).textTheme.headline6,
              ),
              if (pokemon != null) Text('${pokemon.weight?.in_kg ?? 0}'),
            ],
          ),
        );
      },
    );
  }
}
