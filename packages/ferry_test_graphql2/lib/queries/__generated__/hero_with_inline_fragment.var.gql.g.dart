// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_inline_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GHeroForEpisodeVars extends GHeroForEpisodeVars {
  @override
  final _i1.GEpisode ep;

  factory _$GHeroForEpisodeVars(
          [void Function(GHeroForEpisodeVarsBuilder)? updates]) =>
      (new GHeroForEpisodeVarsBuilder()..update(updates))._build();

  _$GHeroForEpisodeVars._({required this.ep}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ep, r'GHeroForEpisodeVars', 'ep');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, ep.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroForEpisodeVars')..add('ep', ep))
        .toString();
  }
}

class GHeroForEpisodeVarsBuilder
    implements Builder<GHeroForEpisodeVars, GHeroForEpisodeVarsBuilder> {
  _$GHeroForEpisodeVars? _$v;

  _i1.GEpisode? _ep;
  _i1.GEpisode? get ep => _$this._ep;
  set ep(_i1.GEpisode? ep) => _$this._ep = ep;

  GHeroForEpisodeVarsBuilder();

  GHeroForEpisodeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ep = $v.ep;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroForEpisodeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroForEpisodeVars;
  }

  @override
  void update(void Function(GHeroForEpisodeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroForEpisodeVars build() => _build();

  _$GHeroForEpisodeVars _build() {
    final _$result = _$v ??
        new _$GHeroForEpisodeVars._(
            ep: BuiltValueNullFieldError.checkNotNull(
                ep, r'GHeroForEpisodeVars', 'ep'));
    replace(_$result);
    return _$result;
  }
}

class _$GDroidFragmentVars extends GDroidFragmentVars {
  factory _$GDroidFragmentVars(
          [void Function(GDroidFragmentVarsBuilder)? updates]) =>
      (new GDroidFragmentVarsBuilder()..update(updates))._build();

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
    return newBuiltValueToStringHelper(r'GDroidFragmentVars').toString();
  }
}

class GDroidFragmentVarsBuilder
    implements Builder<GDroidFragmentVars, GDroidFragmentVarsBuilder> {
  _$GDroidFragmentVars? _$v;

  GDroidFragmentVarsBuilder();

  @override
  void replace(GDroidFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDroidFragmentVars;
  }

  @override
  void update(void Function(GDroidFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDroidFragmentVars build() => _build();

  _$GDroidFragmentVars _build() {
    final _$result = _$v ?? new _$GDroidFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
