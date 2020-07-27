<p align="center">
  <img src="https://raw.githubusercontent.com/gql-dart/ferry/master/logo.jpg" width="450px">
</p>
<h2 align="center">Stream Based GraphQL Client for Dart</h2>

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
[discord-link]: https://discord.gg/NryjpVa

A GraphQL client for Dart / Flutter.

- [Getting Started](#getting-started)
- [Features](#features)
- [Packages](#packages)


# Getting Started

See the `ferry` client package directory for [usage instructions](https://github.com/gql-dart/ferry/tree/master/ferry).

# Features

| Feature                                                                                              | Progress |
| :--------------------------------------------------------------------------------------------------- | :------: |
| Generated Fully Typed Queries and Responses (using `gql_build`)                                      |    ✅     |
| Customizable `Link`s (using `gql_link`)                                                              |    ✅     |
| Optimistic Cache                                                                                     |    ✅     |
| Multiple data stores, including `MemoryStore` and `HiveStore` (using `hive` for offline persistence) |    ✅     |
| Update queries with additional data (e.g. for pagination)                                             |    ✅     |
| Flutter Widgets                                                                                      |    ✅     |
| Offline Mutations                                                                                    |    🔜     |

# Packages

Monorepo for `ferry` and related packages.


| Pub                                                                      | Package                                                       | Description                                     |
| ------------------------------------------------------------------------ | ------------------------------------------------------------- | ----------------------------------------------- |
| [![version][package:ferry:version]][package:ferry]                       | [`package:ferry`][package:ferry:source]                       | Stream-based GraphQL Client                     |
| [![version][package:ferry_cache:version]][package:ferry_cache]           | [`package:ferry_cache`][package:ferry_cache:source]           | Normalized GraphQL Cache                        |
| [![version][package:ferry_flutter:version]][package:ferry_flutter]       | [`package:ferry_flutter`][package:ferry_flutter:source]       | Flutter Widgets for GraphQL Operations          |
| [![version][package:ferry_generator:version]][package:ferry_generator]   | [`package:ferry_generator`][package:ferry_generator:source]   | Dart Type Generator for GraphQL Operations      |
| [![version][package:ferry_store:version]][package:ferry_store]           | [`package:ferry_store`][package:ferry_store:source]           | Data Persistence for `ferry_cache`              |
| [![version][package:ferry_hive_store:version]][package:ferry_hive_store] | [`package:ferry_hive_store`][package:ferry_hive_store:source] | Hive implementation of `ferry_store`            |
| [![version][package:normalize:version]][package:normalize]               | [`package:normalize`][package:normalize:source]               | Normalization / denormalization of GraphQL data |

[package:ferry:source]: ./ferry/README.md
[package:ferry]: https://pub.dartlang.org/packages/ferry
[package:ferry:version]: https://img.shields.io/pub/v/ferry.svg?style=flat-square 
[package:ferry_cache:source]: ./ferry_cache/README.md
[package:ferry_cache]: https://pub.dartlang.org/packages/ferry_cache
[package:ferry_cache:version]: https://img.shields.io/pub/v/ferry_cache.svg?style=flat-square
[package:ferry_flutter:source]: ./ferry_flutter/README.md
[package:ferry_flutter]: https://pub.dartlang.org/packages/ferry_flutter
[package:ferry_flutter:version]: https://img.shields.io/pub/v/ferry_flutter.svg?style=flat-square 
[package:ferry_generator:source]: ./ferry_generator/README.md
[package:ferry_generator]: https://pub.dartlang.org/packages/ferry_generator
[package:ferry_generator:version]: https://img.shields.io/pub/v/ferry_generator.svg?style=flat-square 
[package:ferry_store:source]: ./ferry_store/README.md
[package:ferry_store]: https://pub.dartlang.org/packages/ferry_store
[package:ferry_store:version]: https://img.shields.io/pub/v/ferry_store.svg?style=flat-square 
[package:ferry_hive_store:source]: ./ferry_hive_store/README.md
[package:ferry_hive_store]: https://pub.dartlang.org/packages/ferry_hive_store
[package:ferry_hive_store:version]: https://img.shields.io/pub/v/ferry_hive_store.svg?style=flat-square 
[package:normalize:source]: ./normalize/README.md
[package:normalize]: https://pub.dartlang.org/packages/normalize
[package:normalize:version]: https://img.shields.io/pub/v/normalize.svg?style=flat-square 

