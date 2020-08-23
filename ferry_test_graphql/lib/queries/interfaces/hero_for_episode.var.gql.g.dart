// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_for_episode.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroForEpisodeVars> _$gHeroForEpisodeVarsSerializer =
    new _$GHeroForEpisodeVarsSerializer();
Serializer<GDroidFragmentVars> _$gDroidFragmentVarsSerializer =
    new _$GDroidFragmentVarsSerializer();

class _$GHeroForEpisodeVarsSerializer
    implements StructuredSerializer<GHeroForEpisodeVars> {
  @override
  final Iterable<Type> types = const [
    GHeroForEpisodeVars,
    _$GHeroForEpisodeVars
  ];
  @override
  final String wireName = 'GHeroForEpisodeVars';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GHeroForEpisodeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ep',
      serializers.serialize(object.ep,
          specifiedType: const FullType(_i1.GEpisode)),
    ];

    return result;
  }

  @override
  GHeroForEpisodeVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroForEpisodeVarsBuilder();

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

class _$GDroidFragmentVarsSerializer
    implements StructuredSerializer<GDroidFragmentVars> {
  @override
  final Iterable<Type> types = const [GDroidFragmentVars, _$GDroidFragmentVars];
  @override
  final String wireName = 'GDroidFragmentVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GDroidFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  GDroidFragmentVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GDroidFragmentVarsBuilder().build();
  }
}

class _$GHeroForEpisodeVars extends GHeroForEpisodeVars {
  @override
  final _i1.GEpisode ep;

  factory _$GHeroForEpisodeVars(
          [void Function(GHeroForEpisodeVarsBuilder) updates]) =>
      (new GHeroForEpisodeVarsBuilder()..update(updates)).build();

  _$GHeroForEpisodeVars._({this.ep}) : super._() {
    if (ep == null) {
      throw new BuiltValueNullFieldError('GHeroForEpisodeVars', 'ep');
    }
  }

  @override
  GHeroForEpisodeVars rebuild(
          void Function(GHeroForEpisodeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroForEpisodeVarsBuilder toBuilder() =>
      new GHeroForEpisodeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroForEpisodeVars && ep == other.ep;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ep.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroForEpisodeVars')..add('ep', ep))
        .toString();
  }
}

class GHeroForEpisodeVarsBuilder
    implements Builder<GHeroForEpisodeVars, GHeroForEpisodeVarsBuilder> {
  _$GHeroForEpisodeVars _$v;

  _i1.GEpisode _ep;
  _i1.GEpisode get ep => _$this._ep;
  set ep(_i1.GEpisode ep) => _$this._ep = ep;

  GHeroForEpisodeVarsBuilder();

  GHeroForEpisodeVarsBuilder get _$this {
    if (_$v != null) {
      _ep = _$v.ep;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroForEpisodeVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroForEpisodeVars;
  }

  @override
  void update(void Function(GHeroForEpisodeVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroForEpisodeVars build() {
    final _$result = _$v ?? new _$GHeroForEpisodeVars._(ep: ep);
    replace(_$result);
    return _$result;
  }
}

class _$GDroidFragmentVars extends GDroidFragmentVars {
  factory _$GDroidFragmentVars(
          [void Function(GDroidFragmentVarsBuilder) updates]) =>
      (new GDroidFragmentVarsBuilder()..update(updates)).build();

  _$GDroidFragmentVars._() : super._();

  @override
  GDroidFragmentVars rebuild(
          void Function(GDroidFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDroidFragmentVarsBuilder toBuilder() =>
      new GDroidFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDroidFragmentVars;
  }

  @override
  int get hashCode {
    return 790625500;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GDroidFragmentVars').toString();
  }
}

class GDroidFragmentVarsBuilder
    implements Builder<GDroidFragmentVars, GDroidFragmentVarsBuilder> {
  _$GDroidFragmentVars _$v;

  GDroidFragmentVarsBuilder();

  @override
  void replace(GDroidFragmentVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GDroidFragmentVars;
  }

  @override
  void update(void Function(GDroidFragmentVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GDroidFragmentVars build() {
    final _$result = _$v ?? new _$GDroidFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
