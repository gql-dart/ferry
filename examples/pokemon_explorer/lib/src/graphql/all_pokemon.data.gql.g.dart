// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPokemonData> _$gAllPokemonDataSerializer =
    new _$GAllPokemonDataSerializer();
Serializer<GAllPokemonData_queryPokemon>
    _$gAllPokemonDataQueryPokemonSerializer =
    new _$GAllPokemonData_queryPokemonSerializer();

class _$GAllPokemonDataSerializer
    implements StructuredSerializer<GAllPokemonData> {
  @override
  final Iterable<Type> types = const [GAllPokemonData, _$GAllPokemonData];
  @override
  final String wireName = 'GAllPokemonData';

  @override
  Iterable<Object> serialize(Serializers serializers, GAllPokemonData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.queryPokemon != null) {
      result
        ..add('queryPokemon')
        ..add(serializers.serialize(object.queryPokemon,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GAllPokemonData_queryPokemon)])));
    }
    return result;
  }

  @override
  GAllPokemonData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonDataBuilder();

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
        case 'queryPokemon':
          result.queryPokemon.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GAllPokemonData_queryPokemon)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonData_queryPokemonSerializer
    implements StructuredSerializer<GAllPokemonData_queryPokemon> {
  @override
  final Iterable<Type> types = const [
    GAllPokemonData_queryPokemon,
    _$GAllPokemonData_queryPokemon
  ];
  @override
  final String wireName = 'GAllPokemonData_queryPokemon';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAllPokemonData_queryPokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.maxHP != null) {
      result
        ..add('maxHP')
        ..add(serializers.serialize(object.maxHP,
            specifiedType: const FullType(int)));
    }
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAllPokemonData_queryPokemon deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonData_queryPokemonBuilder();

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
        case 'maxHP':
          result.maxHP = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonData extends GAllPokemonData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAllPokemonData_queryPokemon> queryPokemon;

  factory _$GAllPokemonData([void Function(GAllPokemonDataBuilder) updates]) =>
      (new GAllPokemonDataBuilder()..update(updates)).build();

  _$GAllPokemonData._({this.G__typename, this.queryPokemon}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GAllPokemonData', 'G__typename');
    }
  }

  @override
  GAllPokemonData rebuild(void Function(GAllPokemonDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonDataBuilder toBuilder() =>
      new GAllPokemonDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData &&
        G__typename == other.G__typename &&
        queryPokemon == other.queryPokemon;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), queryPokemon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAllPokemonData')
          ..add('G__typename', G__typename)
          ..add('queryPokemon', queryPokemon))
        .toString();
  }
}

class GAllPokemonDataBuilder
    implements Builder<GAllPokemonData, GAllPokemonDataBuilder> {
  _$GAllPokemonData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAllPokemonData_queryPokemon> _queryPokemon;
  ListBuilder<GAllPokemonData_queryPokemon> get queryPokemon =>
      _$this._queryPokemon ??= new ListBuilder<GAllPokemonData_queryPokemon>();
  set queryPokemon(ListBuilder<GAllPokemonData_queryPokemon> queryPokemon) =>
      _$this._queryPokemon = queryPokemon;

  GAllPokemonDataBuilder() {
    GAllPokemonData._initializeBuilder(this);
  }

  GAllPokemonDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _queryPokemon = _$v.queryPokemon?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAllPokemonData;
  }

  @override
  void update(void Function(GAllPokemonDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAllPokemonData build() {
    _$GAllPokemonData _$result;
    try {
      _$result = _$v ??
          new _$GAllPokemonData._(
              G__typename: G__typename, queryPokemon: _queryPokemon?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'queryPokemon';
        _queryPokemon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAllPokemonData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAllPokemonData_queryPokemon extends GAllPokemonData_queryPokemon {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final int maxHP;
  @override
  final String image;

  factory _$GAllPokemonData_queryPokemon(
          [void Function(GAllPokemonData_queryPokemonBuilder) updates]) =>
      (new GAllPokemonData_queryPokemonBuilder()..update(updates)).build();

  _$GAllPokemonData_queryPokemon._(
      {this.G__typename, this.id, this.name, this.maxHP, this.image})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GAllPokemonData_queryPokemon', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GAllPokemonData_queryPokemon', 'id');
    }
  }

  @override
  GAllPokemonData_queryPokemon rebuild(
          void Function(GAllPokemonData_queryPokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonData_queryPokemonBuilder toBuilder() =>
      new GAllPokemonData_queryPokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData_queryPokemon &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        maxHP == other.maxHP &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
            maxHP.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAllPokemonData_queryPokemon')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('maxHP', maxHP)
          ..add('image', image))
        .toString();
  }
}

class GAllPokemonData_queryPokemonBuilder
    implements
        Builder<GAllPokemonData_queryPokemon,
            GAllPokemonData_queryPokemonBuilder> {
  _$GAllPokemonData_queryPokemon _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _maxHP;
  int get maxHP => _$this._maxHP;
  set maxHP(int maxHP) => _$this._maxHP = maxHP;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  GAllPokemonData_queryPokemonBuilder() {
    GAllPokemonData_queryPokemon._initializeBuilder(this);
  }

  GAllPokemonData_queryPokemonBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _maxHP = _$v.maxHP;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData_queryPokemon other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAllPokemonData_queryPokemon;
  }

  @override
  void update(void Function(GAllPokemonData_queryPokemonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAllPokemonData_queryPokemon build() {
    final _$result = _$v ??
        new _$GAllPokemonData_queryPokemon._(
            G__typename: G__typename,
            id: id,
            name: name,
            maxHP: maxHP,
            image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
