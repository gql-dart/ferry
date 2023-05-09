// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GReviewsVars extends GReviewsVars {
  @override
  final _i2.Value<_i1.GEpisode>? episode;
  @override
  final _i2.Value<int>? first;
  @override
  final _i2.Value<int>? offset;

  factory _$GReviewsVars([void Function(GReviewsVarsBuilder)? updates]) =>
      (new GReviewsVarsBuilder()..update(updates))._build();

  _$GReviewsVars._({this.episode, this.first, this.offset}) : super._();

  @override
  GReviewsVars rebuild(void Function(GReviewsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsVarsBuilder toBuilder() => new GReviewsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsVars &&
        episode == other.episode &&
        first == other.first &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, first.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewsVars')
          ..add('episode', episode)
          ..add('first', first)
          ..add('offset', offset))
        .toString();
  }
}

class GReviewsVarsBuilder
    implements Builder<GReviewsVars, GReviewsVarsBuilder> {
  _$GReviewsVars? _$v;

  _i2.Value<_i1.GEpisode>? _episode;
  _i2.Value<_i1.GEpisode>? get episode => _$this._episode;
  set episode(_i2.Value<_i1.GEpisode>? episode) => _$this._episode = episode;

  _i2.Value<int>? _first;
  _i2.Value<int>? get first => _$this._first;
  set first(_i2.Value<int>? first) => _$this._first = first;

  _i2.Value<int>? _offset;
  _i2.Value<int>? get offset => _$this._offset;
  set offset(_i2.Value<int>? offset) => _$this._offset = offset;

  GReviewsVarsBuilder();

  GReviewsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _first = $v.first;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsVars;
  }

  @override
  void update(void Function(GReviewsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewsVars build() => _build();

  _$GReviewsVars _build() {
    final _$result = _$v ??
        new _$GReviewsVars._(episode: episode, first: first, offset: offset);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
