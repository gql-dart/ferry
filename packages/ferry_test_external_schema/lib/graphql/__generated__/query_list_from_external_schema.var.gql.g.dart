// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_list_from_external_schema.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewsVars> _$gReviewsVarsSerializer =
    new _$GReviewsVarsSerializer();

class _$GReviewsVarsSerializer implements StructuredSerializer<GReviewsVars> {
  @override
  final Iterable<Type> types = const [GReviewsVars, _$GReviewsVars];
  @override
  final String wireName = 'GReviewsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReviewsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GReviewsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GReviewsVarsBuilder().build();
  }
}

class _$GReviewsVars extends GReviewsVars {
  factory _$GReviewsVars([void Function(GReviewsVarsBuilder)? updates]) =>
      (new GReviewsVarsBuilder()..update(updates))._build();

  _$GReviewsVars._() : super._();

  @override
  GReviewsVars rebuild(void Function(GReviewsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsVarsBuilder toBuilder() => new GReviewsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsVars;
  }

  @override
  int get hashCode {
    return 152884648;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GReviewsVars').toString();
  }
}

class GReviewsVarsBuilder
    implements Builder<GReviewsVars, GReviewsVarsBuilder> {
  _$GReviewsVars? _$v;

  GReviewsVarsBuilder();

  @override
  void replace(GReviewsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsVars;
  }

  @override
  void update(void Function(GReviewsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewsVars build() => _build();

  _$GReviewsVars _build() {
    final _$result = _$v ?? new _$GReviewsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
