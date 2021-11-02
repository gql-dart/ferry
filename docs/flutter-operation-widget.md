---
id: flutter-operation-widget
title: Operation Widget
---

Since the entire Ferry architecture is built around native Dart Streams, the `Operation` Widget is just a simple wrapper around the Flutter `StreamBuilder` Widget.

This example assumes we've registered our `Client` instance with [`get_it`](https://pub.dev/packages/get_it), but you can use any dependency injection method.

```dart
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
      body: Operation(
        client: client,
        operationRequest: GAllPokemonReq((b) => b..vars.first = 50),
        builder: (
          BuildContext context,
          OperationResponse<GAllPokemonData, GAllPokemonVars> response,
          Object error,
        ) {
          if (response.loading)
            return Center(child: CircularProgressIndicator());

          final pokemons = response.data?.queryPokemon ?? BuiltList();

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
```

## Usage with Mutations

While you can use the `Operation` widget with any GraphQL operation, including Mutations, you probably don't need to use the widget.

It's often easier to just execute the Mutation directly:

```dart
final createReviewReq = GCreateReviewReq(
  (b) => b
    ..vars.review.stars = 5
    ..vars.review.commentary = "Amazing!!!",
);

final result = await client
  .request(createReviewReq)
  .firstWhere((response) => response.dataSource != DataSource.Optimistic);
```

However, sometimes we may want to show the result of calling a mutation in our Flutter UI. In that case, we can still use the `Operation` Widget, but we probably don't want the mutation to run immediately when the Widget loads. To tell Ferry _not_ to execute the mutation immediately, we can set `executeOnListen = false` on our request.

```dart
final createReviewReq = GCreateReviewReq(
  (b) => b
    ..executeOnListen = false
    ..vars.review.stars = 5
    ..vars.review.commentary = "Amazing!!!",
);
```

Now we can use this request in our `Operation` Widget just as we did with our `AllPokemon` Query above. When we are ready to execute our mutation, we simply add it to the `Client.requestController`.

```dart
client.requestController.add(createReviewReq);
```
