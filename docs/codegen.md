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

Ferry's generated classes are based on the [built_value](https://pub.dev/packages/built_value) package, which means they are:

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

To generate our classes, we first need to download our GraphQL in SDL format to any location within the `lib` project directory. You can use the [get-graphql-schema](https://github.com/prisma-labs/get-graphql-schema) tool to download a schema from a GraphQL endpoint:

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

Now that we've [downloaded our GraphQL schema](codegen.md#download-your-graphql-schema) and [saved our GraphQL Operations](codegen.md#create-graphql-files) to `.graphql` files, we're almost ready to run the generator. The final step is to add a configuration file so that [build_runner](https://pub.dev/packages/build_runner) knows which generators to run and where to find our schema.

Add a `build.yaml` file to your project root with the following contents, **replacing `your_package_name` and the path to your schema file** accordingly.

```yaml
targets:
  $default:
    builders:
      ferry_generator|graphql_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
      ferry_generator|serializer_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql

```

Note: By default, generated files are put into a directory called `__generated__`. 
If you like to rename this directory, pass 

```yaml
output_dir: '<your desired name>'
```

to options.
If you like to omit this directory at all and generate the code next to the .graphql files (this was the default behavior before release 0.11.0) ),
use 

```yaml
output_dir: ''
```


Now you can build your dart generated files by calling:

```sh
dart run build_runner build
```

Or, if you are using flutter

```sh
flutter pub run build_runner build
```

:::tip

You may need to add the `--delete-conflicting-outputs` flag to the build_runner command:

```sh
dart run build_runner build --delete-conflicting-outputs
```

:::

After running the generator, your directory should look something like this:

```bash
lib/
  src/
    components/
      graphql/
        all_pokemon.graphql
        __generated__
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

## Config

`ferry_generator|graphql_builder` supports additional configurations parameters, 
including:

`enum_fallbacks`: \[Map\] Specify fallback values to enum values in order to not break the serializer when
new enum values are added to the schema and the client has not updated to the new schema yet.

`global_enum_fallbacks`: \[bool\] Add a generated fallback value for each enum value (except for ones that have a custom fallback value specified in the enum_fallbacks map).
Defaults to false.

`when_extensions`: [Map\] whether to enable the `when`/`maybeWhen` extension on the generated data classes
from inline fragment spreads with type conditions.
Supported keys are `when` and `maybeWhen`, and the values are booleans indicating whether to enable
generation of the extension method not.
By default, both are disabled.

`tristate_optionals`: \[bool\] Whether to use tristate optionals for nullable variables and input types. A Value class is used to represent the three possible states: absence of a value, presence of a value that is null, and presence of a non-null value. This class is used by the generated code for GraphQL variables and input types that are nullable in order to distinguish between the absence of a value and the presence of a null value, typically used for "update" Mutations. Defaults to false.

`vars_create_factories`: \[bool\] Whether to generate an additional factory constructor for the variables class. In contrast to the `built_value` builders, this factory constructor respects nullability for it's parameters. Defaults to false.

`format`: \[bool\] Whether to allow formatting of the generated code. When set to false, adds `// dart format off` directive to the generated files. Defaults to true.

Example:

```yaml
  ferry_generator|graphql_builder:
    enabled: true
    options:
      schema: pokemon_explorer|lib/schema.graphql
      # enable when extensions for inline fragment spreads
      when_extensions:
        when: true
        maybeWhen: true
      global_enum_fallbacks: true # add a generated fallback value to all enums
      enum_fallbacks:
         MyEnumType: OTHER   # except for the type 'MyEnumType', use the value 'OTHER' as fallback there
      format: false  # disable dart formatting for generated code

```

## Multiple Schemas

You can specify multiple schema files by using `schemas` identifier

```yaml
targets:
  $default:
    builders:
      ferry_generator|graphql_builder:
        enabled: true
        options:
          schemas: 
            - your_package_name|lib/module1/schema.graphql
            - your_package_name|lib/module2/schema.graphql
      ferry_generator|serializer_builder:
        enabled: true
        options:
          schemas:
            - your_package_name|lib/module1/schema.graphql
            - your_package_name|lib/module2/schema.graphql
```

You also can specify additional schemas alongside main schema (`schema` identifier in `options`)

```yaml
targets:
  $default:
    builders:
      ferry_generator|graphql_builder:
        enabled: true
        options:
          schema: your_package_name|lib/main/schema.graphql
          schemas: 
            - your_package_name|lib/main/module1/schema.graphql
            - your_package_name|lib/main/module2/schema.graphql
      ferry_generator|serializer_builder:
        enabled: true
        options:
          schema: your_package_name|lib/main/schema.graphql
          schemas:
            - your_package_name|lib/main/module1/schema.graphql
            - your_package_name|lib/main/module2/schema.graphql
```

**schemas** scope/context is only the dir specified, for above example, `your_package_name|lib/main/module1/schema.graphql` scope/context is only `lib/main/module1/`.  Any query or mutation .graphql files in that dir is bounded by that schema only, for above example, any query or mutation .graphql files in `lib/main/module1/` is bounded by `lib/main/module1/schema.graphql` only, main schema and sibling schemas will be ignored.

main **schema** scope/context is all the dirs that have .graphql files excluding **schemas** dirs, for above example, `your_package_name|lib/main/schema.graphql` applies to all dirs that have .graphql files except `lib/main/module1/` and `lib/main/module2/`.

If you visualize schema dir path segments as a tree, main **schema** can be parent of **schemas**, for above example, that's the path segments `lib->main`, but **schemas** can only be different branches (they can not be parent of other schemas).

One use case for this is that main **schema** is apollo federation supergraph, while **schemas** can be subscriptions since apollo router doesn't support subscriptions as of now, May 2023.

Custom scalars will apply to all schemas, so you can't have unique scalar per individual schema.