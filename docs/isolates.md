---
id: isolates
title: Running the client in a separate isolate
sidebar_label: Isolates
---

The default setup should be sufficient for most use cases.
However, normalization and denormalization of big, nested responses can be quite computation heavy
and can lead to dropped frames on frontends.

Ferry can help you run your graphql-related code on a separate isolate so that the UI thread does
not get blocked when executing big queries.

Since the Ferry `Client` already is Stream based, the differences in the API between the
default `Client` and the `IsolateClient` are minimal.
If you are just using the `request()` method of the `Client` or `Operation` widgets of
ferry_flutter,
then the `IsolateClient` is a drop-in replacement!

The `IsolateClient` does not, however, offer direct access to the `Cache` object, but instead offers
indirect access via methods like `readQuery()` or `writeFragment()`. These methods are asynchronous,
as all communication over isolates is asynchronous.

### Setup

To run Ferry on a separate Isolate, use the static `IsolateClient.create<InitParams>()` method.
This method receives three parameters and one generic type parameter:

- `<InitParams>`: this generic type parameter defines the type of the parameters object which is
  used
  to initialize the client. If you don't want to write a separate class for this, you can just
  use `Map<String, dynamic>` here.
  If you don't need parameters to initialize the Client, you can also use the `Null` type
- `initClient`: This function is called on a separate isolate and is responsible for creating the
  real Ferry `Client`.
  This must be a top-level or static function (otherwise it will not be possible to send it to
  another isolate).
  When migrating from the standard setup to to isolate-based setup, move the initialization of
  the `Client` class
  to this function. initClient is also called with a `SendPort` parameter, which can be used to
  establish custom
  communication between the two isolates. You can use this for example for synchronizing
  authentication tokens when
  the are refreshed.
- `params`: a type that contains the parameters used to initialize the client, which will be passed
  to `initClient`.
  Use this to pass endpoint urls, the path to the cache or a authentication token to the other
  isolate.
- `messageHandler` (optional): a function which will be invoked on the main isolate if you send
  objects
  through the `SendPort` passed to `initClient`. If you want to establish two-way communication,
  create a new `ReceivePort`
  in `InitClient` and send its `SendPort` over the `SendPort` which is the third parameter
  of `initClient`. `messageHandler` will
  be called with the `sendPort` and this can be used to send custom messages from the main isolate
  the the ferry isolate.

A example can be found in `examples/pokemon_explorer`. In this project. The same App can be run with
ferry
on the main isolate (`main.dart`) or a separate isolate (`main_isolate.dart`).

### Caveats

#### No MethodChannels in background isolates before Flutter 3.7

:::note

As of Flutter 3.7, Flutter supports platform plugins in background isolates.
See https://docs.flutter.dev/perf/isolates#using-platform-plugins-in-isolates

This simplifies the setup for Ferry in isolates, and invalidates much of the information below.

Beware that if you write to `SharedPreferences` in the background isolate,
you might need to call `.reload()` on the SharedPreferences instance
in the main isolate to see the changes.

:::

By default, you will not be able to run code that uses `MethodChannel`s underneath in the new
isolate.
This means:

- no SharedPreferences
- no Hive.initFlutter (Hive.init works, though, also in flutter apps.)
- no path_provider

If you want to use Hive for the cache, there is a workaround implemented in the pokemon_explorer
example app:

- call ` (await getApplicationDocumentsDirectory()).path` on the main isolate and pass the path to
  the ferry isolate in the `params` map
- use `Hive.init` with the given path instead of `Hive.initFlutter()`. Note that Hive is single
  threaded and you cannot use the same box on multiple isolates, this would lead to data corruption.

If you have an authenticated graphql api and need the auth token on both the main isolate and the
ferry isolate, consider one of the following solutions:

- use a persistence library that can be used across different isolates like `drift` or `isar`.
- use a persistence library like `hive`, which does not support multiple isolate, can be used on
  non-main isolates also. However,  
  With this approach, the Hive box needs to be opened on the ferry isolate only, the main isolate
  will not be able the read the auth token.
- use the `SendPort` in the `InitClient` function that runs on the ferry isolate to establish
  communication between
  the main isolate and ferry. For example you can send the new authentication token via that
  sendPort.
  The main isolate would receive it in its `messageHandler` and could persist it, for example
  via `SharedPreferences`.
  You can also establish a two-way communication be creating a `ReceivePort` in the `InitClient`
  function and send its `SendPort` to
  the main isolates messagehandler.

Here's an example on how to wire up SharedPreferences to store
the auth token on the main isolate, refresh it on the ferry isolate when needed, and
send the new token the the main isolate for shared_preferences to store:

https://gist.github.com/knaeckeKami/b11ad83e4b69aa44638815d1471c2ba3

If you implement another approach, feel free to send me a sample code so I can add it here.

### updateResult / pagination

If you set `updateResult` parameter in queries with the `IsolateClient`, you need to make sure that
the `updateResult` function
can be sent to the ferry isolate. The easiest way to do ensure this to make it a top-level or static
function.

The refetch a request, call the `addRequestToRequestController` method on the `IsolateClient`.