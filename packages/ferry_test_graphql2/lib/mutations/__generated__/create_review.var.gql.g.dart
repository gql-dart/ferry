// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GCreateReviewVars extends GCreateReviewVars {
  @override
  final _i2.Value<_i1.GEpisode>? episode;
  @override
  final _i1.GReviewInput review;

  factory _$GCreateReviewVars(
          [void Function(GCreateReviewVarsBuilder)? updates]) =>
      (new GCreateReviewVarsBuilder()..update(updates))._build();

  _$GCreateReviewVars._({this.episode, required this.review}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        review, r'GCreateReviewVars', 'review');
  }

  @override
  GCreateReviewVars rebuild(void Function(GCreateReviewVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateReviewVarsBuilder toBuilder() =>
      new GCreateReviewVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateReviewVars &&
        episode == other.episode &&
        review == other.review;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateReviewVars')
          ..add('episode', episode)
          ..add('review', review))
        .toString();
  }
}

class GCreateReviewVarsBuilder
    implements Builder<GCreateReviewVars, GCreateReviewVarsBuilder> {
  _$GCreateReviewVars? _$v;

  _i2.Value<_i1.GEpisode>? _episode;
  _i2.Value<_i1.GEpisode>? get episode => _$this._episode;
  set episode(_i2.Value<_i1.GEpisode>? episode) => _$this._episode = episode;

  _i1.GReviewInputBuilder? _review;
  _i1.GReviewInputBuilder get review =>
      _$this._review ??= new _i1.GReviewInputBuilder();
  set review(_i1.GReviewInputBuilder? review) => _$this._review = review;

  GCreateReviewVarsBuilder();

  GCreateReviewVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _review = $v.review.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateReviewVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateReviewVars;
  }

  @override
  void update(void Function(GCreateReviewVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateReviewVars build() => _build();

  _$GCreateReviewVars _build() {
    _$GCreateReviewVars _$result;
    try {
      _$result = _$v ??
          new _$GCreateReviewVars._(episode: episode, review: review.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'review';
        review.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateReviewVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
