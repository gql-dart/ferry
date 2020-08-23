// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aliased_hero.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAliasedHeroVars> _$gAliasedHeroVarsSerializer =
    new _$GAliasedHeroVarsSerializer();

class _$GAliasedHeroVarsSerializer
    implements StructuredSerializer<GAliasedHeroVars> {
  @override
  final Iterable<Type> types = const [GAliasedHeroVars, _$GAliasedHeroVars];
  @override
  final String wireName = 'GAliasedHeroVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GAliasedHeroVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ep',
      serializers.serialize(object.ep,
          specifiedType: const FullType(_i1.GEpisode)),
    ];

    return result;
  }

  @override
  GAliasedHeroVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'ep':
          result.ep = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode;
          break;
      }
    }

    return result.build();
  }
}

class _$GAliasedHeroVars extends GAliasedHeroVars {
  @override
  final _i1.GEpisode ep;

  factory _$GAliasedHeroVars(
          [void Function(GAliasedHeroVarsBuilder) updates]) =>
      (new GAliasedHeroVarsBuilder()..update(updates)).build();

  _$GAliasedHeroVars._({this.ep}) : super._() {
    if (ep == null) {
      throw new BuiltValueNullFieldError('GAliasedHeroVars', 'ep');
    }
  }

  @override
  GAliasedHeroVars rebuild(void Function(GAliasedHeroVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAliasedHeroVarsBuilder toBuilder() =>
      new GAliasedHeroVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAliasedHeroVars && ep == other.ep;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ep.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAliasedHeroVars')..add('ep', ep))
        .toString();
  }
}

class GAliasedHeroVarsBuilder
    implements Builder<GAliasedHeroVars, GAliasedHeroVarsBuilder> {
  _$GAliasedHeroVars _$v;

  _i1.GEpisode _ep;
  _i1.GEpisode get ep => _$this._ep;
  set ep(_i1.GEpisode ep) => _$this._ep = ep;

  GAliasedHeroVarsBuilder();

  GAliasedHeroVarsBuilder get _$this {
    if (_$v != null) {
      _ep = _$v.ep;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAliasedHeroVars;
  }

  @override
  void update(void Function(GAliasedHeroVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAliasedHeroVars build() {
    final _$result = _$v ?? new _$GAliasedHeroVars._(ep: ep);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
