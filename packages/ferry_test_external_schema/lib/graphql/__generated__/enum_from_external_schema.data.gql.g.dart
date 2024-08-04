// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_from_external_schema.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQueryHeroByEpisodeData> _$gQueryHeroByEpisodeDataSerializer =
    new _$GQueryHeroByEpisodeDataSerializer();
Serializer<GQueryHeroByEpisodeData_hero>
    _$gQueryHeroByEpisodeDataHeroSerializer =
    new _$GQueryHeroByEpisodeData_heroSerializer();

class _$GQueryHeroByEpisodeDataSerializer
    implements StructuredSerializer<GQueryHeroByEpisodeData> {
  @override
  final Iterable<Type> types = const [
    GQueryHeroByEpisodeData,
    _$GQueryHeroByEpisodeData
  ];
  @override
  final String wireName = 'GQueryHeroByEpisodeData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryHeroByEpisodeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.hero;
    if (value != null) {
      result
        ..add('hero')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GQueryHeroByEpisodeData_hero)));
    }
    return result;
  }

  @override
  GQueryHeroByEpisodeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryHeroByEpisodeDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'hero':
          result.hero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GQueryHeroByEpisodeData_hero))!
              as GQueryHeroByEpisodeData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryHeroByEpisodeData_heroSerializer
    implements StructuredSerializer<GQueryHeroByEpisodeData_hero> {
  @override
  final Iterable<Type> types = const [
    GQueryHeroByEpisodeData_hero,
    _$GQueryHeroByEpisodeData_hero
  ];
  @override
  final String wireName = 'GQueryHeroByEpisodeData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryHeroByEpisodeData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GQueryHeroByEpisodeData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryHeroByEpisodeData_heroBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryHeroByEpisodeData extends GQueryHeroByEpisodeData {
  @override
  final String G__typename;
  @override
  final GQueryHeroByEpisodeData_hero? hero;

  factory _$GQueryHeroByEpisodeData(
          [void Function(GQueryHeroByEpisodeDataBuilder)? updates]) =>
      (new GQueryHeroByEpisodeDataBuilder()..update(updates))._build();

  _$GQueryHeroByEpisodeData._({required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GQueryHeroByEpisodeData', 'G__typename');
  }

  @override
  GQueryHeroByEpisodeData rebuild(
          void Function(GQueryHeroByEpisodeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryHeroByEpisodeDataBuilder toBuilder() =>
      new GQueryHeroByEpisodeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryHeroByEpisodeData &&
        G__typename == other.G__typename &&
        hero == other.hero;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hero.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GQueryHeroByEpisodeData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GQueryHeroByEpisodeDataBuilder
    implements
        Builder<GQueryHeroByEpisodeData, GQueryHeroByEpisodeDataBuilder> {
  _$GQueryHeroByEpisodeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GQueryHeroByEpisodeData_heroBuilder? _hero;
  GQueryHeroByEpisodeData_heroBuilder get hero =>
      _$this._hero ??= new GQueryHeroByEpisodeData_heroBuilder();
  set hero(GQueryHeroByEpisodeData_heroBuilder? hero) => _$this._hero = hero;

  GQueryHeroByEpisodeDataBuilder() {
    GQueryHeroByEpisodeData._initializeBuilder(this);
  }

  GQueryHeroByEpisodeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryHeroByEpisodeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryHeroByEpisodeData;
  }

  @override
  void update(void Function(GQueryHeroByEpisodeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryHeroByEpisodeData build() => _build();

  _$GQueryHeroByEpisodeData _build() {
    _$GQueryHeroByEpisodeData _$result;
    try {
      _$result = _$v ??
          new _$GQueryHeroByEpisodeData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GQueryHeroByEpisodeData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GQueryHeroByEpisodeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQueryHeroByEpisodeData_hero extends GQueryHeroByEpisodeData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GQueryHeroByEpisodeData_hero(
          [void Function(GQueryHeroByEpisodeData_heroBuilder)? updates]) =>
      (new GQueryHeroByEpisodeData_heroBuilder()..update(updates))._build();

  _$GQueryHeroByEpisodeData_hero._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GQueryHeroByEpisodeData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GQueryHeroByEpisodeData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GQueryHeroByEpisodeData_hero', 'name');
  }

  @override
  GQueryHeroByEpisodeData_hero rebuild(
          void Function(GQueryHeroByEpisodeData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryHeroByEpisodeData_heroBuilder toBuilder() =>
      new GQueryHeroByEpisodeData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryHeroByEpisodeData_hero &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GQueryHeroByEpisodeData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GQueryHeroByEpisodeData_heroBuilder
    implements
        Builder<GQueryHeroByEpisodeData_hero,
            GQueryHeroByEpisodeData_heroBuilder> {
  _$GQueryHeroByEpisodeData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GQueryHeroByEpisodeData_heroBuilder() {
    GQueryHeroByEpisodeData_hero._initializeBuilder(this);
  }

  GQueryHeroByEpisodeData_heroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryHeroByEpisodeData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryHeroByEpisodeData_hero;
  }

  @override
  void update(void Function(GQueryHeroByEpisodeData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryHeroByEpisodeData_hero build() => _build();

  _$GQueryHeroByEpisodeData_hero _build() {
    final _$result = _$v ??
        new _$GQueryHeroByEpisodeData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GQueryHeroByEpisodeData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GQueryHeroByEpisodeData_hero', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GQueryHeroByEpisodeData_hero', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
