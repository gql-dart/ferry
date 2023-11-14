---
id: how-it-works
title: How It Works
---

When you run the Ferry [code generator](codegen.md), it searches your `src` directory for `.graphql` files and creates an `OperationRequest` class for every Query, Mutation, and Subscription it finds. The request includes everything needed to execute the operation, including the operation itself, any variables, optimistic data, etc.

You can execute these requests by passing them to `Client.request()`, which adds the request to the `Client.requestController`, and listening to the returned Stream for an `OperationResponse`. Responses are resolved by either the provided [Link](https://pub.dev/packages/gql_link) or from the [Cache](cache-configuration.md), depending on the request's [FetchPolicy](fetch-policies.md).

Results can be [refetched](pagination.md#refetching) or [paginated](pagination.md#pagination) by manually adding additional requests to the `Client.requestController`.

![Ferry request architecture](/img/request-response.jpg)

## Packages

Ferry is made up of several individual packages:

| Pub                                                                      | Package                                                     | Description                                     |
| ------------------------------------------------------------------------ | ----------------------------------------------------------- | ----------------------------------------------- |
| [![version][package:ferry:version]][package:ferry]                       | [package:ferry][package:ferry:source]                       | Core TypedLinks, including the Client itself    |
| [![version][package:ferry_cache:version]][package:ferry_cache]           | [package:ferry_cache][package:ferry_cache:source]           | Normalized, strongly typed optimistic cache     |
| [![version][package:ferry_exec:version]][package:ferry_exec]             | [package:ferry_exec][package:ferry_exec:source]             | Strongly typed GraphQL execution interface      |
| [![version][package:ferry_flutter:version]][package:ferry_flutter]       | [package:ferry_flutter][package:ferry_flutter:source]       | Flutter Widgets for GraphQL Operations          |
| [![version][package:ferry_generator:version]][package:ferry_generator]   | [package:ferry_generator][package:ferry_generator:source]   | Dart Type Generator for GraphQL Operations      |
| [![version][package:ferry_store:version]][package:ferry_store]           | [package:ferry_store][package:ferry_store:source]           | Data Persistence for `ferry_cache`              |
| [![version][package:ferry_hive_store:version]][package:ferry_hive_store] | [package:ferry_hive_store][package:ferry_hive_store:source] | Hive implementation of `ferry_store`            |
| [![version][package:normalize:version]][package:normalize]               | [package:normalize][package:normalize:source]               | Normalization / denormalization of GraphQL data |

[package:ferry:source]: https://github.com/gql-dart/ferry/tree/master/packages/ferry
[package:ferry]: https://pub.dartlang.org/packages/ferry
[package:ferry:version]: https://img.shields.io/pub/v/ferry.svg?style=flat-square
[package:ferry_cache:source]: https://github.com/gql-dart/ferry/tree/master/packages/ferry_cache
[package:ferry_cache]: https://pub.dartlang.org/packages/ferry_cache
[package:ferry_cache:version]: https://img.shields.io/pub/v/ferry_cache.svg?style=flat-square
[package:ferry_exec:source]: https://github.com/gql-dart/ferry/tree/master/packages/ferry_exec
[package:ferry_exec]: https://pub.dartlang.org/packages/ferry_exec
[package:ferry_exec:version]: https://img.shields.io/pub/v/ferry_exec.svg?style=flat-square
[package:ferry_flutter:source]: https://github.com/gql-dart/ferry/tree/master/packages/ferry_flutter
[package:ferry_flutter]: https://pub.dartlang.org/packages/ferry_flutter
[package:ferry_flutter:version]: https://img.shields.io/pub/v/ferry_flutter.svg?style=flat-square
[package:ferry_generator:source]: https://github.com/gql-dart/ferry/tree/master/packages/ferry_generator
[package:ferry_generator]: https://pub.dartlang.org/packages/ferry_generator
[package:ferry_generator:version]: https://img.shields.io/pub/v/ferry_generator.svg?style=flat-square
[package:ferry_store:source]: https://github.com/gql-dart/ferry/tree/master/packages/ferry_store
[package:ferry_store]: https://pub.dartlang.org/packages/ferry_store
[package:ferry_store:version]: https://img.shields.io/pub/v/ferry_store.svg?style=flat-square
[package:ferry_hive_store:source]: https://github.com/gql-dart/ferry/tree/master/packages/ferry_hive_store
[package:ferry_hive_store]: https://pub.dartlang.org/packages/ferry_hive_store
[package:ferry_hive_store:version]: https://img.shields.io/pub/v/ferry_hive_store.svg?style=flat-square
[package:normalize:source]: https://github.com/gql-dart/ferry/tree/master/packages/normalize
[package:normalize]: https://pub.dartlang.org/packages/normalize
[package:normalize:version]: https://img.shields.io/pub/v/normalize.svg?style=flat-square
