---
id: pagination
title: Pagination & Refetching
---

Fetching new data for an `OperationRequest` in Ferry is as easy as adding an updated request to the `Client.requestController`. Ferry will automatically include the results from the updated request in the response Stream of the original request if:

1. The updated request is identical to the original request, OR
2. The updated request has the same (non-null) `requestId` as the original request

## Refetching

For example, if we are listening to the following request:

```dart
final reviewsReq = GReviewsReq(
  (b) => b
    ..vars.first = 3
    ..vars.offset = 0,
);

client.request(reviewsReq).listen((response) => print(response));
```

We can refetch the query by adding the same request to the `requestController`:

```dart
client.requestController.add(reviewsReq);
```

Once the response is received, any `request()` Streams that were listening to `reviewsReq` will get updated with the new data. 

:::note
Since refetching doesn't override the `FetchPolicy` setting, if `FetchPolicy` is set to `CacheFirst`, you'll get the cached results of the initial operation.
:::

## Pagination

Rather than just replacing the previous result with the refetched result, we may want to combine the results to enable pagination.

To do this, we first need to update our original request to include a `requestId`. This will tell Ferry to include any results from subsequent requests with the same `requestId` in this request's result stream.

```dart {3}
final reviewsReq = GReviewsReq(
  (b) => b
    ..requestId = 'MyReviewsReq'
    ..vars.first = 3
    ..vars.offset = 0,
);

client.request(reviewsReq).listen((response) => print(response));
```

Now we can create a copy of our request that will fetch the next set of results and include an `updateResult` calback that tells ferry how to combine the results.

For example, let's fetch the next 3 reviews.

```dart
final nextReviewsReq = reviewsReq.rebuild(
  (b) => b
    ..vars.offset = 3
    ..updateResult = (previous, result) =>
        previous?.rebuild((b) => b..reviews.addAll(result.reviews)) ??
        result,
);

client.requestController.add(nextReviewsReq);
```

:::note

Since we are using the `rebuild()` method, our `newsReviewsReq` will copy the `requestId` we defined in `reviewsReq` above automatically. Otherwise, we'd need to specify the `requestId` manuallly.

:::

The next event received by our `request()` Stream will now include all six reviews.
