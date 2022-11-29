// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_authors.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAuthorsVars> _$gGetAuthorsVarsSerializer =
    new _$GGetAuthorsVarsSerializer();

class _$GGetAuthorsVarsSerializer
    implements StructuredSerializer<GGetAuthorsVars> {
  @override
  final Iterable<Type> types = const [GGetAuthorsVars, _$GGetAuthorsVars];
  @override
  final String wireName = 'GGetAuthorsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetAuthorsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetAuthorsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetAuthorsVarsBuilder().build();
  }
}

class _$GGetAuthorsVars extends GGetAuthorsVars {
  factory _$GGetAuthorsVars([void Function(GGetAuthorsVarsBuilder)? updates]) =>
      (new GGetAuthorsVarsBuilder()..update(updates))._build();

  _$GGetAuthorsVars._() : super._();

  @override
  GGetAuthorsVars rebuild(void Function(GGetAuthorsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorsVarsBuilder toBuilder() =>
      new GGetAuthorsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorsVars;
  }

  @override
  int get hashCode {
    return 489363545;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetAuthorsVars').toString();
  }
}

class GGetAuthorsVarsBuilder
    implements Builder<GGetAuthorsVars, GGetAuthorsVarsBuilder> {
  _$GGetAuthorsVars? _$v;

  GGetAuthorsVarsBuilder();

  @override
  void replace(GGetAuthorsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorsVars;
  }

  @override
  void update(void Function(GGetAuthorsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorsVars build() => _build();

  _$GGetAuthorsVars _build() {
    final _$result = _$v ?? new _$GGetAuthorsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
