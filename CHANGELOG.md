# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2023-05-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ferry_exec` - `v0.3.1`](#ferry_exec---v031)
 - [`ferry_cache` - `v0.7.1-dev.8`](#ferry_cache---v071-dev8)
 - [`ferry_flutter` - `v0.8.1-dev.1`](#ferry_flutter---v081-dev1)
 - [`ferry` - `v0.15.0-dev.1`](#ferry---v0150-dev1)
 - [`ferry_test_graphql2` - `v0.2.3-dev.1`](#ferry_test_graphql2---v023-dev1)
 - [`ferry_generator` - `v0.8.0-dev.6`](#ferry_generator---v080-dev6)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ferry_cache` - `v0.7.1-dev.8`
 - `ferry_flutter` - `v0.8.1-dev.1`
 - `ferry` - `v0.15.0-dev.1`
 - `ferry_test_graphql2` - `v0.2.3-dev.1`
 - `ferry_generator` - `v0.8.0-dev.6`

---

#### `ferry_exec` - `v0.3.1`

 - Bump "ferry_exec" to `0.3.1`.


## 2023-05-02

### Changes

---

Packages with breaking changes:

 - [`ferry` - `v0.15.0-dev.0`](#ferry---v0150-dev0)
 - [`ferry_cache` - `v0.7.1-dev.7`](#ferry_cache---v071-dev7)
 - [`ferry_exec` - `v0.3.0-dev.6`](#ferry_exec---v030-dev6)
 - [`ferry_generator` - `v0.8.0-dev.5`](#ferry_generator---v080-dev5)
 - [`normalize` - `v0.9.0-dev.0`](#normalize---v090-dev0)

Packages with other changes:

 - [`ferry_hive_store` - `v0.5.1-dev.6`](#ferry_hive_store---v051-dev6)
 - [`ferry_store` - `v0.5.3-dev.0`](#ferry_store---v053-dev0)
 - [`ferry_test_graphql2` - `v0.2.3-dev.0`](#ferry_test_graphql2---v023-dev0)
 - [`ferry_flutter` - `v0.8.1-dev.0+1`](#ferry_flutter---v081-dev01)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ferry_flutter` - `v0.8.1-dev.0+1`

---

#### `ferry` - `v0.15.0-dev.0`

 - **REFACTOR**(ferry): FetchPolicyTypedLink.request() to avoid pending timers in tests (#427).
 - **REFACTOR**(ferry): use scheduleMicrostask instead of Future.delayed in order to no have pending timers in widget tests.
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry): Re-use the same stream for multiple requests when possible (#487).
 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry): send error to main isolate when data message could not be serialized (#455).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry): remove broken isolateSpawn functionality, FlutterIsolate does not support passing functions (#413).
 - **FIX**: pin normalize 0.6.0.
 - **FIX**(ferry): call cache handlers for every response from DataSource.Link.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add watchQuery, watchFragment, clearOptimisticPatches to IsolateClient  (#460).
 - **FEAT**(ferry): improve isolate error handling (#448).
 - **FEAT**(ferry): verify that updateResult function can be sent to the other isolate in debug mode using asserts and provide a better error message if updatgeResult cannot be serialized (#425).
 - **FEAT**(ferry): refactor isolateCommands, add addRequestToRequestController method (#422).
 - **FEAT**(ferry): add removeOptimisticResponse to isolate client (#412).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(ferry): add basic documentation for field policy (#494).
 - **DOCS**(ferry): fix typo in CHANGELOG (#384).
 - **DOCS**: remove stale code (#271).
 - **BREAKING** **FIX**(ferry): remove optimistic patch when listener unsubscribes before link responds with data instead of leaking optimistic patch forever (#466).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_cache` - `v0.7.1-dev.7`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_cache): use jsonMapEquals instead of DeepCollectionEquality.equals() to avoid it's O(n^2) complexity, remove duplicated .distinct() call (#477).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry_cache): fix cache emits update too often (#411).
 - **FIX**(ferry_cache): fix regression in watch() methods by making changeStream emit when new item is added to the cache (#403).
 - **FIX**(cache): Fix memory leak. (#385).
 - **FIX**: add possibleTypes to every function that can use it of normalize (#380).
 - **FIX**: pin normalize 0.6.0.
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**(ferry_cache): add `clearOptimisticPatches()` (#459).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).

#### `ferry_exec` - `v0.3.0-dev.6`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_generator` - `v0.8.0-dev.5`

 - **FIX**: Use Posix separators for output paths (#369).
 - **FIX**: revert broken transitive dependency.
 - **FIX**: upgrade analyzer dependency.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `normalize` - `v0.9.0-dev.0`

 - **REFACTOR**: apply lints fixes (#479).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**: Preserve backwards compatibility with dataIdFromObject (#368).
 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Broken fragment spreads.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **FEAT**(normalize): respect skip/include directives when checking for partial data (#433).

#### `ferry_hive_store` - `v0.5.1-dev.6`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**: add Reviews subscription to test graphql.

#### `ferry_store` - `v0.5.3-dev.0`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

#### `ferry_test_graphql2` - `v0.2.3-dev.0`

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).


## 2023-05-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ferry_flutter` - `v0.8.1`](#ferry_flutter---v081)

---

#### `ferry_flutter` - `v0.8.1`


## 2023-05-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ferry` - `v0.14.1`](#ferry---v0141)
 - [`ferry_flutter` - `v0.8.0-dev.14`](#ferry_flutter---v080-dev14)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ferry_flutter` - `v0.8.0-dev.14`

---

#### `ferry` - `v0.14.1`


## 2023-05-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ferry_store` - `v0.5.2`](#ferry_store---v052)
 - [`ferry_cache` - `v0.7.1-dev.7`](#ferry_cache---v071-dev7)
 - [`ferry_hive_store` - `v0.5.1-dev.6`](#ferry_hive_store---v051-dev6)
 - [`ferry` - `v0.14.0-dev.10`](#ferry---v0140-dev10)
 - [`ferry_flutter` - `v0.8.0-dev.14`](#ferry_flutter---v080-dev14)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ferry_cache` - `v0.7.1-dev.7`
 - `ferry_hive_store` - `v0.5.1-dev.6`
 - `ferry` - `v0.14.0-dev.10`
 - `ferry_flutter` - `v0.8.0-dev.14`

---

#### `ferry_store` - `v0.5.2`

 - Bump "ferry_store" to `0.5.2`.


## 2023-05-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ferry_test_graphql2` - `v0.2.2`](#ferry_test_graphql2---v022)

---

#### `ferry_test_graphql2` - `v0.2.2`

 - Bump "ferry_test_graphql2" to `0.2.2`.


## 2023-05-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`normalize` - `v0.8.1`](#normalize---v081)
 - [`ferry_cache` - `v0.7.1-dev.7`](#ferry_cache---v071-dev7)
 - [`ferry` - `v0.14.0-dev.10`](#ferry---v0140-dev10)
 - [`ferry_flutter` - `v0.8.0-dev.14`](#ferry_flutter---v080-dev14)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ferry_cache` - `v0.7.1-dev.7`
 - `ferry` - `v0.14.0-dev.10`
 - `ferry_flutter` - `v0.8.0-dev.14`

---

#### `normalize` - `v0.8.1`

 - Bump "normalize" to `0.8.1`.


## 2023-05-02

### Changes

---

Packages with breaking changes:

 - [`ferry` - `v0.14.0-dev.9`](#ferry---v0140-dev9)
 - [`ferry_cache` - `v0.7.1-dev.6`](#ferry_cache---v071-dev6)
 - [`ferry_exec` - `v0.3.0-dev.5`](#ferry_exec---v030-dev5)
 - [`ferry_flutter` - `v0.8.0-dev.13`](#ferry_flutter---v080-dev13)
 - [`ferry_generator` - `v0.8.0-dev.4`](#ferry_generator---v080-dev4)
 - [`normalize` - `v0.8.0-dev.6`](#normalize---v080-dev6)

Packages with other changes:

 - [`ferry_hive_store` - `v0.5.1-dev.5`](#ferry_hive_store---v051-dev5)
 - [`ferry_store` - `v0.5.1-dev.5`](#ferry_store---v051-dev5)
 - [`ferry_test_graphql2` - `v0.2.1-dev.4`](#ferry_test_graphql2---v021-dev4)

---

#### `ferry` - `v0.14.0-dev.9`

 - **REFACTOR**(ferry): FetchPolicyTypedLink.request() to avoid pending timers in tests (#427).
 - **REFACTOR**(ferry): use scheduleMicrostask instead of Future.delayed in order to no have pending timers in widget tests.
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry): Re-use the same stream for multiple requests when possible (#487).
 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry): send error to main isolate when data message could not be serialized (#455).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry): remove broken isolateSpawn functionality, FlutterIsolate does not support passing functions (#413).
 - **FIX**: pin normalize 0.6.0.
 - **FIX**(ferry): call cache handlers for every response from DataSource.Link.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add watchQuery, watchFragment, clearOptimisticPatches to IsolateClient  (#460).
 - **FEAT**(ferry): improve isolate error handling (#448).
 - **FEAT**(ferry): verify that updateResult function can be sent to the other isolate in debug mode using asserts and provide a better error message if updatgeResult cannot be serialized (#425).
 - **FEAT**(ferry): refactor isolateCommands, add addRequestToRequestController method (#422).
 - **FEAT**(ferry): add removeOptimisticResponse to isolate client (#412).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(ferry): add basic documentation for field policy (#494).
 - **DOCS**(ferry): fix typo in CHANGELOG (#384).
 - **DOCS**: remove stale code (#271).
 - **BREAKING** **FIX**(ferry): remove optimistic patch when listener unsubscribes before link responds with data instead of leaking optimistic patch forever (#466).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_cache` - `v0.7.1-dev.6`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_cache): use jsonMapEquals instead of DeepCollectionEquality.equals() to avoid it's O(n^2) complexity, remove duplicated .distinct() call (#477).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry_cache): fix cache emits update too often (#411).
 - **FIX**(ferry_cache): fix regression in watch() methods by making changeStream emit when new item is added to the cache (#403).
 - **FIX**(cache): Fix memory leak. (#385).
 - **FIX**: add possibleTypes to every function that can use it of normalize (#380).
 - **FIX**: pin normalize 0.6.0.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**(ferry_cache): add `clearOptimisticPatches()` (#459).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).

#### `ferry_exec` - `v0.3.0-dev.5`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_flutter` - `v0.8.0-dev.13`

 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry_flutter): bump version.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_generator` - `v0.8.0-dev.4`

 - **FIX**: Use Posix separators for output paths (#369).
 - **FIX**: revert broken transitive dependency.
 - **FIX**: upgrade analyzer dependency.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `normalize` - `v0.8.0-dev.6`

 - **REFACTOR**: apply lints fixes (#479).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**: Preserve backwards compatibility with dataIdFromObject (#368).
 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Broken fragment spreads.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **FEAT**(normalize): respect skip/include directives when checking for partial data (#433).

#### `ferry_hive_store` - `v0.5.1-dev.5`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**: add Reviews subscription to test graphql.

#### `ferry_store` - `v0.5.1-dev.5`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

#### `ferry_test_graphql2` - `v0.2.1-dev.4`

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**: support stable 1.0.0 versions of depenencies gql, gql_exec, gql_link (#521).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).


## 2023-04-30

### Changes

---

Packages with breaking changes:

 - [`ferry` - `v0.14.0-dev.8`](#ferry---v0140-dev8)
 - [`ferry_cache` - `v0.7.1-dev.5`](#ferry_cache---v071-dev5)
 - [`ferry_exec` - `v0.3.0-dev.4`](#ferry_exec---v030-dev4)
 - [`ferry_flutter` - `v0.8.0-dev.12`](#ferry_flutter---v080-dev12)
 - [`ferry_generator` - `v0.8.0-dev.3`](#ferry_generator---v080-dev3)
 - [`normalize` - `v0.8.0-dev.5`](#normalize---v080-dev5)

Packages with other changes:

 - [`ferry_hive_store` - `v0.5.1-dev.4`](#ferry_hive_store---v051-dev4)
 - [`ferry_store` - `v0.5.1-dev.4`](#ferry_store---v051-dev4)
 - [`ferry_test_graphql2` - `v0.2.1-dev.3`](#ferry_test_graphql2---v021-dev3)

---

#### `ferry` - `v0.14.0-dev.8`

 - **REFACTOR**(ferry): FetchPolicyTypedLink.request() to avoid pending timers in tests (#427).
 - **REFACTOR**(ferry): use scheduleMicrostask instead of Future.delayed in order to no have pending timers in widget tests.
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry): Re-use the same stream for multiple requests when possible (#487).
 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry): send error to main isolate when data message could not be serialized (#455).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry): remove broken isolateSpawn functionality, FlutterIsolate does not support passing functions (#413).
 - **FIX**: pin normalize 0.6.0.
 - **FIX**(ferry): call cache handlers for every response from DataSource.Link.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add watchQuery, watchFragment, clearOptimisticPatches to IsolateClient  (#460).
 - **FEAT**(ferry): improve isolate error handling (#448).
 - **FEAT**(ferry): verify that updateResult function can be sent to the other isolate in debug mode using asserts and provide a better error message if updatgeResult cannot be serialized (#425).
 - **FEAT**(ferry): refactor isolateCommands, add addRequestToRequestController method (#422).
 - **FEAT**(ferry): add removeOptimisticResponse to isolate client (#412).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(website): improve custom scalars documention (#517).
 - **DOCS**(ferry): add basic documentation for field policy (#494).
 - **DOCS**(ferry): fix typo in CHANGELOG (#384).
 - **DOCS**: remove stale code (#271).
 - **BREAKING** **FIX**(ferry): remove optimistic patch when listener unsubscribes before link responds with data instead of leaking optimistic patch forever (#466).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_cache` - `v0.7.1-dev.5`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_cache): use jsonMapEquals instead of DeepCollectionEquality.equals() to avoid it's O(n^2) complexity, remove duplicated .distinct() call (#477).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry_cache): fix cache emits update too often (#411).
 - **FIX**(ferry_cache): fix regression in watch() methods by making changeStream emit when new item is added to the cache (#403).
 - **FIX**(cache): Fix memory leak. (#385).
 - **FIX**: add possibleTypes to every function that can use it of normalize (#380).
 - **FIX**: pin normalize 0.6.0.
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**(ferry_cache): add `clearOptimisticPatches()` (#459).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **DOCS**(website): improve custom scalars documention (#517).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).

#### `ferry_exec` - `v0.3.0-dev.4`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(website): improve custom scalars documention (#517).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_flutter` - `v0.8.0-dev.12`

 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry_flutter): bump version.
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(website): improve custom scalars documention (#517).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_generator` - `v0.8.0-dev.3`

 - **FIX**: Use Posix separators for output paths (#369).
 - **FIX**: revert broken transitive dependency.
 - **FIX**: upgrade analyzer dependency.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **DOCS**(website): improve custom scalars documention (#517).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `normalize` - `v0.8.0-dev.5`

 - **REFACTOR**: apply lints fixes (#479).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**: Preserve backwards compatibility with dataIdFromObject (#368).
 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Broken fragment spreads.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(website): improve custom scalars documention (#517).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **FEAT**(normalize): respect skip/include directives when checking for partial data (#433).

#### `ferry_hive_store` - `v0.5.1-dev.4`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(website): improve custom scalars documention (#517).

#### `ferry_store` - `v0.5.1-dev.4`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **DOCS**(website): improve custom scalars documention (#517).

#### `ferry_test_graphql2` - `v0.2.1-dev.3`

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **DOCS**(website): improve custom scalars documention (#517).


## 2023-04-30

### Changes

---

Packages with breaking changes:

 - [`ferry` - `v0.14.0-dev.7`](#ferry---v0140-dev7)
 - [`ferry_cache` - `v0.7.1-dev.4`](#ferry_cache---v071-dev4)
 - [`ferry_exec` - `v0.3.0-dev.3`](#ferry_exec---v030-dev3)
 - [`ferry_flutter` - `v0.8.0-dev.11`](#ferry_flutter---v080-dev11)
 - [`ferry_generator` - `v0.8.0-dev.2`](#ferry_generator---v080-dev2)
 - [`normalize` - `v0.8.0-dev.4`](#normalize---v080-dev4)

Packages with other changes:

 - [`ferry_hive_store` - `v0.5.1-dev.3`](#ferry_hive_store---v051-dev3)
 - [`ferry_store` - `v0.5.1-dev.3`](#ferry_store---v051-dev3)
 - [`ferry_test_graphql2` - `v0.2.1-dev.2`](#ferry_test_graphql2---v021-dev2)

---

#### `ferry` - `v0.14.0-dev.7`

 - **REFACTOR**(ferry): FetchPolicyTypedLink.request() to avoid pending timers in tests (#427).
 - **REFACTOR**(ferry): use scheduleMicrostask instead of Future.delayed in order to no have pending timers in widget tests.
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry): Re-use the same stream for multiple requests when possible (#487).
 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry): send error to main isolate when data message could not be serialized (#455).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry): remove broken isolateSpawn functionality, FlutterIsolate does not support passing functions (#413).
 - **FIX**: pin normalize 0.6.0.
 - **FIX**(ferry): call cache handlers for every response from DataSource.Link.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add watchQuery, watchFragment, clearOptimisticPatches to IsolateClient  (#460).
 - **FEAT**(ferry): improve isolate error handling (#448).
 - **FEAT**(ferry): verify that updateResult function can be sent to the other isolate in debug mode using asserts and provide a better error message if updatgeResult cannot be serialized (#425).
 - **FEAT**(ferry): refactor isolateCommands, add addRequestToRequestController method (#422).
 - **FEAT**(ferry): add removeOptimisticResponse to isolate client (#412).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(ferry): add basic documentation for field policy (#494).
 - **DOCS**(ferry): fix typo in CHANGELOG (#384).
 - **DOCS**: remove stale code (#271).
 - **BREAKING** **FIX**(ferry): remove optimistic patch when listener unsubscribes before link responds with data instead of leaking optimistic patch forever (#466).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_cache` - `v0.7.1-dev.4`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_cache): use jsonMapEquals instead of DeepCollectionEquality.equals() to avoid it's O(n^2) complexity, remove duplicated .distinct() call (#477).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry_cache): fix cache emits update too often (#411).
 - **FIX**(ferry_cache): fix regression in watch() methods by making changeStream emit when new item is added to the cache (#403).
 - **FIX**(cache): Fix memory leak. (#385).
 - **FIX**: add possibleTypes to every function that can use it of normalize (#380).
 - **FIX**: pin normalize 0.6.0.
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**(ferry_cache): add `clearOptimisticPatches()` (#459).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).

#### `ferry_exec` - `v0.3.0-dev.3`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_flutter` - `v0.8.0-dev.11`

 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry_flutter): bump version.
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_generator` - `v0.8.0-dev.2`

 - **FIX**: Use Posix separators for output paths (#369).
 - **FIX**: revert broken transitive dependency.
 - **FIX**: upgrade analyzer dependency.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `normalize` - `v0.8.0-dev.4`

 - **REFACTOR**: apply lints fixes (#479).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**: Preserve backwards compatibility with dataIdFromObject (#368).
 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Broken fragment spreads.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **FEAT**(normalize): respect skip/include directives when checking for partial data (#433).

#### `ferry_hive_store` - `v0.5.1-dev.3`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**: add Reviews subscription to test graphql.

#### `ferry_store` - `v0.5.1-dev.3`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

#### `ferry_test_graphql2` - `v0.2.1-dev.2`

 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).


## 2023-04-30

### Changes

---

Packages with breaking changes:

 - [`ferry` - `v0.14.0-dev.6`](#ferry---v0140-dev6)
 - [`ferry_cache` - `v0.7.1-dev.3`](#ferry_cache---v071-dev3)
 - [`ferry_exec` - `v0.3.0-dev.2`](#ferry_exec---v030-dev2)
 - [`ferry_flutter` - `v0.8.0-dev.10`](#ferry_flutter---v080-dev10)
 - [`ferry_generator` - `v0.8.0-dev.1`](#ferry_generator---v080-dev1)
 - [`normalize` - `v0.8.0-dev.3`](#normalize---v080-dev3)

Packages with other changes:

 - [`ferry_hive_store` - `v0.5.1-dev.2`](#ferry_hive_store---v051-dev2)
 - [`ferry_store` - `v0.5.1-dev.2`](#ferry_store---v051-dev2)
 - [`ferry_test_graphql2` - `v0.2.1-dev.1`](#ferry_test_graphql2---v021-dev1)

---

#### `ferry` - `v0.14.0-dev.6`

 - **REFACTOR**(ferry): FetchPolicyTypedLink.request() to avoid pending timers in tests (#427).
 - **REFACTOR**(ferry): use scheduleMicrostask instead of Future.delayed in order to no have pending timers in widget tests.
 - **FIX**(ferry): Re-use the same stream for multiple requests when possible (#487).
 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry): send error to main isolate when data message could not be serialized (#455).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry): remove broken isolateSpawn functionality, FlutterIsolate does not support passing functions (#413).
 - **FIX**: pin normalize 0.6.0.
 - **FIX**(ferry): call cache handlers for every response from DataSource.Link.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add watchQuery, watchFragment, clearOptimisticPatches to IsolateClient  (#460).
 - **FEAT**(ferry): improve isolate error handling (#448).
 - **FEAT**(ferry): verify that updateResult function can be sent to the other isolate in debug mode using asserts and provide a better error message if updatgeResult cannot be serialized (#425).
 - **FEAT**(ferry): refactor isolateCommands, add addRequestToRequestController method (#422).
 - **FEAT**(ferry): add removeOptimisticResponse to isolate client (#412).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(ferry): fix typo in CHANGELOG (#384).
 - **DOCS**: remove stale code (#271).
 - **BREAKING** **FIX**(ferry): remove optimistic patch when listener unsubscribes before link responds with data instead of leaking optimistic patch forever (#466).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_cache` - `v0.7.1-dev.3`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_cache): use jsonMapEquals instead of DeepCollectionEquality.equals() to avoid it's O(n^2) complexity, remove duplicated .distinct() call (#477).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry_cache): fix cache emits update too often (#411).
 - **FIX**(ferry_cache): fix regression in watch() methods by making changeStream emit when new item is added to the cache (#403).
 - **FIX**(cache): Fix memory leak. (#385).
 - **FIX**: add possibleTypes to every function that can use it of normalize (#380).
 - **FIX**: pin normalize 0.6.0.
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**(ferry_cache): add `clearOptimisticPatches()` (#459).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).

#### `ferry_exec` - `v0.3.0-dev.2`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_flutter` - `v0.8.0-dev.10`

 - **FIX**(ferry): add stacktrace to error handler in GqlTypedLink (#467).
 - **FIX**(ferry_flutter): bump version.
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_generator` - `v0.8.0-dev.1`

 - **FIX**: Use Posix separators for output paths (#369).
 - **FIX**: revert broken transitive dependency.
 - **FIX**: upgrade analyzer dependency.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `normalize` - `v0.8.0-dev.3`

 - **REFACTOR**: apply lints fixes (#479).
 - **FIX**(normalize): When there are dangling references in child objects of a list, by default do not treat the whole entity as partial data, but remove it from the list. This can be configured using the allowDanglingReference parameter.
 - **FIX**: Preserve backwards compatibility with dataIdFromObject (#368).
 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Broken fragment spreads.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **FEAT**(normalize): respect skip/include directives when checking for partial data (#433).

#### `ferry_hive_store` - `v0.5.1-dev.2`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**: add Reviews subscription to test graphql.

#### `ferry_store` - `v0.5.1-dev.2`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

#### `ferry_test_graphql2` - `v0.2.1-dev.1`

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).


## 2023-04-30

### Changes

---

Packages with breaking changes:

 - [`ferry` - `v0.14.0-dev.2`](#ferry---v0140-dev2)
 - [`ferry_cache` - `v0.7.1-dev.2`](#ferry_cache---v071-dev2)
 - [`ferry_exec` - `v0.3.0-dev.1`](#ferry_exec---v030-dev1)
 - [`ferry_flutter` - `v0.8.0-dev.2`](#ferry_flutter---v080-dev2)
 - [`ferry_generator` - `v0.8.0-dev.1`](#ferry_generator---v080-dev1)
 - [`normalize` - `v0.8.0-dev.2`](#normalize---v080-dev2)

Packages with other changes:

 - [`ferry_hive_store` - `v0.5.1-dev.1`](#ferry_hive_store---v051-dev1)
 - [`ferry_store` - `v0.5.1-dev.1`](#ferry_store---v051-dev1)
 - [`ferry_test_graphql2` - `v0.2.1-dev.1`](#ferry_test_graphql2---v021-dev1)

---

#### `ferry` - `v0.14.0-dev.2`

 - **REFACTOR**(ferry): FetchPolicyTypedLink.request() to avoid pending timers in tests (#427).
 - **REFACTOR**(ferry): use scheduleMicrostask instead of Future.delayed in order to no have pending timers in widget tests.
 - **FIX**(ferry): send error to main isolate when data message could not be serialized (#455).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry): remove broken isolateSpawn functionality, FlutterIsolate does not support passing functions (#413).
 - **FIX**: pin normalize 0.6.0.
 - **FIX**(ferry): call cache handlers for every response from DataSource.Link.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**(ferry): add watchQuery, watchFragment, clearOptimisticPatches to IsolateClient  (#460).
 - **FEAT**(ferry): improve isolate error handling (#448).
 - **FEAT**(ferry): verify that updateResult function can be sent to the other isolate in debug mode using asserts and provide a better error message if updatgeResult cannot be serialized (#425).
 - **FEAT**(ferry): refactor isolateCommands, add addRequestToRequestController method (#422).
 - **FEAT**(ferry): add removeOptimisticResponse to isolate client (#412).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **DOCS**(ferry): fix typo in CHANGELOG (#384).
 - **DOCS**: remove stale code (#271).
 - **BREAKING** **FIX**(ferry): remove optimistic patch when listener unsubscribes before link responds with data instead of leaking optimistic patch forever (#466).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_cache` - `v0.7.1-dev.2`

 - **REFACTOR**(ferry_cache): use jsonMapEquals instead of DeepCollectionEquality.equals() to avoid it's O(n^2) complexity, remove duplicated .distinct() call (#477).
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FIX**(ferry_cache): fix cache emits update too often (#411).
 - **FIX**(ferry_cache): fix regression in watch() methods by making changeStream emit when new item is added to the cache (#403).
 - **FIX**(cache): Fix memory leak. (#385).
 - **FIX**: add possibleTypes to every function that can use it of normalize (#380).
 - **FIX**: pin normalize 0.6.0.
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**(ferry_cache): add `clearOptimisticPatches()` (#459).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).

#### `ferry_exec` - `v0.3.0-dev.1`

 - **REFACTOR**: apply lints fixes (#479).
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FIX**(ferry_cache): ensure emitting only one update per updated data ID in cache in watchQuery/watchFragment (#416).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_flutter` - `v0.8.0-dev.2`

 - **FIX**(ferry_flutter): bump version.
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `ferry_generator` - `v0.8.0-dev.1`

 - **FIX**: Use Posix separators for output paths (#369).
 - **FIX**: revert broken transitive dependency.
 - **FIX**: upgrade analyzer dependency.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).
 - **FEAT**(ferry): add IsolateClient (#405).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **CHORE**: update gql_code_builder, gql_exec and vestigial analyzer pubspec entry.

#### `normalize` - `v0.8.0-dev.2`

 - **FIX**: Preserve backwards compatibility with dataIdFromObject (#368).
 - **FIX**: Streamline typename handling (#359).
 - **FIX**: Broken fragment spreads.
 - **FIX**(ferry): add dispose method to TypedLinks (#272).
 - **FEAT**: generate possibleTypesMap in ferry_generator (#371).
 - **FEAT**: add Reviews subscription to test graphql.
 - **BREAKING** **FIX**(ferry_generator): properly generate nullable types for nullable elements in Lists (#445).
 - **BREAKING** **FEAT**(normalize): respect skip/include directives when checking for partial data (#433).

#### `ferry_hive_store` - `v0.5.1-dev.1`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).
 - **FEAT**: add Reviews subscription to test graphql.

#### `ferry_store` - `v0.5.1-dev.1`

 - **REFACTOR**: apply lints fixes (#479).
 - **FEAT**(ferry_hive_store): use jsonMapEquals instead of DeepCollectionEquality().equals to avoid it's O(n^2) complexity, add distinct: param to watch() method (#475).

#### `ferry_test_graphql2` - `v0.2.1-dev.1`

 - **REFACTOR**: fix dependencies.
 - **REFACTOR**(ferry_exec): remove cyclic dependency ferry_exec <-> ferry_test_graphql.
 - **FEAT**(ferry_generator): when/maybeWhen extensions (#470).

