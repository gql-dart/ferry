[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-forks-badge]][github-forks-link]
[![Discord][discord-badge]][discord-link]

[license-badge]: https://img.shields.io/github/license/gql-dart/ferry.svg?style=for-the-badge
[license-link]: https://github.com/gql-dart/ferry/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge
[prs-link]: https://github.com/gql-dart/ferry/issues

[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/ferry.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/ferry/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/ferry.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/ferry/stargazers
[github-forks-badge]: https://img.shields.io/github/forks/gql-dart/ferry.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-forks-link]: https://github.com/gql-dart/ferry/network/members

[discord-badge]: https://img.shields.io/discord/559455668810153989.svg?style=for-the-badge&logo=discord&logoColor=ffffff
[discord-link]: https://discord.gg/QRTfXE

A GraphQL client for Dart / Flutter.

This is the core `ferry` client package which routes `OperationRequest`s for a given GraphQL operation to the cache or network and returns streams of `OperationResponse`s for each request.

- [Usage](#usage)
  - [Setup Client](#setup-client)
    - [Simple](#simple)
    - [With HiveStore (persisted offline data)](#with-hivestore-persisted-offline-data)
    - [With UpdateCacheHandlers](#with-updatecachehandlers)
  - [Generate Dart GraphQL Files](#generate-dart-graphql-files)
    - [Download GraphQL Schema](#download-graphql-schema)
    - [Add Queries to `.graphql` files](#add-queries-to-graphql-files)
    - [Build Generated Queries](#build-generated-queries)
  - [Queries](#queries)
  - [Mutations](#mutations)
  - [With Flutter](#with-flutter)




# Usage

## Setup Client

Add `ferry` and `gql_http_link` to your pubspec dependencies. You will also need to add `ferry_generator` to your dev dependencies.

### Simple

```dart
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';

final link = HttpLink("[path/to/endpoint]");

final client = Client(link: link);
```

This instantiates a client with the default configuration, including a `Cache` instance that uses a `MemoryStore` to store data.

### With HiveStore (persisted offline data)

Add `hive` (and `hive_flutter` if you're using flutter) to your pubspec.

```dart
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive/hive.dart';
// *** If using flutter ***
// import 'package:hive_flutter/hive_flutter.dart';

Future<Client> initClient() async {
  Hive.init();
  // OR, if using flutter
  // await Hive.initFlutter();

  final box = await Hive.openBox("graphql");

  final store = HiveStore(box);

  final cache = Cache(dataStore: store);

  final link = HttpLink("[path/to/endpoint]");

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
```

### With UpdateCacheHandlers

The Client allows arbitrary cache updates following mutations, similar to functionality provided by Apollo Client's mutation `update` function. However, in order for mutations to work offline (still a WIP), the client must be aware of all `UpdateCacheHandlers`.

```dart
typedef UpdateCacheHandler<T> = void Function(
  CacheProxy proxy,
  OperationResponse<T> response,
);
```

`CacheProxy` provides methods to `readQuery`, `readFragment`, `writeQuery`, and `writeFragment`.

```dart
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';

import '[path/to/MyUpdateCacheHandler]';

final link = HttpLink("https://graphql-pokemon.now.sh/graphql");

final updateCacheHandlers = <dynamic, Function>{
  "MyHandlerKey": MyUpdateCacheHandler,
};

final options = ClientOptions(updateCacheHandlers: updateCacheHandlers);

final client = Client(
  link: link,
  options: options,
);
```

This handler can then be called using its key `"MyHandlerKey"` from a `OperationRequest`.

## Generate Dart GraphQL Files

The `Client` is fully typed, so we must use the `gql_build` package to generate dart representations of our GraphQL queries. We will also use the `req_builder` included in the `Client` package to build typed `OperationRequest`s for each GraphQL operation.

### Download GraphQL Schema

First, we need to downoad our GraphQL in SDL format to any location within the `lib` project directory. You can use the [get-graphql-schema](https://github.com/prisma-labs/get-graphql-schema) tool to download a schema from a GraphQL endpoint:

First, install the tool:

```sh
npm install -g get-graphql-schema
```

Next, download the schema:

```sh
get-graphql-schema ENDPOINT_URL > lib/schema.graphql
```

### Add Queries to `.graphql` files

`gql_build` will generate dart code for all files located in the `lib` folder that end in a `.graphql` extention.

For example, we might have the following in `all_pokemon.graphql`:

```graphql
query AllPokemon($first: Int!) {
  pokemons(first: $first) {
    id
    name
    maxHP
    image
  }
}
```

### Build Generated Queries

Add `gql_build` and `build_runner` to your `dev_dependencies` in your pubspec file.

Next add a `build.yaml` file to your project root:

```yaml
targets:
  $default:
    builders:
      gql_build|schema_builder:
        enabled: true
      gql_build|ast_builder:
        enabled: true
      gql_build|op_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
      gql_build|data_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
      gql_build|var_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql

      ferry_generator|req_builder:
        enabled: true
```

Now we can build our dart generated files by calling:

```sh
pub run build_runner build
```

Or, if we are using flutter

```sh
flutter pub run build_runner build
```

## Queries

```dart
import 'path/to/client.dart';
import './[my_query].req.gql.dart';

// Instantiate a `OperationRequest` using the generated `.req.gql.dart` file.
final query = MyQuery(buildVars: (b) => b..id = "123");

// Listen to responses for the given query
client.responseStream(query).listen((response) => print(response));
```

## Mutations

Mutations are executed in the same way as queries

```dart
import 'path/to/client.dart';
import './[my_mutation].req.gql.dart';

// Instantiate an `OperationRequest` using the generated `.req.gql.dart` file.
final mutation = MyMutation(buildVars: (b) => b..id = "123");

// If I only care about the first non-optimistic response, I can do:
client
  .responseStream(mutation)
  .firstWhere((response) => response.source != ResponseSource.Optimistic)
  .then((response) => print(response));
```

## With Flutter

The library includes a `Query` flutter widget, which is a simple wrapper around the `StreamBuilder` widget.

This example assumes we've registered our `Client` instance with `get_it`, but you can use any dependency injection.

```dart
import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';

import './my_query.data.gql.dart';
import './my_query.req.gql.dart';

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
        operationRequest: AllPokemon(
          buildVars: (vars) => vars..first = 500,
        ),
        builder: (
          BuildContext context,
          OperationResponse<$AllPokemon> response,
        ) {
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
```

[license-badge]: https://img.shields.io/github/license/gql-dart/ferry.svg?style=flat-square
[license-link]: https://github.com/gql-dart/ferry/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square
[prs-link]: http://makeapullrequest.com
[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/ferry.svg?style=flat-square&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/ferry/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/ferry.svg?style=flat-square&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/ferry/stargazers
[pub-badge]: https://img.shields.io/pub/v/ferry?logo=dart
[pub-link]: https://pub.dev/packages/ferry
