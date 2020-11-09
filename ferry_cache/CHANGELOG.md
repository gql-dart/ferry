# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
