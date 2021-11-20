---
id: structuring-queries
title: Structuring Queries
---

Since Flutter is built around the principle of Widget composition, it's common to have data spread across many nested widgets. For example, let's say we want to have a `PokemonList` Widget that displays a list of `PokemonCard` Widgets.

Our Widget tree might look like this:

```
MaterialApp
  PokemonList
    PokemonCard
    PokemonCard
    PokemonCard
```

Our first impulse might be to write a Query like this one:

```graphql
query AllPokemon {
  pokemons {
    id
    name
    avatar
  }
}
```

And use it in the following Widgets:

```dart
import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:built_collection/built_collection.dart';

import './graphql/all_pokemon.data.gql.dart';
import './graphql/all_pokemon.req.gql.dart';
import './graphql/all_pokemon.var.gql.dart';

class PokemonList extends StatelessWidget {
  final client = GetIt.I<Client>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon List'),
      ),
      body: Operation<GAllPokemonData, GAllPokemonVars>(
        client: client,
        operationRequest: GAllPokemonReq(),
        builder: (context, response, error) {
          if (response!.loading)
            return Center(child: CircularProgressIndicator());

          final pokemons = response.data?.pokemons? ?? BuiltList();

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

class PokemonCard extends StatelessWidget {
  final GAllPokemonData_pokemons pokemon;

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
            ],
          ),
        ),
      ),
    );
  }
}
```

While this works, it tightly couples our `PokemonList` and `PokemonCard` Widgets which causes several disadvantages:

1. Our `PokemonCard` Widget can't be reused with data from other GraphQL Operations since it has an explicit dependency on the `GAllPokemonData_pokemons` type.
2. Our `AllPokemon` Query must keep track of the data requirements not only for our `PokemonList` itself (in which the query is executed), but also for all child Widgets (i.e. `PokemonCard`).

## Colocation of Widgets and Data Requirements

A common pattern to overcome these issues is to _colocate_ Widgets and their data requirements. In other words, each Widget should have a corresponding GraphQL definition that specifies only the data needed for that Widget.

A naive implementation of this (don't do this) might be to:

1. Request only the `id` field in our `AllPokemon` Query
2. Pass the `id` to the `PokemonCard`
3. Execute a `GetPokemon` Query in our `PokemonCard` that fetches the data only for that Pokemon

However, this would result in a seperate network request (and subsequent database query) for each Pokemon in the list. Not very efficient.

Instead, we can extract our `PokemonCard`'s data requirements into a Fragment:

```graphql
fragment PokemonCardFragment on Pokemon {
  id
  name
  avatar
}
```

```graphql
# import './pokemon_card_fragment.graphql'

query AllPokemon {
  pokemons {
    ...PokemonCardFragment
  }
}
```

Now our `PokemonCard` can depend on the `GPokemonCardFragment` type.

```dart {2}
import 'package:flutter/material.dart';
import './graphql/pokemon_card_fragment.data.gql.dart';

class PokemonCard extends StatelessWidget {
  final GPokemonCardFragment pokemon;

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
            ],
          ),
        ),
      ),
    );
  }
}
```

This means the `PokemonCard` Widget can be reused anywhere the `PokemonCardFragment` is used. It also means that if our data requirements for `PokemonCard` change (say, if we need to add a `height` property), we only need to update our `PokemonCardFragment`. Our `AllPokemon` Query and any other operations that use `PokemonCardFragment` don't need to be updated.

This pattern leads to code that is easier to maintain, test, and reason about.

## Fragments on Root Query

The above pattern works even if your data requriements for a single screen include multiple GraphQL queries since you can include Fragments on any GraphQL type, including the root `Query` type.

For example, let's say you want to add a user avatar Widget to the header of your `PokemonListScreen` that shows the currently logged-in user.

```
MaterialApp
  PokemonListScreen
    UserAvatar
    PokemonList
      PokemonCard
      PokemonCard
      PokemonCard
```

You might structure your queries like so:

```graphql
fragment PokemonCardFragment on Pokemon {
  id
  name
  avatar
}

fragment PokemonListFragment on Query {
  pokemons {
    ...PokemonCardFragment
  }
}

fragment UserAvatarFragment on Query {
  user(id: $userId) {
    id
    avatar
  }
}

query PokemonListScreenQuery($userId: ID!) {
  ...PokemonListFragment
  ...UserAvatarFragment
}
```

Even though you are fetching data from two different root queries (`pokemons` and `user`), you can use a single `Operation` Widget which will make a single network request for the `PokemonListScreen`.
