## 0.8.0-dev.1

 - **FIX**: When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.

## 0.8.0-dev.0+2

 - **DOCS**: add basic documentation for field policy (#494).

## 0.8.0+1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.8.0-dev.0+1

 - **REFACTOR**: apply lints fixes (#479).

## 0.8.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.8.0-dev.1

> Note: This release has breaking changes.

 - **BREAKING** **FIX**: properly generate nullable types for nullable elements in Lists (#445).

## 0.8.0-dev.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: respect skip/include directives when checking for partial data (#433).

## 0.7.2

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.7.2-dev.0

 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).

## 0.7.1

 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).

## 0.7.0


 - **FIX**: Streamline typename handling #359


## 0.6.1

 - **FIX**: Preserve backwards compatibility with dataIdFromObject (#368).
 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Streamline typename handling.

## 0.7.0-dev.1

 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Streamline typename handling.

## 0.6.0+1

 - **TEST**: add fragment variable test.
 - **FIX**: Broken fragment spreads.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.6.0

- Require possible types map to correctly disambiguate fragments

## 0.5.6-dev.1

- **FIX**: add dispose method to TypedLinks (#272).
- **FEAT**: add Reviews subscription to test graphql.
- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **CHORE**: restructure repo (#269).

## 0.5.5-dev.8

- **DOCS**: remove stale code (#271).

## 0.5.5-dev.7

- **FIX**: add dispose method to TypedLinks (#272).

## 0.5.5-dev.6

- **FIX**: add missing dependencies (#268).

## 0.5.5-dev.5

- **FIX**: add missing dependencies (#267).

## 0.5.5-dev.4

- **FIX**: add missing override annotations (#261).

## 0.5.5-dev.3

- **FEAT**: add github action for validating formatting (#260).

## 0.5.5-dev.2

- **FEAT**: add extensions to response (#259).

## 0.5.5-dev.1

> Note: This release has breaking changes.

- **BREAKING** **FEAT**: build generated files to **generated** subdirectory.

## 0.5.5-dev.0+1

- **FIX**: move pedantic to dependency (#257).

## 0.5.5

- **FIX**: allow inline fragments for subtypes without passing possibleTypes.
- **FEAT**: update dependences.
- **FEAT**: update dependences.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

## 0.5.4

- **FEAT**: update dependences.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

## 0.5.3

- **FEAT**: Add support for better fragment type resolution.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

## 0.5.2

- allow overriding of `__typename` when reading fragments

## 0.5.1

- Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.5.1-0.1.nullsafety.0

- **FEAT**: migrate to null safety.
- **CHORE**: bump versions to match melos style.
- **CHORE**: publish packages.
- **CHORE**: prepare changelogs for melos.

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
