## 0.6.1-dev.0

 - **FEAT**(ferry_store): add flush method to allow persistent stores to write pending data to disk.

## 0.6.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.6.0-dev.1

> Note: This release has breaking changes.

 - **BREAKING** **CHORE**(deps): upgrade rxdart to v0.28.0 (#612).

## 0.6.0-dev.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(ferry_generator): update to gql_code_builders 0.12.0. this extracted the common serializers to a separate package. clients need to add gql_code_builder_serializers to their dependencies if they use ferry_generator. (#601).

## 0.5.3+1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.5.3-dev.0+1

 - **DOCS**: add topics (#548).

## 0.5.3

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.5.3-dev.0

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

## 0.5.2

 - Bump "ferry_store" to `0.5.2`.

## 0.5.1-dev.5

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

## 0.5.1-dev.4

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **DOCS**(website): improve custom scalars documention (#517).

## 0.5.1-dev.3

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

## 0.5.1-dev.2

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

## 0.5.1-dev.1

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

## 0.5.1-dev.0+1

 - **DOCS**: add basic documentation for field policy (#494).

## 0.5.1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.5.1-dev.1

 - **REFACTOR**: apply lints fixes (#479).

## 0.5.1-dev.0

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**: use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

## 0.5.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.5.0-dev.0

> Note: This release has breaking changes.

 - **BREAKING** **FIX**: properly generate nullable types for nullable elements in Lists (#445).

## 0.4.5

## 0.4.4-dev.8

 - **DOCS**: remove stale code (#271).

## 0.4.4-dev.7

 - **FIX**: add dispose method to TypedLinks (#272).

## 0.4.4-dev.6

 - **FIX**: add missing dependencies (#268).

## 0.4.4-dev.5

 - **FIX**: add missing dependencies (#267).

## 0.4.4-dev.4

 - **FIX**: add missing override annotations (#261).

## 0.4.4-dev.3

 - **FEAT**: add github action for validating formatting (#260).

## 0.4.4-dev.2

 - **FEAT**: add extensions to response (#259).

## 0.4.4-dev.1

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: build generated files to __generated__ subdirectory.

## 0.4.4-dev.0+1

 - **FIX**: move pedantic to dependency (#257).

## 0.4.4

 - **FEAT**: update dependences.
 - **FEAT**: update dependences.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.4.3

 - **FEAT**: update dependences.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.4.2

 - **FEAT**: migrate to null safety.
 - **FEAT**: migrate to null safety.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.4.1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.4.1-0.1.nullsafety.0

 - **FEAT**: migrate to null safety.
 - **CHORE**: bump versions to match melos style.
 - **CHORE**: publish packages.
 - **CHORE**: prepare changelogs for melos.

## 0.4.0-1.0.nullsafety.0

 - **FEAT**: migrate to null safety.
 - **CHORE**: prepare changelogs for melos.

## [0.4.0-nullsafety.1]

- fix: allow put of null

## [0.4.0-nullsafety.0]

- initial support for null safety

## [0.3.2]

- update dependencies

## [0.3.1] - 2020-10-16

### Changed

- upgrade `rxdart` to latest version

## [0.3.0] - 2020-10-07

### Changed

- watch now only watches a specific `dataId`

## [0.2.1] - 2020-09-09

### Added

- add `deleteAll` method

## [0.2.0] - 2020-08-30

### Added

- add tests
- add clear method
- add dispose method

### Changed

- base `MemoryStore` stream on Rx `BehaviorSubject`

### Removed

- remove `toMap()` method

## [0.1.0] - 2020-05-10

### Added

- initial release as an independent package
