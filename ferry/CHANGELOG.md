## 0.10.4-dev.0+1

 - **FIX**: move pedantic to dependency (#257).

## 0.10.4

 - **FEAT**: update dependences.
 - **FEAT**: update dependences.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.10.3

 - **FEAT**: update dependences.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.10.2+2

 - Update a dependency to the latest release.

## 0.10.2+1

 - **FIX**: resolve static analysis issues.
 - **FIX**: resolve static analysis issues.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.10.2

 - **FIX**: resolve static analysis issues.
 - **FEAT**: migrate to null safety.
 - **FEAT**: migrate to null safety.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.10.1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.10.1-0.1.nullsafety.1

 - **FIX**: update build_runner.

## 0.10.1-0.1.nullsafety.0

 - **FEAT**: migrate to null safety.
 - **CHORE**: bump versions to match melos style.
 - **CHORE**: publish packages.
 - **CHORE**: prepare changelogs for melos.

## 0.10.0-1.0.nullsafety.0

 - **FEAT**: migrate to null safety.
 - **CHORE**: prepare changelogs for melos.

## [0.10.0-nullsafety.0]

- add initial null safety support

## [0.9.4]

- catch Stream error events in `ErrorTypedLink`
- include `ErrorTypedLink` in the default client `TypedLink` chain
- update dependencies

## [0.9.3]

- fix bug causing `FetchPolicy.CacheFirst` & `FetchPolicy.CacheAndNetwork` to only receive the first response from Link

## [0.9.2]

- update dependencies

## [0.9.1] - 2020-11-15

### Added

- add eviction and garbage collection methods to `CacheProxy`
- bump `ferry_cache` version

## [0.9.0] - 2020-11-09

### Changed

- bump `ferry_cache` version
- `OperationRequest.requestId` no longer assigned `uuid` by default
- `CacheProxy.writeQuery` and `CacheProxy.writeFragment` now use the entire optimistic request rather than just the requestId
- update `OfflineMutationTypedLink` to not depend on `requestId` as it is no longer assigned by default
- bump `normalize` version

## [0.8.0] - 2020-10-10

### Changed

- Client is now a `TypedLink`
- All plugins reimplemented as `TypedLink`s
- `Client.responseStream` is now `Client.request`
- upgrade `rxdart` to latest version

### Removed

- `OperationRequest`, `OperationResponse`, and `FragmentRequest` moved to `ferry_exec`

## [0.7.6] - 2020-10-07

### Changed

- Cache.watchQuery no longer depends on entire data object

## [0.7.5] - 2020-09-29

### Changed

- Bump `normalize` version

## [0.7.4] - 2020-09-10

### Changed

- Bump `normalize` version

## [0.7.3] - 2020-09-09

### Changed

- Bump `normalize` version
- Export policies in ferry and cache

## [0.7.2] - 2020-09-09

### Added

- Add `identify` method
- Add `evict` method
- Add `gc` method
- Add `retain` method
- Add `release` method

### Changed

- Use latest `normalize` version
- Expose store from cache

## [0.7.1] - 2020-09-07

### Changed

- Use latest `normalize` version

## [0.7.0] - 2020-09-04

### Added

- Implement plugin system
- Add [OfflineMutationPlugin]

### Changed

- Convert addTypename into plugin
- Convert updateResult into plugin
- Convert updateCache into plugin

## [0.6.0] - 2020-08-30

### Added

- Add `clear()` method to Cache
- Add `dispose()` method to Cache

### Changed

- Merge `ferry_cache` into `ferry` package.
- Use full types for cache methods
- Update `ferry_store` dependencies
- Export Cache from `package:ferry/cache.dart`.

## [0.5.1+2] - 2020-08-29

### Changed

- Fix pub.dev issues

## [0.5.1+1] - 2020-08-29

### Changed

- Update README and point to docs site

## [0.5.1] - 2020-08-26

### Changed

- fixes updateResult when more than two results are merged

## [0.5.0] - 2020-08-24

### Changed

- use typed data in `CacheProxy` methods
- bump `normalize` version
- bump `ferry_cache` version
- rename `QueryRequest` and `QueryResponse` to `OperationRequest` and `OperationResponse`
- rename `queryId` to `requestId`

## [0.4.1] - 2020-06-16

### Changed

- bump normalize version

## [0.4.0] - 2020-04-22

### Changed

- restructure package to use monorepo

## [0.3.1] - 2020-04-22

### Changed

- fixed which QueryResponses are caught by responseStream

## [0.3.0] - 2020-04-22

### Added

- `LinkExceptions` are now caught and included in the `QueryResponse.linkException` property
- added `QueryResponse.dataSource` property
- added basic tests for GraphQL and network errors
- added `Mutation` widget
- added `executeOnListen` flag on `responseStream`

### Changed

- updated default subscription `FetchPolicy` to `CacheAndNetwork`
- override equality for `QueryResponse`
- update example

### Removed

- **BREAKING** removed optimistic flag on `QueryResponse` in favor of source property
- **BREAKING** removed client error from `Query` widget
- remove broken `FetchPolicy` tests

## [0.2.2] - 2020-02-29

### Changed

- `QueryRequest` now extends `Request`
- update `req_builder` to use new URI fragments
- add `QueryReqeust.copyWith`
- add `clientError` object to `Query` Widget
- `req_builder` no longer assigns a unique `queryId` if none is provided

### Removed

- Removed Options objects

## [0.2.1] - 2020-02-22

### Changed

- use latest versions of `gql_build` and `gql_code_builder`

## [0.2.0] - 2020-02-22

### Changed

- rename to "ferry"
- move repo to gql-dart

## [0.1.3] - 2020-02-21

### Changed

- remove 'GQL' prefix
- use latest version of gql_build
- update example

## [0.1.2] - 2020-02-14

### Changed

- update dependencies
- fix erroneous import

## [0.1.1] - 2020-02-14

### Changed

- export CacheProxy

## [0.1.0] - 2020-02-12

### Changed

- **BREAKING** convert options to use built_value

## [0.0.3] - 2020-02-08

### Changed

- update example

## [0.0.2] - 2020-02-08

### Removed

- Remove custom network error
- Remove unnecessary readme code

## [0.0.1] - 2020-02-05

### Added

- Initial release
