---
id: customization
title: Customizing the Client
---

Ferry is built to be modular and extensible. Ferry's core features are implemented as composable `TypedLink`s, a typed version of the [gql_link](https://pub.dev/packages/gql_link) API. In fact, the Ferry Client itself is a TypedLink, created by composing several other [core links](#core-typedlinks).

A TypedLink is simply a class with a `request()` method which returns a Stream of `OperationResponse`s.

For example, here's the link that Ferry uses internally to resolve requests from the [ferry_cache](cache-configuration.md):

```dart
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_cache/ferry_cache.dart';

export 'package:ferry_cache/ferry_cache.dart';

/// A terminating link that fetches the operation from the Cache, mapping the
/// result to an [OperationResponse].
class CacheTypedLink extends TypedLink {
  final Cache cache;

  CacheTypedLink(Cache cache) : cache = cache ?? Cache();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest, [
    forward,
  ]) =>
      cache.watchQuery(operationRequest).map(
            (data) => OperationResponse(
              operationRequest: operationRequest,
              data: data,
              dataSource: DataSource.Cache,
            ),
          );
}
```

## Forwarding TypedLinks

Not all links need to resolve the request directly. Some links simply modify the request or response stream by calling the `forward()` callback on the `request()` method. This defers resolution of the request to the next link in the chain.

For example, ferry uses the following link to automatically add "_\_\_typename_" fields to each node of the GraphQL operation.

```dart
import 'dart:async';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql/ast.dart';
import 'package:normalize/utils.dart';
import 'package:ferry_exec/ferry_exec.dart';

/// Adds `__typename` to each node of the operation.
class AddTypenameTypedLink extends TypedLink {
  const AddTypenameTypedLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> req, [
    forward,
  ]) =>
      forward(_addTypename(req));

  OperationRequest<TData, TVars> _addTypename<TData, TVars>(
    OperationRequest<TData, TVars> request,
  ) =>
      (request as dynamic).rebuild(
        (b) => b
          ..operation = Operation(
            document: transform(
              request.operation.document,
              [AddTypenameVisitor()],
            ),
            operationName: request.operation.operationName,
          ),
      );
}
```

## Chaining TypedLinks Together

TypedLinks can be chained together using the `TypedLink.from()` method.

The following will create a link that adds "_\_\_typename_" fields to the request, then resolves the request from the Cache:

```dart
final myTypedLink = TypedLink.from([
  AddTypenameTypedLink(),
  CacheTypedLink(),
]);
```

You can then use this link to execute requests by listening to the Stream returned by the `request()` method:

```dart
myTypedLink.request(GMyQueryReq()).listen((data) => print(data));
```

### Ordering Your TypedLink Chains

There are a few important guidelines that you should follow when chaining TypedLinks to ensure that your requests get executed correctly.

1. If you are using a link that originates requests (such as _RequestControllerTypedLink_), it should be the first link in the chain.
2. The final link in the chain must be a "terminating" link, i.e. a link that does not forward the request down the chain.

:::warning

## Don't Chain the Ferry Client Directly

You generally shoudn't chain the Ferry Client together with other TypedLinks. Since the Client's composition chain starts with a _RequestControllerTypedLink_ and ends with a terminating link, adding a link before or after it would violate the above [guidelines](#ordering-your-typedlink-chains) and lead to unexpected results.

Instead, you can simply use the [underlying links that Client composes](https://github.com/gql-dart/ferry/blob/5a7defb522b3ea64327602f06d6d652f31eceb20/ferry/lib/ferry.dart#L39), adding your custom link to compose your own custom chain.

:::

## Core TypedLinks

The ferry Client is created by composing these core TypedLinks.

- **Client**: The Ferry Client itself is a TypedLink, implemented by composing other core TypedLinks.
- **AddTypenameTypedLink**: Adds "_\_\_typename_" to each node of the operation.
- **CacheTypedLink**: A terminating link that fetches the operation from the Cache.
- **FetchPolicyTypedLink**: A terminating link that resolves an operation from the Link or the Cache based on the request's `FetchPolicy`, possibly caching the response.
- **GqlTypedLink**: A terminating link which defers execution to the provided [gql_link](https://pub.dev/packages/gql_link). Any errors received by the [gql_link](https://pub.dev/packages/gql_link) are included in the `OperationResponse.linkException`.
- **OptimisticTypedLink**: Returns the response stream from the next link in the chain, immediately emitting a response with the optimistic data.
- **RequestControllerTypedLink**: Allows multiple requests to be made by adding requests to the `requestController`.
- **UpdateCacheTypedLink**: Runs any specified `UpdateCacheHandler`s with a `CacheProxy` when
  1. an optimistic response is received
  2. the first time a non-optimistic response is received

## Additional TypedLinks

Ferry includes some additional `TypedLink`s that are not included in the default client. You can use these to compose your own client.

- **OfflineMutationTypedLink**: Caches mutations in a `hive` box when offline and re-runs them when re-connected. This link must be between a `RequestControllerTypedLink` and the terminating link.
