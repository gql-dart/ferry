# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.1] - 2020-10-16

### Changed

- upgrade `rxdart` to latest version

## [0.3.0] - 2020-10-07

### Changed

- watch now only watches a specific `dataId`

## [0.2.2] - 2020-09-09

### Added

- add `deleteAll` method

## [0.2.1] - 2020-09-04

### Changed

- fix casting issue in ferry_hive_store

## [0.2.0] - 2020-08-30

### Added

- add tests
- add clear method
- add dispose method

### Changed

- [breaking] use typed box to avoid necessity to recast
- base watch stream on underlying hive watch

### Removed

- remove `toMap()` method

## [0.1.0] - 2020-05-10

### Added

- initial release as an independent package
