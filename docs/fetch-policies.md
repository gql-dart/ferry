---
id: fetch-policies
title: Fetch Policies
---

A request's `FetchPolicy` determines how it is resolved by Ferry, either from the `gql_link`, from the Cache, or both.

For example, executing the following `reviewsReq` will bypass the cache and return results only from the network.

```dart
final reviewsReq = GAllPokemonReq(
  (b) => b
    ..fetchPolicy = FetchPolicy.NetworkOnly
    ..vars.first = 10
    ..vars.offset = 0,
);
```

Valid options for `FetchPolicy` include:

1. `CacheFirst`: Return result from cache. Only fetch from network if cached result is not available.
2. `CacheAndNetwork`: Return result from cache first (if it exists), then return network result once it's available.
3. `NetworkOnly`: Return result from network, fail if network call doesn't succeed, save to cache.
4. `CacheOnly`: Return result from cache.
5. `NoCache`: Return result from network, fail if network call doesn't succeed, don't save to cache

## Default FetchPolicies

Ferry uses the following defaults for each GraphQL operation type:

1. **Query**: `CacheFirst`
2. **Mutation**: `NetworkOnly`
3. **Subscription**: `CacheAndNetwork`

You can override these defaults by including a `defaultFetchPolicies` map when initializing the client.

```dart
import 'package:ferry/ferry.dart';
import 'package:gql/ast.dart';

final client = Client(
  link: MyLink(),
  defaultFetchPolicies: {
    OperationType.query: FetchPolicy.CacheAndNetwork,
  },
);
```
