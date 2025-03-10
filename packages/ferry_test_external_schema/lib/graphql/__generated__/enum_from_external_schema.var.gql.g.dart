// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_from_external_schema.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQueryHeroByEpisodeVars> _$gQueryHeroByEpisodeVarsSerializer =
    new _$GQueryHeroByEpisodeVarsSerializer();

class _$GQueryHeroByEpisodeVarsSerializer
    implements StructuredSerializer<GQueryHeroByEpisodeVars> {
  @override
  final Iterable<Type> types = const [
    GQueryHeroByEpisodeVars,
    _$GQueryHeroByEpisodeVars
  ];
  @override
  final String wireName = 'GQueryHeroByEpisodeVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryHeroByEpisodeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'episode',
      serializers.serialize(object.episode,
          specifiedType: const FullType(_i1.GEpisode)),
    ];

    return result;
  }

  @override
  GQueryHeroByEpisodeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryHeroByEpisodeVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode))! as _i1.GEpisode;
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryHeroByEpisodeVars extends GQueryHeroByEpisodeVars {
  @override
  final _i1.GEpisode episode;

  factory _$GQueryHeroByEpisodeVars(
          [void Function(GQueryHeroByEpisodeVarsBuilder)? updates]) =>
      (new GQueryHeroByEpisodeVarsBuilder()..update(updates))._build();

  _$GQueryHeroByEpisodeVars._({required this.episode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episode, r'GQueryHeroByEpisodeVars', 'episode');
  }

  @override
  GQueryHeroByEpisodeVars rebuild(
          void Function(GQueryHeroByEpisodeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryHeroByEpisodeVarsBuilder toBuilder() =>
      new GQueryHeroByEpisodeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryHeroByEpisodeVars && episode == other.episode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GQueryHeroByEpisodeVars')
          ..add('episode', episode))
        .toString();
  }
}

class GQueryHeroByEpisodeVarsBuilder
    implements
        Builder<GQueryHeroByEpisodeVars, GQueryHeroByEpisodeVarsBuilder> {
  _$GQueryHeroByEpisodeVars? _$v;

  _i1.GEpisode? _episode;
  _i1.GEpisode? get episode => _$this._episode;
  set episode(_i1.GEpisode? episode) => _$this._episode = episode;

  GQueryHeroByEpisodeVarsBuilder();

  GQueryHeroByEpisodeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryHeroByEpisodeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryHeroByEpisodeVars;
  }

  @override
  void update(void Function(GQueryHeroByEpisodeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryHeroByEpisodeVars build() => _build();

  _$GQueryHeroByEpisodeVars _build() {
    final _$result = _$v ??
        new _$GQueryHeroByEpisodeVars._(
          episode: BuiltValueNullFieldError.checkNotNull(
              episode, r'GQueryHeroByEpisodeVars', 'episode'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
