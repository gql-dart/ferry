---
id: cache-interaction
title: Reading and Writing Data to the Cache
sidebar_label: Reading and Writing
---

Ferry provides the following methods for reading and writing data to the cache:

- [`readQuery`](#readquery) and [`readFragment`](#readfragment)
- [`writeQuery` and `writeFragment`](#writequery-and-writefragment)

These methods are described in detail below.

All code samples below assume that you have initialized an instance of `Cache`.

## `readQuery`

The `readQuery` method enables you to run a GraphQL query directly on your cache.

1. If your cache contains all of the data necessary to fulfill a specified query, `readQuery` returns a data object in the shape of that query, just like a GraphQL server does.

2. If your cache _doesn't_ contain all of the data necessary to fulfill a specified query, `readQuery` returns null. It _never_ attempts to fetch data from a remote server.

Let's assume we've created the following `reviews.graphql` file and [generated](codegen.md) our GraphQL classes.

```graphql
query Reviews($first: Int, $offset: Int) {
  reviews(first: $first, offset: $offset) {
    id
    stars
    commentary
  }
}
```

We can then read our Query like so:

```dart
final reviewsReq = GReviewsReq();

final reviewData = cache.readQuery(reviewsReq);
```

You can provide GraphQL variables to `readQuery` like so:

```dart
final reviewsReq = GReviewsReq(
  (b) => b
    ..vars.first = 5
    ..vars.offset = 0,
);

final reviewData = cache.readQuery(reviewsReq);
```

## `readFragment`

The `readFragment` method enables you to read data from _any_ normalized cache object that was stored as part of _any_ query result. Unlike with `readQuery`, calls to `readFragment` do not need to conform to the structure of one of your data graph's supported queries.

For example, if we have the following `hero_data.graphql` file:

```graphql
fragment ReviewFragment on Review {
  stars
  commentary
}
```

We could read the generated fragment like so:

```dart
final reviewFragmentReq = GReviewFragmentReq(
  (b) => b..idFields = {'id': '123'},
);

final reviewFragmentData = cache.readFragment(reviewFragmentReq);
```

The `idFields` argument is the set of [unique identifiers](cache-configuration.md#generating-unique-identifiers) and their values for the object you want to read from the cache. By default, this is the value of the object's `id` field, but you can [customize this behavior](cache-configuration.md#generating-unique-identifiers).

In the example above:

- If a `Review` object with an `id` of `123` is _not_ in the cache,
  `readFragment` returns `null`.
- If the `Review` object _is_ in the cache but it's
  missing either a `stars` or `commentary` field, `readFragment` returns `null`.

## `writeQuery` and `writeFragment`

In addition to reading arbitrary data from the cache, you can _write_ arbitrary data to the cache with the `writeQuery` and `writeFragment` methods.

:::note
Any changes you make to cached data with `writeQuery` and `writeFragment` are not pushed to your GraphQL server.
:::

These methods have the same signature as their `read` counterparts, except they require an additional `data` variable.

For example, the following call to `writeFragment` _locally_ updates the `Review` object with an `id` of `123`:

```dart
final reviewFragmentReq = GReviewFragmentReq(
  (b) => b..idFields = {'id': '123'},
);

final reviewFragmentData = GReviewFragmentData(
  (b) => b
    ..stars = 5
    ..commentary = 'I watched it again and loved it',
);

cache.writeFragment(reviewFragmentReq, reviewFragmentData);
```

Any `operationRequest` streams that are listening to this data will be updated accordingly.

## Combining reads and writes

Combine `readQuery` and `writeQuery` to fetch currently cached data and make selective modifications to it.

:::note
Since Ferry's generated classes are based on `built_value`, we can easily create modified copies of them using the `rebuild` method. Check out [this post](https://medium.com/dartlang/darts-built-value-for-immutable-object-models-83e2497922d4) to learn more about `built_value` objects.
:::

The example below updates the star rating for the cached `Review`. Remember, this addition is _not_ sent to your remote server.

```dart
final reviewFragmentReq = GReviewFragmentReq(
  (b) => b..idFields = {'id': review.id},
);

final data = cache.readFragment(reviewFragmentReq);

cache.writeFragment(
  reviewFragmentReq,
  data.rebuild((b) => b..stars = 4),
);
```
