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
  Iterable<Object> serialize(Serializers serializers, GHeroNoVarsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.hero != null) {
      result
        ..add('hero')
        ..add(serializers.serialize(object.hero,
            specifiedType: const FullType(GHeroNoVarsData_hero)));
    }
    return result;
  }

  @override
  GHeroNoVarsData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroNoVarsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hero':
          result.hero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GHeroNoVarsData_hero))
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
  Iterable<Object> serialize(
      Serializers serializers, GHeroNoVarsData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroNoVarsData_heroBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroNoVarsData extends GHeroNoVarsData {
  @override
  final GHeroNoVarsData_hero hero;

  factory _$GHeroNoVarsData([void Function(GHeroNoVarsDataBuilder) updates]) =>
      (new GHeroNoVarsDataBuilder()..update(updates)).build();

  _$GHeroNoVarsData._({this.hero}) : super._();

  @override
  GHeroNoVarsData rebuild(void Function(GHeroNoVarsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroNoVarsDataBuilder toBuilder() =>
      new GHeroNoVarsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroNoVarsData && hero == other.hero;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hero.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroNoVarsData')..add('hero', hero))
        .toString();
  }
}

class GHeroNoVarsDataBuilder
    implements Builder<GHeroNoVarsData, GHeroNoVarsDataBuilder> {
  _$GHeroNoVarsData _$v;

  GHeroNoVarsData_heroBuilder _hero;
  GHeroNoVarsData_heroBuilder get hero =>
      _$this._hero ??= new GHeroNoVarsData_heroBuilder();
  set hero(GHeroNoVarsData_heroBuilder hero) => _$this._hero = hero;

  GHeroNoVarsDataBuilder();

  GHeroNoVarsDataBuilder get _$this {
    if (_$v != null) {
      _hero = _$v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroNoVarsData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroNoVarsData;
  }

  @override
  void update(void Function(GHeroNoVarsDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroNoVarsData build() {
    _$GHeroNoVarsData _$result;
    try {
      _$result = _$v ?? new _$GHeroNoVarsData._(hero: _hero?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroNoVarsData', _$failedField, e.toString());
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
          [void Function(GHeroNoVarsData_heroBuilder) updates]) =>
      (new GHeroNoVarsData_heroBuilder()..update(updates)).build();

  _$GHeroNoVarsData_hero._({this.G__typename, this.id, this.name}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GHeroNoVarsData_hero', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GHeroNoVarsData_hero', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GHeroNoVarsData_hero', 'name');
    }
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
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroNoVarsData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroNoVarsData_heroBuilder
    implements Builder<GHeroNoVarsData_hero, GHeroNoVarsData_heroBuilder> {
  _$GHeroNoVarsData_hero _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GHeroNoVarsData_heroBuilder() {
    GHeroNoVarsData_hero._initializeBuilder(this);
  }

  GHeroNoVarsData_heroBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroNoVarsData_hero other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroNoVarsData_hero;
  }

  @override
  void update(void Function(GHeroNoVarsData_heroBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroNoVarsData_hero build() {
    final _$result = _$v ??
        new _$GHeroNoVarsData_hero._(
            G__typename: G__typename, id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
