// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragmentsVars> _$gHeroWithFragmentsVarsSerializer =
    new _$GHeroWithFragmentsVarsSerializer();
Serializer<GheroDataVars> _$gheroDataVarsSerializer =
    new _$GheroDataVarsSerializer();
Serializer<GcomparisonFieldsVars> _$gcomparisonFieldsVarsSerializer =
    new _$GcomparisonFieldsVarsSerializer();

class _$GHeroWithFragmentsVarsSerializer
    implements StructuredSerializer<GHeroWithFragmentsVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsVars,
    _$GHeroWithFragmentsVars
  ];
  @override
  final String wireName = 'GHeroWithFragmentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.episode;
    if (value != null) {
      result
        ..add('episode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GEpisode)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode?;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroDataVarsSerializer implements StructuredSerializer<GheroDataVars> {
  @override
  final Iterable<Type> types = const [GheroDataVars, _$GheroDataVars];
  @override
  final String wireName = 'GheroDataVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroDataVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GheroDataVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GheroDataVarsBuilder().build();
  }
}

class _$GcomparisonFieldsVarsSerializer
    implements StructuredSerializer<GcomparisonFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GcomparisonFieldsVars,
    _$GcomparisonFieldsVars
  ];
  @override
  final String wireName = 'GcomparisonFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcomparisonFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GcomparisonFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsVars extends GHeroWithFragmentsVars {
  @override
  final _i1.GEpisode? episode;

  factory _$GHeroWithFragmentsVars(
          [void Function(GHeroWithFragmentsVarsBuilder)? updates]) =>
      (new GHeroWithFragmentsVarsBuilder()..update(updates)).build();

  _$GHeroWithFragmentsVars._({this.episode}) : super._();

  @override
  GHeroWithFragmentsVars rebuild(
          void Function(GHeroWithFragmentsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsVarsBuilder toBuilder() =>
      new GHeroWithFragmentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsVars && episode == other.episode;
  }

  @override
  int get hashCode {
    return $jf($jc(0, episode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroWithFragmentsVars')
          ..add('episode', episode))
        .toString();
  }
}

class GHeroWithFragmentsVarsBuilder
    implements Builder<GHeroWithFragmentsVars, GHeroWithFragmentsVarsBuilder> {
  _$GHeroWithFragmentsVars? _$v;

  _i1.GEpisode? _episode;
  _i1.GEpisode? get episode => _$this._episode;
  set episode(_i1.GEpisode? episode) => _$this._episode = episode;

  GHeroWithFragmentsVarsBuilder();

  GHeroWithFragmentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsVars;
  }

  @override
  void update(void Function(GHeroWithFragmentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragmentsVars build() {
    final _$result = _$v ?? new _$GHeroWithFragmentsVars._(episode: episode);
    replace(_$result);
    return _$result;
  }
}

class _$GheroDataVars extends GheroDataVars {
  factory _$GheroDataVars([void Function(GheroDataVarsBuilder)? updates]) =>
      (new GheroDataVarsBuilder()..update(updates)).build();

  _$GheroDataVars._() : super._();

  @override
  GheroDataVars rebuild(void Function(GheroDataVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroDataVarsBuilder toBuilder() => new GheroDataVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroDataVars;
  }

  @override
  int get hashCode {
    return 172200517;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GheroDataVars').toString();
  }
}

class GheroDataVarsBuilder
    implements Builder<GheroDataVars, GheroDataVarsBuilder> {
  _$GheroDataVars? _$v;

  GheroDataVarsBuilder();

  @override
  void replace(GheroDataVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroDataVars;
  }

  @override
  void update(void Function(GheroDataVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GheroDataVars build() {
    final _$result = _$v ?? new _$GheroDataVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFieldsVars extends GcomparisonFieldsVars {
  @override
  final int? first;

  factory _$GcomparisonFieldsVars(
          [void Function(GcomparisonFieldsVarsBuilder)? updates]) =>
      (new GcomparisonFieldsVarsBuilder()..update(updates)).build();

  _$GcomparisonFieldsVars._({this.first}) : super._();

  @override
  GcomparisonFieldsVars rebuild(
          void Function(GcomparisonFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsVarsBuilder toBuilder() =>
      new GcomparisonFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFieldsVars && first == other.first;
  }

  @override
  int get hashCode {
    return $jf($jc(0, first.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GcomparisonFieldsVars')
          ..add('first', first))
        .toString();
  }
}

class GcomparisonFieldsVarsBuilder
    implements Builder<GcomparisonFieldsVars, GcomparisonFieldsVarsBuilder> {
  _$GcomparisonFieldsVars? _$v;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  GcomparisonFieldsVarsBuilder();

  GcomparisonFieldsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcomparisonFieldsVars;
  }

  @override
  void update(void Function(GcomparisonFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcomparisonFieldsVars build() {
    final _$result = _$v ?? new _$GcomparisonFieldsVars._(first: first);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
