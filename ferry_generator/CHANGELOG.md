# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.2] - 2020-12-06

### Changed

- bump `gql_build` and `gql_code_builder` versions

## [0.3.1] - 2020-11-09

### Changed

- don't assign default `OperationRequest.requestId`s

### Removed

- remove `uuid` dependency

## [0.3.0] - 2020-10-11

### Changed

- use `ferry_exec`
- add `executeOnListen` default value

## [0.2.1] - 2020-09-08

### Changed

- use latest `gql_build`

## [0.2.0] - 2020-08-24

### Added

- Add generated `FragmentRequest`s

### Changed

- bump `gql_build` & `gql_code_builder` versions
- rename `QueryRequest` to `OperationRequest`
- assign a default `OperationRequest.requestId` using the `uuid` package

## [0.1.0] - 2020-05-10

### Added

- initial release as an independent package
