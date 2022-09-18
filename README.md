# ⚠️ Notice: Looking for maintainers

While we are using this package in our own production applications, we don't have the resources to maintain the project beyond our immediate needs. If anyone would like to help maintain the project, we'd be happy to support and empower wherever possible.

<p align="center">
  <img src="https://raw.githubusercontent.com/gql-dart/ferry/master/logo.jpg" width="450px">
</p>
<h1 align="center">A simple, powerful GraphQL Client for Flutter and Dart</h1>

[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-forks-badge]][github-forks-link]
[![Discord][discord-badge]][discord-link]

[license-badge]: https://img.shields.io/github/license/gql-dart/ferry.svg?style=for-the-badge
[license-link]: https://github.com/gql-dart/ferry/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge
[prs-link]: https://github.com/gql-dart/ferry/issues
[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/ferry.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/ferry/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/ferry.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/ferry/stargazers
[github-forks-badge]: https://img.shields.io/github/forks/gql-dart/ferry.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-forks-link]: https://github.com/gql-dart/ferry/network/members
[discord-badge]: https://img.shields.io/discord/559455668810153989.svg?style=for-the-badge&logo=discord&logoColor=ffffff
[discord-link]: https://discord.com/invite/tXTtBfC

# [Documentation](https://ferrygraphql.com/) 📖

# Features

1. ✅ **Fully Typed**: work faster and safer with compile time checks and IDE autocomplete, including fully typed Cache reads and writes.
2. 🔄 **Built-In Code Generators**: automatically generated immutable data classes for all your GraphQL Operations and Fragments, based on your schema.
3. 🌐 **Customizable Network Interface**: highly customizable network interface using `gql_link`, allowing you to compose and extend `Link`s.
4. ✨ **Normalized Optimistic Cache**: keep data in sync with cache normalization and update your UI instantly with optimistic data.
5. 💾 **Multiple Data Stores**: extensible `Store` interface with built-in `MemoryStore` and `HiveStore` (which uses `hive` for offline persistence).
6. 📄 **Refetch & Pagination**: easily update responses with new data or combine multiple responses, allowing for seamless pagination.
7. 📱 **Flutter Widgets**: Widgets for Queries, Mutations, and Subscriptions, available out of the box.
8. 🧈 **Smooth** Run queries in a separate Isolate to free up resources on the UI thread

# Packages

This repo is a monorepo for `ferry` and related packages.

| Pub                                                                      | Package                                                       | Description                                     |
| ------------------------------------------------------------------------ | ------------------------------------------------------------- | ----------------------------------------------- |
| [![version][package:ferry:version]][package:ferry]                       | [`package:ferry`][package:ferry:source]                       | Stream-based GraphQL Client                     |
| [![version][package:ferry_cache:version]][package:ferry_cache]           | [`package:ferry_cache`][package:ferry_cache:source]           | Normalized, strongly typed, optimistic cache    |
| [![version][package:ferry_exec:version]][package:ferry_exec]             | [`package:ferry_exec`][package:ferry_exec:source]             | Strongly typed GraphQL execution interface      |
| [![version][package:ferry_flutter:version]][package:ferry_flutter]       | [`package:ferry_flutter`][package:ferry_flutter:source]       | Flutter Widgets for GraphQL Operations          |
| [![version][package:ferry_generator:version]][package:ferry_generator]   | [`package:ferry_generator`][package:ferry_generator:source]   | Dart Type Generator for GraphQL Operations      |
| [![version][package:ferry_store:version]][package:ferry_store]           | [`package:ferry_store`][package:ferry_store:source]           | Data Persistence for `ferry`'s cache            |
| [![version][package:ferry_hive_store:version]][package:ferry_hive_store] | [`package:ferry_hive_store`][package:ferry_hive_store:source] | Hive implementation of `ferry_store`            |
| [![version][package:normalize:version]][package:normalize]               | [`package:normalize`][package:normalize:source]               | Normalization / denormalization of GraphQL data |

[package:ferry:source]: ./packages/ferry
[package:ferry]: https://pub.dartlang.org/packages/ferry
[package:ferry:version]: https://img.shields.io/pub/v/ferry.svg?style=flat-square
[package:ferry_cache:source]: ./packages/ferry_cache
[package:ferry_cache]: https://pub.dartlang.org/packages/ferry_cache
[package:ferry_cache:version]: https://img.shields.io/pub/v/ferry_cache.svg?style=flat-square
[package:ferry_exec:source]: ./packages/ferry_exec
[package:ferry_exec]: https://pub.dartlang.org/packages/ferry_exec
[package:ferry_exec:version]: https://img.shields.io/pub/v/ferry_exec.svg?style=flat-square
[package:ferry_flutter:source]: ./packages/ferry_flutter
[package:ferry_flutter]: https://pub.dartlang.org/packages/ferry_flutter
[package:ferry_flutter:version]: https://img.shields.io/pub/v/ferry_flutter.svg?style=flat-square
[package:ferry_generator:source]: ./packages/ferry_generator
[package:ferry_generator]: https://pub.dartlang.org/packages/ferry_generator
[package:ferry_generator:version]: https://img.shields.io/pub/v/ferry_generator.svg?style=flat-square
[package:ferry_store:source]: ./packages/ferry_store
[package:ferry_store]: https://pub.dartlang.org/packages/ferry_store
[package:ferry_store:version]: https://img.shields.io/pub/v/ferry_store.svg?style=flat-square
[package:ferry_hive_store:source]: ./packages/ferry_hive_store
[package:ferry_hive_store]: https://pub.dartlang.org/packages/ferry_hive_store
[package:ferry_hive_store:version]: https://img.shields.io/pub/v/ferry_hive_store.svg?style=flat-square
[package:normalize:source]: ./packages/normalize
[package:normalize]: https://pub.dartlang.org/packages/normalize
[package:normalize:version]: https://img.shields.io/pub/v/normalize.svg?style=flat-square
