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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
