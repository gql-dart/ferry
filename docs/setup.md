---
id: setup
title: Setup
---

## Basic Setup

### Install Dependencies

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  ferry: #[latest-version]
  gql_http_link: #[latest-version]

dev_dependencies:
  ferry_generator: #[latest-version]
  build_runner: #[latest-version]
```

### Initialize the Client

This instantiates a client with the default configuration, including a `Cache` instance that uses a `MemoryStore` to store data.

```dart
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';

final link = HttpLink("[path/to/endpoint]");

final client = Client(link: link);
```

## Setup With HiveStore

Ferry includes a `HiveStore` which enables offline data persistance, based on the `hive` package.

### Install Dependencies

To use the `HiveStore`, you'll need to add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  ferry: #[latest-version]
  gql_http_link: #[latest-version]
  hive: #[latest-version]
  ferry_hive_store: #[latest-version]

dev_dependencies:
  ferry_generator: #[latest-version]
  build_runner: #[latest-version]
```

:::important

If you're using Flutter, you'll also need to add:

```yaml
dependencies:
  hive_flutter: #[latest-version]
```

:::

### Initialize the Client

```dart
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive/hive.dart';
// *** If using flutter ***
// import 'package:hive_flutter/hive_flutter.dart';

Future<Client> initClient() async {
  Hive.init('hive_data');
  // OR, if using flutter
  // await Hive.initFlutter();

  final box = await Hive.openBox("graphql");

  final store = HiveStore(box);

  final cache = Cache(store: store);

  final link = HttpLink('[path/to/endpoint]');

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
```
