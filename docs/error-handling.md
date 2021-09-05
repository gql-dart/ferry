---
id: error-handling
title: Error Handling
---

When creating or running an application, sooner or later, you're bound to encounter some type of error. Ferry is designed to gracefully handle errors, including:

1. [**GraphQL Errors**](#graphql-errors): Errors returned by your GraphQL server.
2. [**Stream Errors**](#stream-errors): Errors emitted by any Stream in your TypedLink chain.
3. [**Forwarding Exceptions**](#forwarding-exceptions): Synchronous Exceptions thrown when forwarding a request along the TypedLink chain.

## GraphQL Errors

GraphQL Errors are errors received by your `gql_link`. These are commonly returned by a GraphQL server when there is a problem validating or executing your GraphQL operation (e.g. your Query includes a field not defined in your schema).

Ferry's `GqlTypedLink` (included in the default `Client`) parses GraphQL Errors from responses and includes them in the `OperationResponse.graphqlErrors` field.

## Stream Errors

Dart Streams allow errors to be emmited as events in the stream. Ferry's `ErrorTypedLink` (included in the default `Client`) intercepts these Stream error events and converts them into `OperationResponse`s, including the error in the `linkException` field.

## Forwarding Exceptions

Ferry allows `TypedLink`s to be composed into an execution chain by calling `forward()` from within a `TypedLink.request()` method. If an exception is thrown when forwarding a request along the chain, Ferry's `ErrorTypedLink` will catch the exception and convert it into an `OperationResponse`.

As with virtually everything in `Ferry`, the error handling logic can be customized with a [custom](customization.md) `TypedLink`.