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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
