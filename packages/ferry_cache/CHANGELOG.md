## 0.6.1+1

 - Update a dependency to the latest release.

## 0.6.1

 - FIX: add missing possibleTypes parameters to calls to normlalize

 - **FIX**: add possibleTypes to every function that can use it of normalize (#380).

## 0.6.0

 - bump normalize dependency version constraint to fix fragment disambiguation

 - **FIX**: pin normalize 0.6.0.

## 0.5.5-dev.10

 - Update a dependency to the latest release.

## 0.5.5-dev.9

 - Update a dependency to the latest release.

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

 - **BREAKING** **FEAT**: build generated files to __generated__ subdirectory.

## 0.5.5-dev.0+1

 - **FIX**: move pedantic to dependency (#257).

## 0.5.5

 - **FEAT**: update dependences.
 - **FEAT**: update dependences.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.5.4

 - **FEAT**: update dependences.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.5.3+1

 - **FIX**: Supply empty possibleTypeOf map `operationFieldNames`.
 - **FIX**: resolve issue with data change streams.
 - **FIX**: resolve issue with data change streams.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.5.3

- add support for `dataIdFromObject`
- bump `normalize` version

## 0.5.2+1

- **FIX**: resolve issue with data change streams.
- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

## 0.5.2

- **FEAT**: migrate to null safety.
- **FEAT**: migrate to null safety.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

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

## [0.5.0-nullsafety.0]

- add initial support for null safety

## [0.4.3]

- update internal watch logic
- add `watchFragment` method

## [0.4.2]

- update dependencies

## [0.4.1] - 2020-11-15

### Added

- Allow `evict()` method to accept an `optimisticRequest`
- Add tests

## [0.4.0] - 2020-11-09

### Changed

- use the entire `OperationRequest`, not just the `requestId` as the key in optimistic patches map
- `writeQuery` and `writeFragment` now accept the optimistic request itself instead of just the requestId
- bump `normalize` version

### Removed

- move `deepMerge` to a utility function in `normalize` package

## [0.3.0] - 2020-10-10

### Added

- move cache pack to seperate package
- return keys to remove from `Cache.gc()`
- upgrade `rxdart` to latest version
