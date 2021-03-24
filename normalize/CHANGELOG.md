## 0.5.0-1.0.nullsafety.0

 - **FEAT**: migrate to null safety.
 - **CHORE**: prepare changelogs for melos.

## [0.4.7]

- add `reachableIdsFromDataId` util

## [0.4.6]

- handle type mismatch in `identify` util

## [0.4.5]

- update dependencies

## [0.4.4] - 2020-11-15

### Fixed

- fix `reachableIds` utility when data has circular references

## [0.4.3] - 2020-11-09

### Added

- add `deepMerge` method
- add a `path` to `PartialDataException` to surface invalid paths
- add `acceptPartialData` option to `normalizeFragment` and `normalizeOperation` for rejecting partial `data`
- add `handleException` option to `denormalizeFragment` and `denormalizeOperation` for throwing a `PartialDataException` instead of returning `null` on partial `data`
- add a `validateOperationDataStructure` utility for validating structure against a document

### Changed

- fix: merge existing data before writing

## [0.4.3-alpha] - 2020-11-06

### Added

- add a `path` to `PartialDataException` to surface invalid paths
- add `acceptPartialData` option to `normalizeFragment` and `normalizeOperation` for rejecting partial `data`
- add `handleException` option to `denormalizeFragment` and `denormalizeOperation` for throwing a `PartialDataException` instead of returning `null` on partial `data`
- add a `validateOperationDataStructure` utility for validating structure against a document

## [0.4.2] - 2020-10-07

### Changed

- rename `reachableDataIds` to `reachableIds`

### Added

- add `operationFieldNames` method

## [0.4.1] - 2020-09-22

### Changed

- prevent subscription from adding `__typename`

## [0.4.0] - 2020-09-10

### Changed

- update `TypePolicy.keyFields` API to allow subfields

## [0.3.4] - 2020-09-09

### Added

- export policies seperately

## [0.3.3] - 2020-09-09

### Added

- add `identify` method
- export utils seperately
- add `reachableDataIds` method

### Changed

- updates to `FieldKey`
- fix null bug in denormalize_node

## [0.3.2] - 2020-09-08

### Added

- export `resolveDataId` function

## [0.3.1] - 2020-09-08

### Added

- add `FieldKey` class

## [0.3.0] - 2020-09-05

### Changed

- rename `normalize` to `normalizeOperation`
- rename `denormalize` to `denormalizeOperation`
- rename `query` to `document` in `normalizeOperation` and `denormalizeOperation`
- rename `fragment` to `document` in `normalizeFragment` and `denormalizeFragment`
- rename `reader` to `read` in denormalize functions
- rename `writer` with `write` in normalize functions
- require `read` callback in normalize functions
- denormalize methods now filter out dangling references

## [0.2.4] - 2020-09-05

### Changed

- fix type casting of nested map in denormalizeFragment.

## [0.2.3] - 2020-09-03

### Changed

- expose `getOperationDefinition` helper method.

## [0.2.2] - 2020-08-19

### Changed

- include addTypename in normalize & normalizeFragment

## [0.2.1] - 2020-06-15

### Changed

- fix bug with fragments on same object with different fields
- fix issue when using a fragment spread on an interface type

## [0.2.0] - 2020-05-10

### Changed

- add to ferry monorepo

## [0.1.4] - 2020-02-22

### Changed

- transfer to gql-dart org

## [0.1.3] - 2020-02-11

### Changed

- fix issue with unmodifiable lists

## [0.1.2] - 2020-02-08

### Changed

- fix map type issue

## [0.1.1] - 2020-02-03

### Changed

- update readme

## [0.1.0] - 2020-02-03

### Changed

- use `reader` and `writer` instead of passing objects directly

## [0.0.8] - 2020-02-03

### Added

- make normalization agnostic to argument order

## [0.0.7] - 2020-01-25

### Added

- allow user to specify whether partial data should be returned (defaults to false)

## [0.0.6] - 2020-01-11

### Changed

- use standart Json type
- update `gql` dependency

## [0.0.5] - 2020-01-01

### Changed

- `denormalize` and `denormalizeFragment` now return null if there is a existing data with different variables in the map (they previously returned an empty object).

## [0.0.4] - 2019-12-30

### Added

- operationName parameter for multi-operation documents

## [0.0.3] - 2019-11-19

### Added

- normalizeFragment function
- denormalizeFragment function

## [0.0.2] - 2019-11-18

### Added

- Optionally add typenames when denormalizing

## [0.0.1] - 2019-11-14

### Added

- Initial normalize and denormalize implementations 🚀
- Support for variables
- Support for fragments (definitions and inline)
- Support for Apollo-style TypePolicies
- Support for Aliases
- Support for interface & union types
- Tests (for all of the above)
