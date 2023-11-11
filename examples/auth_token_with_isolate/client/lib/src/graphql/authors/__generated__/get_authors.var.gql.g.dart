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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
