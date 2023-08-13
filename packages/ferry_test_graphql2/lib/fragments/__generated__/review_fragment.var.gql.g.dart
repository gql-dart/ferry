// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewFragmentVars> _$gReviewFragmentVarsSerializer =
    new _$GReviewFragmentVarsSerializer();

class _$GReviewFragmentVarsSerializer
    implements StructuredSerializer<GReviewFragmentVars> {
  @override
  final Iterable<Type> types = const [
    GReviewFragmentVars,
    _$GReviewFragmentVars
  ];
  @override
  final String wireName = 'GReviewFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReviewFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GReviewFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GReviewFragmentVarsBuilder().build();
  }
}

class _$GReviewFragmentVars extends GReviewFragmentVars {
  factory _$GReviewFragmentVars(
          [void Function(GReviewFragmentVarsBuilder)? updates]) =>
      (new GReviewFragmentVarsBuilder()..update(updates))._build();

  _$GReviewFragmentVars._() : super._();

  @override
  GReviewFragmentVars rebuild(
          void Function(GReviewFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewFragmentVarsBuilder toBuilder() =>
      new GReviewFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewFragmentVars;
  }

  @override
  int get hashCode {
    return 156524344;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GReviewFragmentVars').toString();
  }
}

class GReviewFragmentVarsBuilder
    implements Builder<GReviewFragmentVars, GReviewFragmentVarsBuilder> {
  _$GReviewFragmentVars? _$v;

  GReviewFragmentVarsBuilder();

  @override
  void replace(GReviewFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewFragmentVars;
  }

  @override
  void update(void Function(GReviewFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewFragmentVars build() => _build();

  _$GReviewFragmentVars _build() {
    final _$result = _$v ?? new _$GReviewFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
