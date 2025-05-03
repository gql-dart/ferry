## 0.4.1-dev.1

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(ferry_test_external_schema): update for new gql_code_builder version.
 - **BREAKING** **FEAT**(ferry_generator): upgrade gql_code_builder to 0.14.0.

## 0.4.1-dev.0

 - **FEAT**(ferry_generator): move to dart_style 3.0.0 (#632).

## 0.4.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.4.0-dev.0

> Note: This release has breaking changes.

 - **FEAT**(ferry_generator): Passing through builder options to schema builder (#585).
 - **BREAKING** **FEAT**(ferry_generator): update to gql_code_builders 0.12.0. this extracted the common serializers to a separate package. clients need to add gql_code_builder_serializers to their dependencies if they use ferry_generator. (#601).
 - **BREAKING** **CHORE**(deps): upgrade rxdart to v0.28.0 (#612).

## 0.3.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.3.0-dev.4

> Note: This release has breaking changes.

 - **BREAKING** **CHORE**(deps): upgrade rxdart to v0.28.0 (#612).

## 0.3.0-dev.3

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(ferry_generator): update to gql_code_builders 0.12.0. this extracted the common serializers to a separate package. clients need to add gql_code_builder_serializers to their dependencies if they use ferry_generator. (#601).

## 0.3.0-dev.2

 - **FEAT**(ferry_generator): Passing through builder options to schema builder (#585).

## 0.3.0-dev.1

 - Update a dependency to the latest release.

## 0.3.0-dev.0+1

 - Update a dependency to the latest release.

## 0.3.0

 - update generated code

## 0.2.4-dev.5

 - **FEAT**: update generated code.

## 0.2.4-dev.4

 - **FEAT**(vars-builder-generator): Adding gql_code_builder vars builder dep.

## 0.2.4-dev.3

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(ferry_generator): make dataToJson() method type safe by using the generic data type instead of dynamic.

## 0.2.4-dev.2

 - **FEAT**(ferry_generator): support adding  in the config of build.yaml in your graphql_builder in order to wrap nullable fields into a Value type in order to distinguish between absent and null values in inputs (#549).

## 0.2.4-dev.1

 - **FEAT**(ferry_generator): support adding  in the config of build.yaml in your graphql_builder in order to wrap nullable fields into a Value type in order to distinguish between absent and null values in inputs (#549).

## 0.2.4-dev.0+1

 - Update a dependency to the latest release.

## 0.2.4

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.2.4-dev.1

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(ferry_exec): remove usage of dynamic in cache and AddTypeNameTypedLink by adding new methods to operationrequest  (#547).

## 0.2.4-dev.0

 - **FEAT**(ferry_generator): add option to reuse data classes for fragments with a single inline fragment  spread as selection (#530).

## 0.2.3

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.2.3-dev.0

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).

## 0.2.2

 - Bump "ferry_test_graphql2" to `0.2.2`.

## 0.2.1-dev.4

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).

## 0.2.1-dev.3

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **DOCS**(website): improve custom scalars documention (#517).

## 0.2.1-dev.2

 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).

## 0.2.1-dev.1

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).

## 0.2.1-dev.0+2

 - **DOCS**: add basic documentation for field policy (#494).

## 0.2.1+1

 - Update a dependency to the latest release.

## 0.2.1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.2.1-dev.2

 - **REFACTOR**: fix dependencies.

## 0.2.1-dev.1

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**: remove cyclic dependency ferry_exec <-> ferry_test_graphql.

## 0.2.1-dev.1

 - **REFACTOR**: remove cyclic dependency ferry_exec <-> ferry_test_graphql.

## 0.2.1-dev.0

 - **FEAT**: when/maybeWhen extensions (#470).

## 0.2.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.2.0-dev.0

> Note: This release has breaking changes.

 - **BREAKING** **FIX**: properly generate nullable types for nullable elements in Lists (#445).

## 0.1.5

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.1.5-dev.6

 - Update a dependency to the latest release.

## 0.1.5-dev.5

> Note: This release has breaking changes.

 - **FIX**: call cache handlers for every response from DataSource.Link.
 - **FIX**: disable test.
 - **FEAT**: add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.1.5-dev.4

 - Update a dependency to the latest release.

## 0.1.5-dev.3

> Note: This release has breaking changes.

 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

## 0.1.5-dev.2

 - **TEST**: add back test.
 - **FIX**: call cache handlers for every response from DataSource.Link.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.1.5-dev.1

 - **FIX**: disable test.
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

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.1.1-0.1.nullsafety.1

 - **FIX**: update build_runner.

## 0.1.1-0.1.nullsafety.0

 - **FEAT**: migrate to null safety.
 - **CHORE**: bump versions to match melos style.
 - **CHORE**: prepare changelogs for melos.

## [0.1.0-nullsafety.1]

- allow fragment names to be nullable

## [0.1.0-nullsafety.0]

- add initial null safety support

## [0.0.3]

- update hero fragment

## [0.0.2]

- update dependencies

## [0.0.1] - 2020-08-23

### Added

- package added
