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
  Iterable<Object?> serialize(Serializers serializers, GAliasedHeroVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ep',
      serializers.serialize(object.ep,
          specifiedType: const FullType(_i1.GEpisode)),
    ];

    return result;
  }

  @override
  GAliasedHeroVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ep':
          result.ep = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode))! as _i1.GEpisode;
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
          [void Function(GAliasedHeroVarsBuilder)? updates]) =>
      (new GAliasedHeroVarsBuilder()..update(updates))._build();

  _$GAliasedHeroVars._({required this.ep}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ep, r'GAliasedHeroVars', 'ep');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, ep.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAliasedHeroVars')..add('ep', ep))
        .toString();
  }
}

class GAliasedHeroVarsBuilder
    implements Builder<GAliasedHeroVars, GAliasedHeroVarsBuilder> {
  _$GAliasedHeroVars? _$v;

  _i1.GEpisode? _ep;
  _i1.GEpisode? get ep => _$this._ep;
  set ep(_i1.GEpisode? ep) => _$this._ep = ep;

  GAliasedHeroVarsBuilder();

  GAliasedHeroVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ep = $v.ep;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAliasedHeroVars;
  }

  @override
  void update(void Function(GAliasedHeroVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAliasedHeroVars build() => _build();

  _$GAliasedHeroVars _build() {
    final _$result = _$v ??
        new _$GAliasedHeroVars._(
            ep: BuiltValueNullFieldError.checkNotNull(
                ep, r'GAliasedHeroVars', 'ep'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
