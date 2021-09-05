---
id: codegen
title: Generate GraphQL Classes
sidebar_label: Generate Classes
---

Ferry generates immutable data classes for all of your GraphQL Operations and Fragments. This saves time, improves the developer experience, and eliminates potential runtime errors.

## How it works

Let's say I've created an `all_pokemon.graphql` file with the following query:

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

When I run the generator, Ferry will create the following classes:

1. `GAllPokemonReq`: This class extends `OperationRequest` and includes the GraphQL document and variables for this query. It also includes other necessary configuration to adjust how this operation is executed (e.g. `FetchPolicy`).
2. `GAllPokemonVars`: This class includes any variables used in the query (just "first", in this case)
3. `GAllPokemonData`: This class represents the data returned by the query, including the "pokemons" field and all child fields.

In addition, Ferry will generate any necessary supporting classes from your GraphQL schema, including `input` types, `enum`s, and custom `scalars`.

:::important

Ferry's generated classes are based on the `built_value` package, which means they are:

1. **immutable**: once they are created, they cannot be changed.
2. **equatable**: multiple instances with identical values have `==` equality.
3. **serializable**: can be serialized using the `toJson()` and `fromJson()` methods.
4. **use the builder pattern**: can be deeply copied with modifications using the Builder Pattern.

Check out [this post](https://medium.com/dartlang/darts-built-value-for-immutable-object-models-83e2497922d4) for more information on `built_value` classes and how to use them.
:::

:::note

As you can see, Ferry prepends `"G"` to all class names. This is due to a limitation in the `built_value` package and is necessary to ensure classes get generated correctly.

:::

## Download Your GraphQL Schema

To generate our classes, we first need to downoad our GraphQL in SDL format to any location within the `lib` project directory. You can use the [get-graphql-schema](https://github.com/prisma-labs/get-graphql-schema) tool to download a schema from a GraphQL endpoint:

First, install the tool:

```sh
npm install -g get-graphql-schema
```

Next, download the schema by running the following command, replacing `[ENDPOINT_URL]` with the url of your GraphQL endpoint:

```sh
get-graphql-schema [ENDPOINT_URL] > lib/schema.graphql
```

## Create `.graphql` Files

As shown in the example above, we need to save all of our GraphQL operations to files that end with the `.graphql` extension.

The generated files are created as siblings to the `.graphql` file. To reduce clutter, we recommend placing your `.graphql` files in a `/graphql` subdirectory. For example, if I have an `AllPokemon` widget that will use the `AllPokemon` query from above, I might use the following directory structure:

```bash
lib/
  src/
    components/
      graphql/
        ### Generated files will go here
        all_pokemon.graphql
      all_pokemon.dart
```

:::caution

Make sure that all `.graphql` files are located in the `lib` directory (or a subdirectory). The generator cannot read files located outside of `lib`.

:::

See the [examples](https://github.com/gql-dart/ferry/tree/master/examples) for more detail.

### Importing from other `.graphql` files

If your operations have dependencies in other `.graphql` files, you can import them by adding a _comment import_ statement at the top of your `.graphql` file.

```graphql
# import './pokemon_card_fragment.graphql'
```

## Build Generated Classes

Now that we've [downloaded our GraphQL schema](codegen.md#download-your-graphql-schema) and [saved our GraphQL Operations](codegen.md#create-graphql-files) to `.graphql` files, we're almost ready to run the generator. The final step is to add a configuration file so that `built_runner` knows which generators to run and where to find our schema.

Add a `build.yaml` file to your project root with the following contents, **replacing `your_package_name` and the path to your schema file** accordingly.

```yaml
targets:
  $default:
    builders:
      gql_build|schema_builder:
        enabled: true
      gql_build|ast_builder:
        enabled: true
      gql_build|data_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
      gql_build|var_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
      gql_build|serializer_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql

      ferry_generator|req_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
```

Now you can build your dart generated files by calling:

```sh
pub run build_runner build
```

Or, if you are using flutter

```sh
flutter pub run build_runner build
```

:::tip

You may need to add the `--delete-conflicting-outputs` flag to the build_runner command:

```sh
pub run build_runner build --delete-conflicting-outputs
```

:::

After running the generator, your directory should look something like this:

```bash
lib/
  src/
    components/
      graphql/
        all_pokemon.graphql
        all_pokemon.ast.gql.dart # generated
        all_pokemon.data.gql.dart # generated
        all_pokemon.data.gql.g.dart # generated
        all_pokemon.req.gql.dart # generated
        all_pokemon.req.gql.g.dart # generated
        all_pokemon.var.gql.dart # generated
        all_pokemon.var.gql.g.dart # generated
      all_pokemon.dart
```

:::tip

You may want to configure your IDE to hide the generated files, since it can get unwieldy, even if you're placing your `.graphql` files in a subdirectory.

If you use VSCode, you can include the following in your `/.vscode/settings.json` file:

```json
{
  "files.exclude": {
    "**/*.ast.gql.dart": true,
    "**/*.req.gql.dart": true,
    "**/*.data.gql.dart": true,
    "**/*.var.gql.dart": true,
    "**/*.gql.g.dart": true
  }
}
```

:::
