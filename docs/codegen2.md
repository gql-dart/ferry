---
id: codegen2
title: Generate GraphQL Classes (Generator 2)
sidebar_label: Generate Classes (v2)
---

Ferry Generator 2 is the next-gen code generator focused on **small output**, **fast builds**, and **plain Dart classes** (no `built_value`). It's designed to be easy to read, fast to compile, and friendly to tree-shaking and runtime performance.

Migrating from the original generator? See [Migrate to Generator 2](migration-generator2).

## Motivation

Generator 2 exists because the original generator optimized for `built_value`-based models and serializers. That approach is stable, but it produces a lot of boilerplate. Generator 2 targets:

- **Smaller generated code** (no builders, no serializers)
- **Plain Dart models** with `const` constructors and simple `toJson`/`fromJson`
- **Sealed unions/interfaces** with an `__unknown` fallback variant
- **Predictable fragment reuse** across operations
- **Configurable `copyWith`, `==`, `hashCode`, `toString`**

> Generator 2 is experimental. If you depend on `built_value` features, use the existing generator (`ferry_generator`) instead.

## Quick Start

### 1) Add dependencies

In your app package, add these:

```yaml
# pubspec.yaml

dependencies:
  ferry: ^<latest>
  ferry_exec: ^<latest>
  gql: ^<latest>

# Only needed if you enable vars.tristate_optionals
  gql_tristate_value: ^1.0.0

# dev_dependencies
  build_runner: ^2.0.0
  ferry_generator2: ^0.1.0-dev.0
```

> `ferry_exec` provides `OperationRequest`, which the generated `Req` classes extend.

### 2) Download your schema (SDL)

```sh
npx get-graphql-schema [ENDPOINT_URL] > lib/graphql/schema.graphql
```

### 3) Create `.graphql` files

Place your operations and fragments under `lib/` (any subdirectory is fine). You can import other `.graphql` files with comment imports:

```graphql
# import './fragments/hero.graphql'
```

### 4) Add `build.yaml`

```yaml
targets:
  $default:
    builders:
      ferry_generator2|graphql_builder:
        options:
          schema:
            file: your_package|lib/graphql/schema.graphql
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
              when: true
              maybe_when: true
            utils:
              copy_with: true
              equals: true
              hash_code: true
              to_string: true
          vars:
            tristate_optionals: true
          enums:
            fallback:
              global: true
              name: gUnknownEnumValue
          scalars:
            Date:
              type: CustomDate
              import: package:your_package/custom/date.dart
              from_json: customDateFromJson
              to_json: customDateToJson
```

### 5) Run build_runner

```sh
dart run build_runner build --delete-conflicting-outputs
```

> To see full logging output, run build_runner with `--verbose`.

## What gets generated

For each `.graphql` input, generator 2 can emit:

- `*.ast.gql.dart` - `const` AST definitions (`DocumentNode` definitions).
- `*.data.gql.dart` - Data classes for operations and fragments.
- `*.var.gql.dart` - Variables classes (omitted if there are no vars).
- `*.req.gql.dart` - Request classes extending `OperationRequest`.
- `*.schema.gql.dart` - Dart representations of schema enums, inputs, and possible-types.
- `*.utils.gql.dart` - Equality/hash helpers (only when enabled).

**Notes**
- If an operation has **no variables**, no `*.var.gql.dart` is emitted and the request type is `OperationRequest<Data, Null>`.
- `req` output **depends on** `ast` output (the request's `DocumentNode` references AST constants).

## Polymorphism (interfaces & unions)

Generator 2 emits **sealed base classes** for interface/union selections and concrete subclasses for each concrete type, plus an `__unknown` variant. Example structure:

- `GSearchData_search` (sealed base)
- `GSearchData_search__asHuman`
- `GSearchData_search__asDroid`
- `GSearchData_search__unknown`

Optional `when`/`maybeWhen` extensions are available for ergonomic pattern matching (enable under `data_classes.when_extensions`).

## Fragment reuse (and dedupe)

- If a selection set is **only a fragment spread** (plus `__typename`), generator 2 reuses the fragment class instead of creating a nested duplicate.
- This ensures **the same fragment used in multiple operations maps to a single class**.
- You can disable this with `data_classes.reuse_fragments: false`.

Transitive fragment interface inheritance only applies to **unconditional fragment spreads**.

## Config Reference

Top-level options:

### `schema`
- `file` (required): `package|path/to/schema.graphql`
- `add_typenames` (default `true`): required for polymorphic selections and when-extensions
- `generate_possible_types_map` (default `true`): controls possibleTypes generation in schema output
- `output_dir` (default `__generated__`)
- `source_extension` (default `.graphql`)

**Multiple schemas are not supported.** `schema.files` will throw.

### `outputs`
- `ast`, `data`, `vars`, `req`, `schema` (all default `true`)
  - `req` requires `ast`, `data`, and `vars` to be enabled.

### `data_classes`
- `reuse_fragments` (default `true`)
- `when_extensions`:
  - `when` (default `false`)
  - `maybe_when` (default `false`)
- `utils`:
  - `copy_with` (default `false`)
  - `equals` (default `false`)
  - `hash_code` (default `false`)
  - `to_string` (default `false`)

### `collections`
Choose how list/map fields are represented:

```yaml
collections:
  mode: plain # or unmodifiable
```

- `plain` (default): standard `List`/`Map` types.
- `unmodifiable`: wraps generated list/map fields with
  `List.unmodifiable` / `Map.unmodifiable` in constructors and `fromJson`.

### `vars`
- `tristate_optionals` (default `false`)
  - When enabled, nullable inputs/vars are wrapped in `Value<T>` from `gql_tristate_value`.

### `docs`
- `enabled` (default `false`): emit doc comments from GraphQL schema descriptions.

### `enums`
- `fallback`:
  - `global` (default `false`) - generate a fallback value for all enums
  - `name` (default `gUnknownEnumValue`)
  - `per_enum` - map of enum name to fallback value

### `scalars`
Define scalar mappings and custom serializers:

```yaml
scalars:
  Date:
    type: CustomDate
    import: package:your_package/custom/date.dart
    from_json: customDateFromJson
    to_json: customDateToJson
  Json:
    type: 'Map<String, dynamic>'
```

### `formatting`
- `enabled` (default `true`)
- `language_version` (optional, e.g. `3.6`)
- `emit_format_off` (default `false`): add `// dart format off` to generated files (still formats once if `enabled: true`).

### `logging`
- `level` (default `warn`): `off | error | warn | info | debug | verbose`
  - `verbose` is an alias for `debug`.
- `format` (default `text`): `text | json`
- `categories` (default empty = all): list of categories to include for info/debug logs  
  Available: `config`, `validation`, `schema`, `ir`, `data`, `vars`, `req`, `emit`, `build`

Example:
```yaml
logging:
  level: verbose
  format: json
  categories: [schema, validation, ir, emit]
```

## Migration notes (v1 -> v2)

- No `built_value`, no builders, no `serializer_builder`.
- All models are plain Dart classes with `const` constructors and direct `toJson`/`fromJson`.
- Equality/hash/toString/copyWith are **opt-in**.
- `schema.files` is **not supported**.
