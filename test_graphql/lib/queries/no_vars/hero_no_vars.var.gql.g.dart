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
  Iterable<Object> serialize(Serializers serializers, GHeroNoVarsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  GHeroNoVarsVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHeroNoVarsVarsBuilder().build();
  }
}

class _$GHeroNoVarsVars extends GHeroNoVarsVars {
  factory _$GHeroNoVarsVars([void Function(GHeroNoVarsVarsBuilder) updates]) =>
      (new GHeroNoVarsVarsBuilder()..update(updates)).build();

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
    return newBuiltValueToStringHelper('GHeroNoVarsVars').toString();
  }
}

class GHeroNoVarsVarsBuilder
    implements Builder<GHeroNoVarsVars, GHeroNoVarsVarsBuilder> {
  _$GHeroNoVarsVars _$v;

  GHeroNoVarsVarsBuilder();

  @override
  void replace(GHeroNoVarsVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroNoVarsVars;
  }

  @override
  void update(void Function(GHeroNoVarsVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroNoVarsVars build() {
    final _$result = _$v ?? new _$GHeroNoVarsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
