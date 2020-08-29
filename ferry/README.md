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
[discord-link]: https://discord.gg/QRTfXE

A simple, powerful GraphQL Client for Flutter and Dart.

# [Documentation](https://ferrygraphql.com/) 📖

# Features

1. ✅ **Fully Typed**: work faster and safer with compile time checks and IDE autocomplete, including fully typed Cache reads and writes.
2. 🔄 **Built-In Code Generators**: automatically generated immutable data classes for all your GraphQL Operations and Fragments, based on your schema.
3. 🌐 **Customizable Network Interface**: highly customizable network interface using `gql_link`, allowing you to compose and extend `Link`s.
4. ✨ **Normalized Optimistic Cache**: keep data in sync with cache normalization and update your UI instantly with optimistic data.
5. 💾 **Multiple Data Stores**: extensible `Store` interface with built-in `MemoryStore` and `HiveStore` (which uses `hive` for offline persistence).
6. 📄 **Refetch & Pagination**: easily update responses with new data or combine multiple responses, allowing for seamless pagination.
7. 📱 **Flutter Widgets**: Widgets for Queries, Mutations, and Subscriptions, available out of the box.

# Getting Started

Check out the [getting started](https://ferrygraphql.com/docs/setup) section on the docs site.

# Usage

## Install Dependencies

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  ferry:  #[latest-version]
  gql_http_link:  #[latest-version]

dev_dependencies:
  ferry_generator:  #[latest-version]
  build_runner:  #[latest-version]
```

## Initialize the Client

This instantiates a client with the default configuration, including a `Cache` instance that uses a `MemoryStore` to store data.

```dart
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';

final link = HttpLink("[path/to/endpoint]");

final client = Client(link: link);
```

## Download Your GraphQL Schema

To generate our classes, we first need to downoad our GraphQL in SDL format to any location within the `lib` project directory. You can use the [get-graphql-schema](https://github.com/prisma-labs/get-graphql-schema) tool to download a schema from a GraphQL endpoint:

First, install the tool:

```sh
npm install -g get-graphql-schema
```

Next, download the schema:

```sh
get-graphql-schema ENDPOINT_URL > lib/schema.graphql
```

## Create `.graphql` Files

We need to save all of our GraphQL operations to files that end with the `.graphql` extension.

The generated files are created as siblings to the `.graphql` file. To reduce clutter, we recommend placing your `.graphql` files in a `/graphql` subdirectory.

## Build Generated Classes

Now that we've downloaded our GraphQL schema and saved our GraphQL Operations to `.graphql` files, we're almost ready to run the generator. The final step is to add a configuration file so that `built_runner` knows which generators to run and where to find our schema.

Add a `build.yaml` file to your project root with the following contents, **replacing `your_package_name` and the path to your schema file** accordingly.

```yaml
targets:
  $default:
    builders:
      gql_build|schema_builder:
        enabled: true
      gql_build|ast_builder:
        enabled: true
      gql_build|data_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
      gql_build|var_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
      gql_build|serializer_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql

      ferry_generator|req_builder:
        enabled: true
        options:
          schema: your_package_name|lib/schema.graphql
```

Now you can build your dart generated files by calling:

```sh
pub run build_runner build
```

Or, if you are using flutter

```sh
flutter pub run build_runner build
```

## Execute a Request

For example, let's say we've saved the following `Reviews` Query to a file named `reviews.graphql`:

```graphql
query Reviews($first: Int, $offset: Int) {
  reviews(first: $first, offset: $offset) {
    id
    stars
    commentary
    createdAt
  }
}
```

Running the Ferry generator will create a `reviews.req.gql.dart` file with a Class named `GReviewsReq`. We can instantiate it like so:

```dart
final reviewsReq = GReviewsReq(
  (b) => b
    ..vars.first = 10
    ..vars.offset = 0,
);
```

Now, all we need to do is listen to the `responseStream`.

```dart
client.responseStream(reviewsReq).listen((response) => print(response));
```

[license-badge]: https://img.shields.io/github/license/gql-dart/ferry.svg?style=flat-square
[license-link]: https://github.com/gql-dart/ferry/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square
[prs-link]: http://makeapullrequest.com
[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/ferry.svg?style=flat-square&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/ferry/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/ferry.svg?style=flat-square&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/ferry/stargazers
[pub-badge]: https://img.shields.io/pub/v/ferry?logo=dart
[pub-link]: https://pub.dev/packages/ferry
