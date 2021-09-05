---
id: flutter
title: Using with Flutter
---

The `ferry_flutter` package provides an [Operation](flutter-operation-widget.md) Widget for your convenience that makes it easy to use Ferry with Flutter.

## Setup

To use `ferry_flutter`, we must include it in our `pubspec.yaml`.

```yaml
dependencies:
  ferry_flutter: #[latest-version]
```

## Dependency Injection

We will need to pass our Ferry client to our `ferry_flutter` Widget. While `ferry_flutter` can be used with any dependency injection library, we recommend using [`get_it`](https://pub.dev/packages/get_it).
