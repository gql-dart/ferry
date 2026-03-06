# ferry_generator2

Next-gen GraphQL code generator for Ferry. It produces **plain Dart classes**
(no `built_value`), with **small output** and fast builds. Generator 2 focuses
on predictable, readable output and strong correctness checks.

This package is used via `build_runner` and a `build.yaml` config.

## What it does

- Generates:
  - `*.ast.gql.dart` (GraphQL AST constants)
  - `*.data.gql.dart` (response/data models)
  - `*.var.gql.dart` (variables models)
  - `*.req.gql.dart` (request classes)
  - `*.schema.gql.dart` (schema enums, input objects, possible types map)
  - `*.utils.gql.dart` (shared equality/hash helpers when enabled)
- Supports:
  - Interfaces/unions with sealed class hierarchies and `__typename`
  - Fragment reuse and explicit fragment spreads
  - Inline fragments and type conditions
  - Tri-state variables via `gql_tristate_value`
  - Scalar overrides (type + import + from/to JSON hooks)
  - Enum fallback values (global or per-enum)
  - Optional `copyWith`, `==`, `hashCode`, `toString`, `when`/`maybeWhen`

## Quick start

1) Add dev dependencies:

```yaml
dev_dependencies:
  build_runner: any
  ferry_generator2:
    path: ../ferry_generator2
```

2) Add a `build.yaml`:

```yaml
targets:
  $default:
    sources:
      - $package$
      - lib/**
    builders:
      ferry_generator2|graphql_builder:
        options:
          schema:
            file: your_package|lib/graphql/schema.graphql
            add_typenames: true
          vars:
            tristate_optionals: true
          data_classes:
            when_extensions:
              when: true
              maybe_when: true
            utils:
              copy_with: true
              equals: true
              hash_code: true
              to_string: true
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
            Json:
              type: 'Map<String, dynamic>'
          formatting:
            enabled: true
            language_version: 3.6
            emit_format_off: false
```

3) Run codegen:

```sh
dart run build_runner build
```

## Configuration

### `schema`
Required.

- `file`: single schema file (`package|path`).
- `add_typenames`: adds `__typename` to selections (required for when/maybeWhen).
- `generate_possible_types_map`: include possible types map in schema output.
- `output_dir`: output folder (default: `__generated__`).
- `source_extension`: source extension (default: `.graphql`).

### `outputs`
Control which artifacts are generated:

```yaml
outputs:
  ast: true
  data: true
  vars: true
  req: true
  schema: true
```

Note: `req` depends on `ast`, `data`, and `vars`.

### `data_classes`
- `reuse_fragments`: reuse fragment classes when explicitly spread.
- `when_extensions`: `when` / `maybe_when` extension generation.
- `utils`: `copy_with`, `equals`, `hash_code`, `to_string`.

### `collections`
Choose how list/map fields are represented:

```yaml
collections:
  mode: plain # or unmodifiable
```

- `plain`: standard `List`/`Map` types (default).
- `unmodifiable`: wraps generated list/map fields with
  `List.unmodifiable` / `Map.unmodifiable` in constructors and `fromJson`.

### `vars`
- `tristate_optionals`: use `Value<T>` for nullable variables.

### `docs`
- `enabled`: emit doc comments from GraphQL schema descriptions (default `false`).

### `enums.fallback`
- `global`: enable global fallback.
- `name`: global fallback name (default `gUnknownEnumValue`).
- `per_enum`: per-enum fallback map `{ EnumName: gUnknownEnumValue }`.

### `scalars`
Override scalar mapping:

```yaml
scalars:
  BigDecimal:
    type: String
  Json:
    type: 'Map<String, dynamic>'
  Date:
    type: CustomDate
    import: package:your_package/custom/date.dart
    from_json: customDateFromJson
    to_json: customDateToJson
```

### `formatting`
- `enabled`: run `dart format` before writing.
- `language_version`: passed to formatter (e.g. `3.6`).
- `emit_format_off`: insert `// dart format off` at the top of generated files.
  The generator still formats once if `enabled: true`.

## Limitations / non-goals

- **Single schema** only (`schema.files` is not supported). Workaround: split
  schemas into separate Dart packages and use separate Ferry clients per schema
  (shared clients can conflict in cache normalization and produce unpredictable
  behavior).
- Request output **requires** AST + data + vars outputs.
- No `built_value` or builder classes. Models are plain Dart.

## Code structure (high-level)

- `lib/graphql_builder.dart`: Build entry point, wiring + build rules.
- `lib/src/config/`: build.yaml parsing + validation.
- `lib/src/emit/`: code emitters
  - `ast_builder.dart`, `data_emitter*.dart`, `vars_emitter.dart`,
    `req_emitter.dart`, `schema_emitter.dart`, `utils_emitter.dart`.
- `lib/src/schema/`: schema index + type utilities.
- `lib/src/selection/`: selection resolution + validation.
- `lib/src/source/`: GraphQL source loading.
- `lib/src/utils/`: allocator, writer, naming helpers.

## Tests

There are **two layers**:

1) **In-package tests** (`packages/ferry_generator2/test`):
   - build_test-based generator tests
   - analyzer-backed checks on generated AST
   - negative tests for invalid operations/config

   Run:
   ```sh
   cd packages/ferry_generator2
   dart test
   ```

2) **End-to-end package** (`packages/ferry_generator2_end_to_end`):
   - real schema + operations
   - generated outputs checked into git
   - runtime tests validate serialization, request plumbing, and tricky cases

   Run:
   ```sh
   cd packages/ferry_generator2_end_to_end
   dart run build_runner build
   dart test
   ```

## Status

Generator 2 is **experimental** and under active development. Expect API and
output changes before the first stable release.
