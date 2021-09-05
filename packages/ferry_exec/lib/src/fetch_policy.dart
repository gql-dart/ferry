import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'fetch_policy.g.dart';

class FetchPolicy extends EnumClass {
  static Serializer<FetchPolicy> get serializer => _$fetchPolicySerializer;

  /// Return result from cache. Only fetch from network if cached result is not available.
  ///
  /// Default
  static const FetchPolicy CacheFirst = _$cacheFirst;

  /// Return result from cache first (if it exists), then return network result once it's available.
  static const FetchPolicy CacheAndNetwork = _$cacheAndNetwork;

  /// Return result from network, fail if network call doesn't succeed, save to cache.
  static const FetchPolicy NetworkOnly = _$networkOnly;

  /// Return result from cache.
  static const FetchPolicy CacheOnly = _$cacheOnly;

  /// Return result from network, fail if network call doesn't succeed, don't save to cache
  static const FetchPolicy NoCache = _$noCache;

  const FetchPolicy._(String name) : super(name);

  static BuiltSet<FetchPolicy> get values => _$values;
  static FetchPolicy valueOf(String name) => _$valueOf(name);
}
