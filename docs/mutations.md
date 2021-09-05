---
id: mutations
title: Mutations
---

Mutations are executed exactly the same way as [queries](queries.md):

1. Create an instance of the [generated](codegen.md) request class for your Mutation.
2. Call `Client.request()` with your request.
3. Listen to the returned Stream.

### Creating a Request

Let's assume we've created a `CreateReview` Mutation in a file named `create_review.graphql`.

```graphql
# create_review.graphql

mutation CreateReview($review: ReviewInput!) {
  createReview(review: $review) {
    id
    stars
    commentary
  }
}
```

In this case, the review depends on `ReviewInput` which is defined in our schema:

```graphql
# schema.graphql

input ReviewInput {
  # 0-5 stars
  stars: Int!
  # Comment about the movie, optional
  commentary: String
}
```

Running the Ferry [generator](codegen.md) will create a `create_review.req.gql.dart` file with a Class named `GCreateReviewReq`. We can instantiate it like this:

```dart
final createReviewReq = GCreateReviewReq(
  (b) => b
    ..vars.review.stars = 5
    ..vars.review.commentary = "Amazing!!!",
);
```

### Listening to the Request Stream

Now we can execute the mutation and listen for a response like so:

```dart
client.request(createReviewReq).listen((response) => print(response));
```

## Optimistic Updates

We often want our users to be able to see changes they make within our applications instantly.

To achieve this, we can provide our `OperationRequest` with an `optimisticResponse`, which will trigger an `OperationResponse` that includes the optimistic data immediately. Then, once the network response is received from the server, a second `OperationResponse` will be triggered with the network data.

Using the example above, we could include an optimistic response like so:

```dart {5}
final createReviewReq = GCreateReviewReq(
  (b) => b
    ..vars.review.stars = 5
    ..vars.review.commentary = "Amazing!!!"
    ..optimisticResponse.createReview.id = "__optimistic__"
    ..optimisticResponse.createReview.stars = 5
    ..optimisticResponse.createReview.commentary = "Amazing!!!",
);
```

## Updating the Cache

Sometimes we need to update the cache in response to a mutation. Ferry allows arbitrary cache updates following any Operation using `UpdateCacheHandler` callbacks, which run whenever an `OperationResponse` is received.

```dart
typedef UpdateCacheHandler<TData, TVars> = void Function(
  CacheProxy proxy,
  OperationResponse<TData, TVars> response,
);
```

The `CacheProxy` passed to the handler includes methods to read & write data to & from the cache, including `readQuery`, `readFragment`, `writeQuery` and `writeFragment`.

### Creating an `UpdateCacheHandler`

Continuing our example from above, we may want to update our[ `Reviews`](queries.md#creating-a-request) Query with the result of executing the `CreateReview` Mutation. To do so, we'd write the following `UpdateCacheHandler`:

```dart
import './graphql/create_review.data.gql.dart';
import './graphql/create_review.var.gql.dart';

UpdateCacheHandler<GCreateReviewData, GCreateReviewVars> createReviewHandler = (
  proxy,
  response,
) {
  final reviews = proxy.readQuery(reviewsReq) ?? GReviewsData();
  proxy.writeQuery(
    reviewsReq,
    reviews.rebuild(
      (b) => b
        ..reviews.add(
          GReviewsData_reviews.fromJson(
            response.data.createReview.toJson(),
          ),
        ),
    ),
  );
};
```

:::note

Since Dart doesn't yet have algebraic data types, to avoid receiving a type error we must convert our `GCreateReviewData` to Json, then convert it back from Json to a `GReviewsData_reviews` type before adding it to our reviews list.

:::

### Passing Handlers to the Client

If Ferry, the client must be aware of all `UpdateCacheHandler`s. This is slightly different from how other GraphQL clients (like Apollo) work, but it's necessary to enable features such as offline mutations.

Now that we've created our `createReviewHandler`, we can add it to our Client using the key `"createReviewHandler"`, which we'll later use to trigger this handler from our mutation request.

```dart
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry/plugins.dart';

final link = HttpLink("[path/to/endpoint]");
final client = Client(link: link);

final client = Client(
  link: link,
  cache: cache,
  updateCacheHandlers: {
    'createReviewHandler': createReviewHandler,
  },
);
```

### Triggering a Handler

Now we can tell Ferry to trigger our handler when it receives an `OperationResponse` for our mutation.

```dart {8}
final createReviewReq = GCreateReviewReq(
  (b) => b
    ..vars.review.stars = 5
    ..vars.review.commentary = "Amazing!!!"
    ..optimisticResponse.createReview.id = "__optimistic__"
    ..optimisticResponse.createReview.stars = 5
    ..optimisticResponse.createReview.commentary = "Amazing!!!"
    ..updateCacheHandlerKey = "createReviewHandler",
);
```

Since our mutation request includes an optimistic response, our handler will first be run as an optimistic patch using the optimistic data. When the network response is received from the server, the optimistic patch will be discarded and the handler will be run again with the response data from the network.

### Passing Data to a Handler

If you need to pass any contextual data to your handler, Ferry allows you to include a Json Map in your request.

```dart {9}
final createReviewReq = GCreateReviewReq(
  (b) => b
    ..vars.review.stars = 5
    ..vars.review.commentary = "Amazing!!!"
    ..optimisticResponse.createReview.id = "__optimistic__"
    ..optimisticResponse.createReview.stars = 5
    ..optimisticResponse.createReview.commentary = "Amazing!!!"
    ..updateCacheHandlerKey = "createReviewHandler"
    ..updateCacheHandlerContext = { "userId": "123" },
);
```

The data can then be accessed from inside the handler.

```dart
UpdateCacheHandler<GCreateReviewData, GCreateReviewVars> createReviewHandler = (
  proxy,
  response,
) {
  final userId = response.operationRequest.updateCacheHandlerContext["userId"];
  /// [Your Handler Logic]
};
```

:::caution

If you need offline mutation support, be sure to only include valid Json in the `updateCacheHandlerContext`, since this will need to be serialized

:::
