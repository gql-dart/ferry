# pokemon_explorer2

Pokemon explorer example using Ferry and `ferry_generator2` against the
PokeAPI GraphQL endpoint at https://graphql.pokeapi.co/v1beta2.

## Setup

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Schema refresh

```sh
npx --yes get-graphql-schema https://graphql.pokeapi.co/v1beta2 > lib/graphql/schema.graphql
```
