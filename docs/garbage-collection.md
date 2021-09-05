---
id: garbage-collection
title: Garbage Collection and Eviction
sidebar_label: Garbage Collection & Eviction
---

Ferry enables you to selectively remove cached data that is no longer useful. The default garbage collection strategy of the `Cache.gc()` method is suitable for most applications, but the `Cache.evict()` method provides more fine-grained control for applications that require it.

## `Cache.gc()`

The `gc()` method removes all objects from the normalized cache that are not **reachable**:

```dart
final cache = Cache();

cache.gc();
```

To determine whether an object is reachable, the cache starts from all known root objects and uses a tracing strategy to recursively visit all available child references. Any normalized objects that are _not_ visited during this process are removed. The `gc()` method returns a Set of the IDs of the removed objects.

### Configuring garbage collection

You can use the `retain()` method to prevent an object (and its children) from being garbage collected, even if the object isn't reachable:

```dart
cache.retain('my-object-id');
```

If you later want a retained object to be garbage collected, use the `release()` method:

```dart
cache.release('my-object-id');
```

If the object is unreachable, it will be garbage collected during next call to `gc()`.

## `Cache.evict()`

You can remove any normalized object from the cache using the `evict()` method:

```dart
cache.evict('my-object-id');
```

You can also remove a _single field_ from a cached object by providing the name of the field to remove:

```dart
cache.evict('my-object-id', fieldName: 'yearOfFounding');
```

Evicting an object often makes _other_ cached objects unreachable. Because of this, you should call [`gc()`](#cachegc) after evicting one or more objects from the cache.
