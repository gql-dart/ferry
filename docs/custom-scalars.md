---
id: custom-scalars
title: Custom Scalars
---

If our GraphQL schema includes custom `scalar` types, we'll need to configure Ferry's code generator to properly handle them.

## Configuring our `build.yaml` file

Let's say our GraphQL schema includes a `Date` scalar that we want to map to Dart's `DateTime` type.

### Configure Type Overrides

Specifying a Type Overrides tells the generator what Dart types to use when generating a type from our GraphQL schema (in this case our custom `scalar` type).

```yaml {4}
ferry_generator|graphql_builder:
  enabled: true
  options:
    type_overrides:
      Date:
        name: DateTime
```

The key in the yaml Map should be the name of our custom scalar in our schema (i.e. "Date"), and `name` should be the name of the Dart type.

If our Dart type is not part of the `dart:core` library, we'd also need to import the file that contains the Dart type. DateTime _is_ a part of `dart:core`, but if it weren't, we'd import it like so:

```yaml {7}
ferry_generator|graphql_builder:
  enabled: true
  options:
    type_overrides:
      Date:
        name: DateTime
        import: "package:my_date_library/date_time.dart"
```

### Configure Custom Serializer

If our Dart type is not a Dart Data Type, we also need to [define a custom serializer](#create-a-custom-serializer) so that the generated classes can correctly serialize & deserialize the data.

Assuming we've created a [`DateSerializer`](#create-a-custom-serializer) for our custom `Date` scalar, we will need to include it in our `serializer_builder`:

```yaml
ferry_generator|serializer_builder:
  enabled: true
  options:
    schema: my_project|lib/graphql/schema.graphql
    custom_serializers:
      - import: "package:path/to/date_serializer.dart"
        name: DateSerializer
```

### Complete `build.yaml` Example

Here's an example of what our final `build.yaml` might look like.

```yaml
targets:
  $default:
    builders:
      ferry_generator|serializer_builder:
        enabled: true
        options:
          schema: my_project|lib/schema.graphql
          custom_serializers:
            - import: "package:path/to/date_serializer.dart"
              name: DateSerializer

      ferry_generator|graphql_builder:
        enabled: true
        options:
          schema: my_project|lib/schema.graphql
          type_overrides:
            Date:
              name: DateTime
```

## Creating a Custom Serializer

For Ferry to create instances of our generated Dart classes, with data from a GraphQL server, we'll need to create a custom `built_value` serializer to handle the custom `scalar` type.

Let's assume that our GraphQL server returns our `Date` scalar as an `int` timestamp. Then, a custom serializer can look like this:

```dart
import 'package:built_value/serializer.dart';

class DateSerializer implements PrimitiveSerializer<DateTime> {
  @override
  DateTime deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    assert(serialized is int,
        "DateSerializer expected 'int' but got ${serialized.runtimeType}");
    return DateTime.fromMillisecondsSinceEpoch(serialized);
  }

  @override
  Object serialize(
    Serializers serializers,
    DateTime date, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      date.millisecondsSinceEpoch;

  @override
  Iterable<Type> get types => [DateTime];

  @override
  String get wireName => "Date";
}
```

And that's it! Now when we run our `pub run build_runner build` command, Ferry's generators will automatically override our GraphQL `Date` scalar with the Dart `DateTime` type and use our `DateSerializer` to serialize & deserialize data.

### Using `StructuredSerializer`s

We've implemented the above `DateSerializer` using the `PrimitiveSerializer` from `built_value`. However, if we were building a serializer for a non-primitive Dart type, we'd probably want to use the `StructuredSerializer` instead.

Since `built_value` doesn't use standard Json by default, rather than implementing `StructuredSerializer` directly, we may prefer to extend the `JsonSerializer` from `gql_code_builder`. For example, here's a serializer for the `Operation` type from `gql_exec` that Ferry's generators use internally.

```dart
import "package:built_value/serializer.dart";
import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";

import "package:gql_code_builder/src/serializers/json_serializer.dart";

class OperationSerializer extends JsonSerializer<Operation> {
  @override
  Operation fromJson(Map<String, dynamic> json) => Operation(
        document: parseString(json["document"] as String),
        operationName: json["operationName"] as String,
      );

  @override
  Map<String, dynamic> toJson(Operation operation) => <String, dynamic>{
        "document": printNode(operation.document),
        if (operation.operationName != null)
          "operationName": operation.operationName,
      };
}
```

For more information about serialization using `built_value`, check out [this blog post](https://medium.com/dartlang/darts-built-value-for-serialization-f5db9d0f4159).
