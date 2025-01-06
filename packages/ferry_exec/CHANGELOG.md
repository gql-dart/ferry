## 0.6.1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.6.1-dev.1

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(ferry_generator): update to gql_code_builders 0.12.0. this extracted the common serializers to a separate package. clients need to add gql_code_builder_serializers to their dependencies if they use ferry_generator. (#601).

## 0.6.1-dev.0+1

 - **DOCS**(ferry_exec): fix typo.

## 0.6.1

- Graduate package to a stable release. See pre-releases prior to this version for changelog
  entries.

## 0.6.0-dev.0+1

- **FIX**(ferry_exec): pass context for JsonOperationRequests (#580).

## 0.6.0

> Note: This release has breaking changes.

- **BREAKING** **FEAT**: pass context to gql links.

## 0.5.0-dev.0+1

- **DOCS**: add topics (#548).

## 0.5.0

- Graduate package to a stable release. See pre-releases prior to this version for changelog
  entries.

## 0.5.0-dev.0

> Note: This release has breaking changes.

- **BREAKING** **FEAT**(ferry_exec): remove usage of dynamic in cache and AddTypeNameTypedLink by
  adding new methods to operationrequest  (#547).

## 0.4.0

> Note: This release has breaking changes.

- **BREAKING** **FEAT**(ferry_exec): add `varToJson()` method to OperationRequest and
  FragmentRequest in order to make the cache work without casts to dynamic.

## 0.3.1

- Bump "ferry_exec" to `0.3.1`.

## 0.3.0-dev.6

> Note: This release has breaking changes.

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
- **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in
  watchQuery/watchFragment (#416).
- **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
- **FEAT**(ferry): add IsolateClient (#405).
- **FEAT**: generate possibleTypesMap in ferry_generator (#371).
- **FEAT**: add Reviews subscription to test graphql.
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.3.0-dev.5

> Note: This release has breaking changes.

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
- **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in
  watchQuery/watchFragment (#416).
- **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
- **FEAT**(ferry): add IsolateClient (#405).
- **FEAT**: generate possibleTypesMap in ferry_generator (#371).
- **FEAT**: add Reviews subscription to test graphql.
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.3.0-dev.4

> Note: This release has breaking changes.

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
- **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in
  watchQuery/watchFragment (#416).
- **FEAT**(ferry): add IsolateClient (#405).
- **FEAT**: generate possibleTypesMap in ferry_generator (#371).
- **FEAT**: add Reviews subscription to test graphql.
- **DOCS**(website): improve custom scalars documention (#517).
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.3.0-dev.3

> Note: This release has breaking changes.

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
- **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in
  watchQuery/watchFragment (#416).
- **FEAT**(ferry): add IsolateClient (#405).
- **FEAT**: generate possibleTypesMap in ferry_generator (#371).
- **FEAT**: add Reviews subscription to test graphql.
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.3.0-dev.2

> Note: This release has breaking changes.

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
- **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in
  watchQuery/watchFragment (#416).
- **FEAT**(ferry): add IsolateClient (#405).
- **FEAT**: generate possibleTypesMap in ferry_generator (#371).
- **FEAT**: add Reviews subscription to test graphql.
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.3.0-dev.1

> Note: This release has breaking changes.

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
- **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in
  watchQuery/watchFragment (#416).
- **FEAT**(ferry): add IsolateClient (#405).
- **FEAT**: generate possibleTypesMap in ferry_generator (#371).
- **FEAT**: add Reviews subscription to test graphql.
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.3.0-dev.0+2

- **DOCS**: add basic documentation for field policy (#494).

## 0.3.0+1

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**: remove cyclic dependency ferry_exec <-> ferry_test_graphql.

## 0.3.0-dev.1

- **REFACTOR**: apply lints fixes (#479).

## 0.3.0-dev.0+1

- **REFACTOR**: apply lints fixes (#479).
- **REFACTOR**: remove cyclic dependency ferry_exec <-> ferry_test_graphql.

## 0.3.0

- Graduate package to a stable release. See pre-releases prior to this version for changelog
  entries.

## 0.3.0-dev.0

> Note: This release has breaking changes.

- **BREAKING** **FIX**: properly generate nullable types for nullable elements in Lists (#445).

## 0.2.0

- Bump "ferry_exec" to `0.2.0`.

## 0.1.8-dev.1

- **FIX**: ensure emitting only one update per updated data ID in cache in
  watchQuery/watchFragment (#416).

## 0.1.8-dev.0

- **FEAT**: add IsolateClient (#405).
- **FEAT**: more IsolateClient features.

## 0.1.6

- **FEAT**: more IsolateClient features.

## 0.1.5

> Note: This release has breaking changes.

- **FEAT**: generate possibleTypesMap in ferry_generator (#371).
- **FEAT**: add Reviews subscription to test graphql.
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.1.5-dev.2

> Note: This release has breaking changes.

- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.1.5-dev.1

- **FEAT**: add Reviews subscription to test graphql.
- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **CHORE**: restructure repo (#269).

## 0.1.4-dev.8

- **DOCS**: remove stale code (#271).

## 0.1.4-dev.7

- **FIX**: add dispose method to TypedLinks (#272).

## 0.1.4-dev.6

- **FIX**: add missing dependencies (#268).

## 0.1.4-dev.5

- **FIX**: add missing dependencies (#267).

## 0.1.4-dev.4

- **FIX**: add missing override annotations (#261).

## 0.1.4-dev.3

- **FEAT**: add github action for validating formatting (#260).

## 0.1.4-dev.2

- **FEAT**: add extensions to response (#259).

## 0.1.4-dev.1

> Note: This release has breaking changes.

- **BREAKING** **FEAT**: build generated files to __generated__ subdirectory.

## 0.1.4-dev.0+1

- **FIX**: move pedantic to dependency (#257).

## 0.1.4

- **FEAT**: update dependences.
- **FEAT**: update dependences.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

## 0.1.3

- **FEAT**: update dependences.
- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

## 0.1.2

- **FEAT**: migrate to null safety.
- **FEAT**: migrate to null safety.
- **CHORE**: publish packages.
- **CHORE**: publish packages.

## 0.1.1

- Graduate package to a stable release. See pre-releases prior to this version for changelog
  entries.

## 0.1.1-0.1.nullsafety.0

- **FEAT**: migrate to null safety.
- **CHORE**: bump versions to match melos style.
- **CHORE**: publish packages.
- **CHORE**: prepare changelogs for melos.

## 0.1.0-1.0.nullsafety.0

- **FEAT**: migrate to null safety.
- **CHORE**: prepare changelogs for melos.

## [0.1.0-nullsafety.1]

- allow fragment names to be nullable

## [0.1.0-nullsafety.0]

- initial null safety support

## [0.0.3]

- add `TypedLinkException`

## [0.0.2]

- update dependencies

## [0.0.1] - 2020-10-10

### Added

- initial commit
