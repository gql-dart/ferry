---
id: subscriptions
title: Subscriptions
---

Executing a GraphQL Subscription with Ferry is similar to queries, but with a few key differences:

1. Setting up a WebSocket link for subscriptions
2. Listening to the returned Stream for real-time updates


## Setting up WebSocket Link

First, you need to set up a WebSocket link for subscriptions. You can use the `gql_websocket_link` package for this. To add it to your project, run:
(if using apollo use the TransportWebSocketLink)

```yaml
dependencies:
  gql_websocket_link:
```

create the link:

```dart
Link.split(
    (request) =>
    request.operation.getOperationType() == OperationType.subscription,
        TransportWebSocketLink(
          TransportWsClientOptions(
              socketMaker: WebSocketMaker.url(() => 'ws://<your url>/graphql'),
              connectionParams: () => 
              // add your auth headers here
              webSocketHeaders),
        ),
        DioLink('https://<your url>/graphql', client: dio, defaultHeaders: headers),
      )
```


## Creating the GraphQL Subscription Request

Let's say we have a `NewReviews` Subscription saved in a file named `new_reviews.graphql`:

```graphql
subscription NewReviews {
  newReviews {
    id
    title
    content
    author {
      id
      name
    }
  }
}
```

after the file is created run your codegen command.

## Using the Subscription

Now that we have our subscription set up, we can use it in our Dart code. Here's an example of how to use the `NewReviews` subscription:

```dart
Stream<NewReviews?> getNewReviews() {
  final request = GNewReviewsReq();

  try {
    final resultStream = _ferryService.request<GNewReviewsData, GNewReviewsVars>(request);
    return resultStream.asyncMap((response) {
      final data = response.data?.newReviews;
      if (data != null) {
        return NewReviews(
          id: data.id,
          title: data.title,
          content: data.content,
          author: data.author,
        );
      }
      return null;
    });
  } catch (e) {
    print('Failed to get new reviews: $e');
    rethrow;
  }
}
```


