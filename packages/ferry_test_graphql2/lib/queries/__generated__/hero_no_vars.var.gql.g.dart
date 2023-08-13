// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_no_vars.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroNoVarsVars> _$gHeroNoVarsVarsSerializer =
    new _$GHeroNoVarsVarsSerializer();

class _$GHeroNoVarsVarsSerializer
    implements StructuredSerializer<GHeroNoVarsVars> {
  @override
  final Iterable<Type> types = const [GHeroNoVarsVars, _$GHeroNoVarsVars];
  @override
  final String wireName = 'GHeroNoVarsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroNoVarsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GHeroNoVarsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHeroNoVarsVarsBuilder().build();
  }
}

class _$GHeroNoVarsVars extends GHeroNoVarsVars {
  factory _$GHeroNoVarsVars([void Function(GHeroNoVarsVarsBuilder)? updates]) =>
      (new GHeroNoVarsVarsBuilder()..update(updates))._build();

  _$GHeroNoVarsVars._() : super._();

  @override
  GHeroNoVarsVars rebuild(void Function(GHeroNoVarsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroNoVarsVarsBuilder toBuilder() =>
      new GHeroNoVarsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroNoVarsVars;
  }

  @override
  int get hashCode {
    return 644910002;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHeroNoVarsVars').toString();
  }
}

class GHeroNoVarsVarsBuilder
    implements Builder<GHeroNoVarsVars, GHeroNoVarsVarsBuilder> {
  _$GHeroNoVarsVars? _$v;

  GHeroNoVarsVarsBuilder();

  @override
  void replace(GHeroNoVarsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroNoVarsVars;
  }

  @override
  void update(void Function(GHeroNoVarsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroNoVarsVars build() => _build();

  _$GHeroNoVarsVars _build() {
    final _$result = _$v ?? new _$GHeroNoVarsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
