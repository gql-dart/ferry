// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_policy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FetchPolicy _$cacheFirst = const FetchPolicy._('CacheFirst');
const FetchPolicy _$cacheAndNetwork = const FetchPolicy._('CacheAndNetwork');
const FetchPolicy _$networkOnly = const FetchPolicy._('NetworkOnly');
const FetchPolicy _$cacheOnly = const FetchPolicy._('CacheOnly');
const FetchPolicy _$noCache = const FetchPolicy._('NoCache');

FetchPolicy _$valueOf(String name) {
  switch (name) {
    case 'CacheFirst':
      return _$cacheFirst;
    case 'CacheAndNetwork':
      return _$cacheAndNetwork;
    case 'NetworkOnly':
      return _$networkOnly;
    case 'CacheOnly':
      return _$cacheOnly;
    case 'NoCache':
      return _$noCache;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<FetchPolicy> _$values =
    new BuiltSet<FetchPolicy>(const <FetchPolicy>[
  _$cacheFirst,
  _$cacheAndNetwork,
  _$networkOnly,
  _$cacheOnly,
  _$noCache,
]);

Serializer<FetchPolicy> _$fetchPolicySerializer = new _$FetchPolicySerializer();

class _$FetchPolicySerializer implements PrimitiveSerializer<FetchPolicy> {
  @override
  final Iterable<Type> types = const <Type>[FetchPolicy];
  @override
  final String wireName = 'FetchPolicy';

  @override
  Object serialize(Serializers serializers, FetchPolicy object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  FetchPolicy deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FetchPolicy.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
