---
id: migration-generator2
title: Migrate to Generator 2
sidebar_label: Migrate to v2
---

This guide helps you migrate from `ferry_generator` (built_value models) to `ferry_generator2` (plain Dart models).

Generator 2 does **not** try to keep API parity with built_value, so expect some changes in code and config.

## At a glance

- **No built_value**: plain Dart classes with `const` constructors.
- **No serializers**: use `toJson()` / `fromJson()` directly.
- **Collections**: `List`/`Map` instead of `BuiltList`/`BuiltMap`.
- **Sealed polymorphism**: unions/interfaces generate sealed bases with an `__unknown` variant.
- **Optional `copyWith/==/hashCode/toString`**: opt in via config.

## 1) Dependencies

Remove built_value packages and the old generator:

```yaml
dev_dependencies:
  # remove
  # ferry_generator:
  # built_value:
  # built_collection:
```

Add generator 2 and build_runner:

```yaml
dev_dependencies:
  build_runner: ^2.0.0
  ferry_generator2: ^0.1.0-dev.0

dependencies:
  ferry: ^<latest>
  ferry_exec: ^<latest>
  gql: ^<latest>
  # Only if you enable vars.tristate_optionals
  gql_tristate_value: ^1.0.0
```

## 2) build.yaml changes

Old (generator 1):

```yaml
targets:
  $default:
    builders:
      ferry_generator|graphql_builder:
        options:
          schema: your_pkg|lib/schema.graphql
          tristate_optionals: false
          data_class_config:
            reuse_fragments: true
          data_to_json: type_safe
          type_overrides:
            Date:
              name: DateTime
      ferry_generator|serializer_builder:
        options:
          schema: your_pkg|lib/schema.graphql
          custom_serializers:
            - import: package:your_pkg/date_serializer.dart
              name: DateSerializer
```

New (generator 2):

```yaml
targets:
  $default:
    builders:
      ferry_generator2|graphql_builder:
        options:
          schema:
            file: your_pkg|lib/graphql/schema.graphql
            add_typenames: true
          outputs:
            ast: true
            data: true
            vars: true
            req: true
            schema: true
          data_classes:
            reuse_fragments: true
            when_extensions:
              when: false
              maybe_when: false
            utils:
              copy_with: false
              equals: false
              hash_code: false
              to_string: false
          vars:
            tristate_optionals: false
          enums:
            fallback:
              global: false
              name: gUnknownEnumValue
          scalars:
            Date:
              type: DateTime
```

Notes:
- `serializer_builder` is gone.
- `type_overrides` is replaced by `scalars` (per-scalar mapping + optional `from_json`/`to_json`).
- `data_to_json` is not configurable in v2; it is type-safe by default.
- `data_classes.reuse_fragments` defaults to `true` in v2 (v1 defaulted to `false`).

### Config key mapping

- `schema: your_pkg|path` -> `schema.file: your_pkg|path`
- `tristate_optionals` -> `vars.tristate_optionals`
- `data_class_config.reuse_fragments` -> `data_classes.reuse_fragments`
- `when_extensions` -> `data_classes.when_extensions`
- `type_overrides` -> `scalars` (`type`, plus optional `import`, `from_json`, `to_json`)
- `custom_serializers` -> per-scalar `from_json`/`to_json` (no global serializer list)
- `vars_create_factories` -> removed
- `global_enum_fallbacks` / `global_enum_fallback_name` -> `enums.fallback.global` / `enums.fallback.name`
- `enum_fallbacks` -> `enums.fallback.per_enum`

## 3) Model construction (builders -> constructors)

Old (built_value):

```dart
final req = GAllPokemonReq((b) => b
  ..vars.first = 20
  ..fetchPolicy = FetchPolicy.CacheAndNetwork);

final data = GAllPokemonData((b) => b
  ..pokemons.add(GAllPokemonData_pokemons((b) => b
    ..id = '1'
    ..name = 'Bulbasaur')));
```

New (plain Dart):

```dart
final req = GAllPokemonReq(
  vars: GAllPokemonVars(first: 20),
  fetchPolicy: FetchPolicy.CacheAndNetwork,
);

final data = GAllPokemonData(
  pokemons: [
    GAllPokemonData_pokemons(id: '1', name: 'Bulbasaur'),
  ],
  G__typename: 'Query',
);
```

When you construct data objects manually, `G__typename` is required on most classes.
If you only use `fromJson`, it will be filled in for you.

## 4) Copying data (rebuild -> copyWith)

Old:

```dart
final updated = data.rebuild((b) => b..name = 'Ivysaur');
```

New (enable `data_classes.utils.copy_with: true`):

```dart
final updated = data.copyWith(name: 'Ivysaur');
```

`copyWith` is **shallow**. For nested updates:

```dart
final updated = data.copyWith(
  pokemons: data.pokemons
      .map((p) => p.copyWith(name: 'Ivysaur'))
      .toList(),
);
```

## 5) Collections (BuiltList/BuiltMap -> List/Map)

Old:

```dart
final names = data.pokemons?.map((p) => p?.name).toBuiltList();
```

New:

```dart
final names = data.pokemons.map((p) => p.name).toList();
```

## 6) Serialization (Serializers -> toJson/fromJson)

Old:

```dart
final json = serializers.serializeWith(GAllPokemonData.serializer, data);
final data2 = serializers.deserializeWith(GAllPokemonData.serializer, json);
```

New:

```dart
final json = data.toJson();
final data2 = GAllPokemonData.fromJson(json);
```

Custom scalars:

```yaml
scalars:
  Date:
    type: DateTime
    import: package:your_pkg/date.dart
    from_json: dateFromJson
    to_json: dateToJson
```

## 7) Optional variables (tristate)

With `vars.tristate_optionals: true`, nullable inputs use `Value<T>` from `gql_tristate_value`:

```dart
const vars = GUpdateUserVars(
  email: const Value.absent(), // omit entirely
  name: const Value.present('Ada'),    // send value
  nickname: const Value.present(null), // send null
);
```

## 8) Unions / interfaces (sealed + __unknown)

Generator 2 emits sealed bases and concrete subclasses, plus an `__unknown` fallback.

If you enable `data_classes.when_extensions`, you get `when`/`maybeWhen` helpers.
Otherwise, switch on `G__typename` or use `is` checks.

## 9) Requests and documents

`Req` classes are plain Dart and hold an `Operation` that references the generated AST constants.
If an operation has **no variables**, the request type is `OperationRequest<Data, Null>` and no `.var.gql.dart` file is emitted.

## 10) Migration checklist

- Replace `ferry_generator` with `ferry_generator2` in `build.yaml`.
- Remove `serializer_builder` and built_value dependencies.
- Update scalar mappings to `scalars:` with `from_json`/`to_json` if needed.
- Rewrite builder-style constructions to constructors or `copyWith`.
- Update any serializer calls to use `toJson()` / `fromJson()`.
- Replace `BuiltList`/`BuiltMap` usage with `List`/`Map`.

## Need examples?

For working v2 outputs and tests, see:
- `packages/ferry_generator2_end_to_end`
- `examples/pokemon_explorer2` (if present in your branch)
