// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_deduplication_strategy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CacheDeduplicationStrategy _$none =
    const CacheDeduplicationStrategy._('none');
const CacheDeduplicationStrategy _$onNormalizedObjects =
    const CacheDeduplicationStrategy._('onNormalizedObjects');
const CacheDeduplicationStrategy _$afterDenormalize =
    const CacheDeduplicationStrategy._('afterDenormalize');

CacheDeduplicationStrategy _$valueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'onNormalizedObjects':
      return _$onNormalizedObjects;
    case 'afterDenormalize':
      return _$afterDenormalize;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CacheDeduplicationStrategy> _$values =
    new BuiltSet<CacheDeduplicationStrategy>(const <CacheDeduplicationStrategy>[
  _$none,
  _$onNormalizedObjects,
  _$afterDenormalize,
]);

Serializer<CacheDeduplicationStrategy> _$cacheDeduplicationStrategySerializer =
    new _$CacheDeduplicationStrategySerializer();

class _$CacheDeduplicationStrategySerializer
    implements PrimitiveSerializer<CacheDeduplicationStrategy> {
  @override
  final Iterable<Type> types = const <Type>[CacheDeduplicationStrategy];
  @override
  final String wireName = 'CacheDeduplicationStrategy';

  @override
  Object serialize(Serializers serializers, CacheDeduplicationStrategy object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CacheDeduplicationStrategy deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CacheDeduplicationStrategy.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
