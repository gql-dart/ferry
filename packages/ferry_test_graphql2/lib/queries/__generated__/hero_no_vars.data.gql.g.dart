// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_no_vars.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroNoVarsData> _$gHeroNoVarsDataSerializer =
    new _$GHeroNoVarsDataSerializer();
Serializer<GHeroNoVarsData_hero> _$gHeroNoVarsDataHeroSerializer =
    new _$GHeroNoVarsData_heroSerializer();

class _$GHeroNoVarsDataSerializer
    implements StructuredSerializer<GHeroNoVarsData> {
  @override
  final Iterable<Type> types = const [GHeroNoVarsData, _$GHeroNoVarsData];
  @override
  final String wireName = 'GHeroNoVarsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroNoVarsData object,
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
            specifiedType: const FullType(GHeroNoVarsData_hero)));
    }
    return result;
  }

  @override
  GHeroNoVarsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroNoVarsDataBuilder();

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
                  specifiedType: const FullType(GHeroNoVarsData_hero))!
              as GHeroNoVarsData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroNoVarsData_heroSerializer
    implements StructuredSerializer<GHeroNoVarsData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroNoVarsData_hero,
    _$GHeroNoVarsData_hero
  ];
  @override
  final String wireName = 'GHeroNoVarsData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroNoVarsData_hero object,
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
  GHeroNoVarsData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroNoVarsData_heroBuilder();

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

class _$GHeroNoVarsData extends GHeroNoVarsData {
  @override
  final String G__typename;
  @override
  final GHeroNoVarsData_hero? hero;

  factory _$GHeroNoVarsData([void Function(GHeroNoVarsDataBuilder)? updates]) =>
      (new GHeroNoVarsDataBuilder()..update(updates))._build();

  _$GHeroNoVarsData._({required this.G__typename, this.hero}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroNoVarsData', 'G__typename');
  }

  @override
  GHeroNoVarsData rebuild(void Function(GHeroNoVarsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroNoVarsDataBuilder toBuilder() =>
      new GHeroNoVarsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroNoVarsData &&
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
    return (newBuiltValueToStringHelper(r'GHeroNoVarsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroNoVarsDataBuilder
    implements Builder<GHeroNoVarsData, GHeroNoVarsDataBuilder> {
  _$GHeroNoVarsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroNoVarsData_heroBuilder? _hero;
  GHeroNoVarsData_heroBuilder get hero =>
      _$this._hero ??= new GHeroNoVarsData_heroBuilder();
  set hero(GHeroNoVarsData_heroBuilder? hero) => _$this._hero = hero;

  GHeroNoVarsDataBuilder() {
    GHeroNoVarsData._initializeBuilder(this);
  }

  GHeroNoVarsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroNoVarsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroNoVarsData;
  }

  @override
  void update(void Function(GHeroNoVarsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroNoVarsData build() => _build();

  _$GHeroNoVarsData _build() {
    _$GHeroNoVarsData _$result;
    try {
      _$result = _$v ??
          new _$GHeroNoVarsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroNoVarsData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroNoVarsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroNoVarsData_hero extends GHeroNoVarsData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroNoVarsData_hero(
          [void Function(GHeroNoVarsData_heroBuilder)? updates]) =>
      (new GHeroNoVarsData_heroBuilder()..update(updates))._build();

  _$GHeroNoVarsData_hero._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroNoVarsData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHeroNoVarsData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroNoVarsData_hero', 'name');
  }

  @override
  GHeroNoVarsData_hero rebuild(
          void Function(GHeroNoVarsData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroNoVarsData_heroBuilder toBuilder() =>
      new GHeroNoVarsData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroNoVarsData_hero &&
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
    return (newBuiltValueToStringHelper(r'GHeroNoVarsData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroNoVarsData_heroBuilder
    implements Builder<GHeroNoVarsData_hero, GHeroNoVarsData_heroBuilder> {
  _$GHeroNoVarsData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroNoVarsData_heroBuilder() {
    GHeroNoVarsData_hero._initializeBuilder(this);
  }

  GHeroNoVarsData_heroBuilder get _$this {
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
  void replace(GHeroNoVarsData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroNoVarsData_hero;
  }

  @override
  void update(void Function(GHeroNoVarsData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroNoVarsData_hero build() => _build();

  _$GHeroNoVarsData_hero _build() {
    final _$result = _$v ??
        new _$GHeroNoVarsData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroNoVarsData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroNoVarsData_hero', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroNoVarsData_hero', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
