---
slug: /
id: intro
title: Introduction
---

Ferry is a highly productive, full-featured, extensible GraphQL Client for Flutter & Dart. [**Get started**](setup.md) with ferry now.

## 🚀 Productive

Ferry is **fully typed**, allowing you to work faster and safer with compile time checks and IDE autocomplete, including fully typed Cache [reads and writes](cache-interaction.md).

Ferry's built-in [code generator](codegen.md) creates immutable data classes for all your GraphQL Operations and Fragments based on your GraphQL schema.

Use the client with any Link from the [gql_link](https://pub.dev/packages/gql_link) ecosystem.

## 💯 Full-Featured

Ferry includes all the features you'd expect in a GraphQL client, including:

1. **Normalized Optimistic Cache**: keep data in sync with cache normalization and update your UI instantly with optimistic data.
2. **Multiple Data Stores**: extensible Store interface for data persistence, including built-in MemoryStore and [HiveStore](setup.md#setup-with-hivestore) (for offline persistence).
3. **Cache Eviction & Garbage Collection**: selectively [remove data](garbage-collection.md#cacheevict) from the cache or use the built-in [garbage collection](garbage-collection.md#cachegc) to remove stale data automatically
4. **Refetch & Pagination**: easily [update responses](pagination.md#refetching) with new data or combine multiple responses, allowing for seamless [pagination](pagination.md#pagination).
5. **Flutter Widget**: use the included [Operation](flutter.md) Widget in your Flutter app.

## 💪 Extensible

Ferry's core features are implemented as composable `TypedLink`s, a typed version of the [gql_link](https://pub.dev/packages/gql_link) API. In fact, the Ferry Client itself is a `TypedLink`, created by composing several other [core links](customization.md#core-typedlinks). This architecture makes extending or [customizing the client](customization.md) extremely easy.
