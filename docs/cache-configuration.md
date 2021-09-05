---
id: cache-configuration
title: Configuring the cache
sidebar_label: Configuration
---

The Ferry cache normalizes incoming data for your GraphQL operations and stores it using a `Store`. This allows the client to respond to future queries for the same data without sending unnecessary network requests.

## Data Normalization

Normalization involves the following steps:

1. The cache [generates a unique ID](#generating-unique-identifiers) for every identifiable object included in the response.
2. The cache stores the objects by ID in a flat lookup table.
3. Whenever an incoming object is stored with the same ID as an _existing_ object, the fields of those objects are _merged_.
   - If the incoming object and the existing object share any fields, the incoming object _overwrites_ the cached values for those fields.
   - Fields that appear in _only_ the existing object or _only_ the incoming object are preserved.

Normalization constructs a partial copy of your data graph on your client, in a format that's optimized for reading and updating the graph as your application changes state.

### Generating Unique Identifiers

By default, the cache generates a unique identifier using an object's `__typename` and any uniquely identifying fields, called `keyFields`. By default, the `id` or `_id` field (whichever is defined) is used as a `keyField`, but this behavior can be [customized](#customizing-identifier-generation-by-type). These two values are separated by a colon (`:`).

For example, an object with a `__typename` of `Task` and an `id` of `14` is assigned a default identifier of `Task:14`.

#### Customizing Identifier Generation by Type

If one of your types defines its primary key with a field _besides_ `id` or `_id`, you can customize how the cache generates unique identifiers for that type. To do so, you define `TypePolicy` for the type and include a Map of all your `typePolicies` when instantiating the cache.

Include a `keyFields` field in relevant `TypePolicy` objects, like so:

```dart
final cache = Cache(
  typePolicies: {
    'Product': TypePolicy(
      // In most inventory management systems, a single UPC code uniquely
      // identifies any product.
      keyFields: {
        'upc': true,
      },
    ),
    'Person': TypePolicy(
      // In some user account systems, names or emails alone do not have to
      // be unique, but the combination of a person's name and email is
      // uniquely identifying.
      keyFields: {
        'name': true,
        'email': true,
      },
    ),
    'Book': TypePolicy(
      // If one of the keyFields is an object with fields of its own, you can
      // include those nested keyFields by using a nested array of strings:
      keyFields: {
        'title': true,
        'author': {
          'name': true,
        },
      },
    ),
  },
);
```

This example shows three `typePolicies`: one for a `Product` type, one for a `Person` type, and one for a `Book` type. Each `TypePolicy`'s `keyFields` array defines which fields on the type _together_ represent the type's primary key.

The `Book` type above uses a _subfield_ as part of its primary key. The `Book`'s `author` field must be an object that includes a `name` field for this to be valid.

In the example above, the resulting identifier string for a `Book` object has the following structure:

```
Book:{"author":{"name":"Ray Bradbury"}, "title":"Fahrenheit 451"}
```

An object's primary key fields are always listed alphabetically to ensure uniqueness.

Note that these `keyFields` strings always refer to the actual field names as defined in your schema, meaning the ID computation is not sensitive to field aliases.

### Disabling Normalization

You can instruct Ferry _not_ to normalize objects of a certain type. This can be useful for metrics and other transient data that's identified by a timestamp and never receives updates.

To disable normalization for a type, define a `TypePolicy` for the type (as shown in [Customizing Identifier Generation by Type](#customizing-identifier-generation-by-type)) and set the policy's `keyFields` field to an empty `Map`.

Objects that are not normalized are instead embedded within their _parent_ object in the cache. You can't access these objects directly, but you can access them via their parent.

## `TypePolicy` Fields

To customize how the cache interacts with specific types in your schema, you can provide an object mapping `__typename` strings to `TypePolicy` objects when you create a new `Cache`.

A `TypePolicy` object can include the following fields:

````dart
class TypePolicy {
  /// Allows defining the primary key fields for this type.
  ///
  /// Pass a `true` value for any fields you wish to use as key fields. You can
  /// also use child fields.
  ///
  /// ```dart
  /// final bookTypePolicy = TypePolicy(
  ///   keyFields: {
  ///     'title': true,
  ///     'author': {
  ///       'name': true,
  ///     }
  ///   },
  /// );
  /// ```
  ///
  /// If you don't wish to normalize this type, simply pass an empty `Map`. In
  /// that case, we won't normalize this type and it will be reachable from its
  /// parent.
  Map<String, dynamic> keyFields;

  /// Set to `true` if this type is the root Query in your schema.
  bool queryType;

  /// Set to `true` if this type is the root Mutation in your schema.
  bool mutationType;

  /// Set to `true` if this type is the root Subscription in your schema.
  bool subscriptionType;

  /// Allows defining [FieldPolicy]s for this type.
  Map<String, FieldPolicy> fields;

  TypePolicy({
    this.keyFields,
    this.queryType = false,
    this.mutationType = false,
    this.subscriptionType = false,
    this.fields = const {},
  });
}
````

### Overriding Root Operation Types (Uncommon)

In addition to `keyFields`, a `TypePolicy` can indicate that it represents the root query, mutation, or subscription type by setting `queryType`, `mutationType`, or `subscriptionType` as `true`:

```dart
final cache = Cache(
  typePolicies: {
    'UnconventionalRootQuery': TypePolicy(
      queryType: true,
    ),
  },
);
```

The cache normally obtains `__typename` information by adding the `__typename` field to every GraphQL operation selection set it sends to the server. The `__typename` of the root query or mutation is almost always simply `"Query"` or `"Mutation"`, so the cache assumes those common defaults unless instructed otherwise in a `TypePolicy`.

### The `fields` Property

The final property within `TypePolicy` is the `fields` property, which is a map from string field names to `FieldPolicy` objects.
