import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'cache_deduplication_strategy.g.dart';

@experimental
class CacheDeduplicationStrategy extends EnumClass {
  static Serializer<CacheDeduplicationStrategy> get serializer =>
      _$cacheDeduplicationStrategySerializer;

  static const CacheDeduplicationStrategy none = _$none;
  static const CacheDeduplicationStrategy onNormalizedObjects =
      _$onNormalizedObjects;
  static const CacheDeduplicationStrategy afterDenormalize = _$afterDenormalize;

  const CacheDeduplicationStrategy._(String name) : super(name);

  static BuiltSet<CacheDeduplicationStrategy> get values => _$values;
  static CacheDeduplicationStrategy valueOf(String name) => _$valueOf(name);
}
