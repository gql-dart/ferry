// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPokemonVars> _$gAllPokemonVarsSerializer =
    new _$GAllPokemonVarsSerializer();

class _$GAllPokemonVarsSerializer
    implements StructuredSerializer<GAllPokemonVars> {
  @override
  final Iterable<Type> types = const [GAllPokemonVars, _$GAllPokemonVars];
  @override
  final String wireName = 'GAllPokemonVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAllPokemonVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAllPokemonVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonVars extends GAllPokemonVars {
  @override
  final int limit;
  @override
  final int offset;

  factory _$GAllPokemonVars([void Function(GAllPokemonVarsBuilder)? updates]) =>
      (new GAllPokemonVarsBuilder()..update(updates))._build();

  _$GAllPokemonVars._({required this.limit, required this.offset}) : super._() {
    BuiltValueNullFieldError.checkNotNull(limit, r'GAllPokemonVars', 'limit');
    BuiltValueNullFieldError.checkNotNull(offset, r'GAllPokemonVars', 'offset');
  }

  @override
  GAllPokemonVars rebuild(void Function(GAllPokemonVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonVarsBuilder toBuilder() =>
      new GAllPokemonVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonVars &&
        limit == other.limit &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllPokemonVars')
          ..add('limit', limit)
          ..add('offset', offset))
        .toString();
  }
}

class GAllPokemonVarsBuilder
    implements Builder<GAllPokemonVars, GAllPokemonVarsBuilder> {
  _$GAllPokemonVars? _$v;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  GAllPokemonVarsBuilder();

  GAllPokemonVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _limit = $v.limit;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonVars;
  }

  @override
  void update(void Function(GAllPokemonVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonVars build() => _build();

  _$GAllPokemonVars _build() {
    final _$result = _$v ??
        new _$GAllPokemonVars._(
          limit: BuiltValueNullFieldError.checkNotNull(
              limit, r'GAllPokemonVars', 'limit'),
          offset: BuiltValueNullFieldError.checkNotNull(
              offset, r'GAllPokemonVars', 'offset'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
