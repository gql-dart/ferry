// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aliased_hero.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAliasedHeroData> _$gAliasedHeroDataSerializer =
    new _$GAliasedHeroDataSerializer();
Serializer<GAliasedHeroData_empireHero> _$gAliasedHeroDataEmpireHeroSerializer =
    new _$GAliasedHeroData_empireHeroSerializer();
Serializer<GAliasedHeroData_jediHero> _$gAliasedHeroDataJediHeroSerializer =
    new _$GAliasedHeroData_jediHeroSerializer();

class _$GAliasedHeroDataSerializer
    implements StructuredSerializer<GAliasedHeroData> {
  @override
  final Iterable<Type> types = const [GAliasedHeroData, _$GAliasedHeroData];
  @override
  final String wireName = 'GAliasedHeroData';

  @override
  Iterable<Object> serialize(Serializers serializers, GAliasedHeroData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.empireHero != null) {
      result
        ..add('empireHero')
        ..add(serializers.serialize(object.empireHero,
            specifiedType: const FullType(GAliasedHeroData_empireHero)));
    }
    if (object.jediHero != null) {
      result
        ..add('jediHero')
        ..add(serializers.serialize(object.jediHero,
            specifiedType: const FullType(GAliasedHeroData_jediHero)));
    }
    return result;
  }

  @override
  GAliasedHeroData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'empireHero':
          result.empireHero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAliasedHeroData_empireHero))
              as GAliasedHeroData_empireHero);
          break;
        case 'jediHero':
          result.jediHero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAliasedHeroData_jediHero))
              as GAliasedHeroData_jediHero);
          break;
      }
    }

    return result.build();
  }
}

class _$GAliasedHeroData_empireHeroSerializer
    implements StructuredSerializer<GAliasedHeroData_empireHero> {
  @override
  final Iterable<Type> types = const [
    GAliasedHeroData_empireHero,
    _$GAliasedHeroData_empireHero
  ];
  @override
  final String wireName = 'GAliasedHeroData_empireHero';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAliasedHeroData_empireHero object,
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
    if (object.from != null) {
      result
        ..add('from')
        ..add(serializers.serialize(object.from,
            specifiedType: const FullType(
                BuiltList, const [const FullType(_i2.GEpisode)])));
    }
    return result;
  }

  @override
  GAliasedHeroData_empireHero deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroData_empireHeroBuilder();

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
        case 'from':
          result.from.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(_i2.GEpisode)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAliasedHeroData_jediHeroSerializer
    implements StructuredSerializer<GAliasedHeroData_jediHero> {
  @override
  final Iterable<Type> types = const [
    GAliasedHeroData_jediHero,
    _$GAliasedHeroData_jediHero
  ];
  @override
  final String wireName = 'GAliasedHeroData_jediHero';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAliasedHeroData_jediHero object,
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
    if (object.from != null) {
      result
        ..add('from')
        ..add(serializers.serialize(object.from,
            specifiedType: const FullType(
                BuiltList, const [const FullType(_i2.GEpisode)])));
    }
    return result;
  }

  @override
  GAliasedHeroData_jediHero deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroData_jediHeroBuilder();

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
        case 'from':
          result.from.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(_i2.GEpisode)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAliasedHeroData extends GAliasedHeroData {
  @override
  final GAliasedHeroData_empireHero empireHero;
  @override
  final GAliasedHeroData_jediHero jediHero;

  factory _$GAliasedHeroData(
          [void Function(GAliasedHeroDataBuilder) updates]) =>
      (new GAliasedHeroDataBuilder()..update(updates)).build();

  _$GAliasedHeroData._({this.empireHero, this.jediHero}) : super._();

  @override
  GAliasedHeroData rebuild(void Function(GAliasedHeroDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAliasedHeroDataBuilder toBuilder() =>
      new GAliasedHeroDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAliasedHeroData &&
        empireHero == other.empireHero &&
        jediHero == other.jediHero;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, empireHero.hashCode), jediHero.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAliasedHeroData')
          ..add('empireHero', empireHero)
          ..add('jediHero', jediHero))
        .toString();
  }
}

class GAliasedHeroDataBuilder
    implements Builder<GAliasedHeroData, GAliasedHeroDataBuilder> {
  _$GAliasedHeroData _$v;

  GAliasedHeroData_empireHeroBuilder _empireHero;
  GAliasedHeroData_empireHeroBuilder get empireHero =>
      _$this._empireHero ??= new GAliasedHeroData_empireHeroBuilder();
  set empireHero(GAliasedHeroData_empireHeroBuilder empireHero) =>
      _$this._empireHero = empireHero;

  GAliasedHeroData_jediHeroBuilder _jediHero;
  GAliasedHeroData_jediHeroBuilder get jediHero =>
      _$this._jediHero ??= new GAliasedHeroData_jediHeroBuilder();
  set jediHero(GAliasedHeroData_jediHeroBuilder jediHero) =>
      _$this._jediHero = jediHero;

  GAliasedHeroDataBuilder();

  GAliasedHeroDataBuilder get _$this {
    if (_$v != null) {
      _empireHero = _$v.empireHero?.toBuilder();
      _jediHero = _$v.jediHero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAliasedHeroData;
  }

  @override
  void update(void Function(GAliasedHeroDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAliasedHeroData build() {
    _$GAliasedHeroData _$result;
    try {
      _$result = _$v ??
          new _$GAliasedHeroData._(
              empireHero: _empireHero?.build(), jediHero: _jediHero?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'empireHero';
        _empireHero?.build();
        _$failedField = 'jediHero';
        _jediHero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAliasedHeroData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAliasedHeroData_empireHero extends GAliasedHeroData_empireHero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<_i2.GEpisode> from;

  factory _$GAliasedHeroData_empireHero(
          [void Function(GAliasedHeroData_empireHeroBuilder) updates]) =>
      (new GAliasedHeroData_empireHeroBuilder()..update(updates)).build();

  _$GAliasedHeroData_empireHero._(
      {this.G__typename, this.id, this.name, this.from})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GAliasedHeroData_empireHero', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GAliasedHeroData_empireHero', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GAliasedHeroData_empireHero', 'name');
    }
  }

  @override
  GAliasedHeroData_empireHero rebuild(
          void Function(GAliasedHeroData_empireHeroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAliasedHeroData_empireHeroBuilder toBuilder() =>
      new GAliasedHeroData_empireHeroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAliasedHeroData_empireHero &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        from == other.from;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
        from.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAliasedHeroData_empireHero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('from', from))
        .toString();
  }
}

class GAliasedHeroData_empireHeroBuilder
    implements
        Builder<GAliasedHeroData_empireHero,
            GAliasedHeroData_empireHeroBuilder> {
  _$GAliasedHeroData_empireHero _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<_i2.GEpisode> _from;
  ListBuilder<_i2.GEpisode> get from =>
      _$this._from ??= new ListBuilder<_i2.GEpisode>();
  set from(ListBuilder<_i2.GEpisode> from) => _$this._from = from;

  GAliasedHeroData_empireHeroBuilder() {
    GAliasedHeroData_empireHero._initializeBuilder(this);
  }

  GAliasedHeroData_empireHeroBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _from = _$v.from?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroData_empireHero other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAliasedHeroData_empireHero;
  }

  @override
  void update(void Function(GAliasedHeroData_empireHeroBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAliasedHeroData_empireHero build() {
    _$GAliasedHeroData_empireHero _$result;
    try {
      _$result = _$v ??
          new _$GAliasedHeroData_empireHero._(
              G__typename: G__typename,
              id: id,
              name: name,
              from: _from?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'from';
        _from?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAliasedHeroData_empireHero', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAliasedHeroData_jediHero extends GAliasedHeroData_jediHero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<_i2.GEpisode> from;

  factory _$GAliasedHeroData_jediHero(
          [void Function(GAliasedHeroData_jediHeroBuilder) updates]) =>
      (new GAliasedHeroData_jediHeroBuilder()..update(updates)).build();

  _$GAliasedHeroData_jediHero._(
      {this.G__typename, this.id, this.name, this.from})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GAliasedHeroData_jediHero', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GAliasedHeroData_jediHero', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GAliasedHeroData_jediHero', 'name');
    }
  }

  @override
  GAliasedHeroData_jediHero rebuild(
          void Function(GAliasedHeroData_jediHeroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAliasedHeroData_jediHeroBuilder toBuilder() =>
      new GAliasedHeroData_jediHeroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAliasedHeroData_jediHero &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        from == other.from;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
        from.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAliasedHeroData_jediHero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('from', from))
        .toString();
  }
}

class GAliasedHeroData_jediHeroBuilder
    implements
        Builder<GAliasedHeroData_jediHero, GAliasedHeroData_jediHeroBuilder> {
  _$GAliasedHeroData_jediHero _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<_i2.GEpisode> _from;
  ListBuilder<_i2.GEpisode> get from =>
      _$this._from ??= new ListBuilder<_i2.GEpisode>();
  set from(ListBuilder<_i2.GEpisode> from) => _$this._from = from;

  GAliasedHeroData_jediHeroBuilder() {
    GAliasedHeroData_jediHero._initializeBuilder(this);
  }

  GAliasedHeroData_jediHeroBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _from = _$v.from?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroData_jediHero other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAliasedHeroData_jediHero;
  }

  @override
  void update(void Function(GAliasedHeroData_jediHeroBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAliasedHeroData_jediHero build() {
    _$GAliasedHeroData_jediHero _$result;
    try {
      _$result = _$v ??
          new _$GAliasedHeroData_jediHero._(
              G__typename: G__typename,
              id: id,
              name: name,
              from: _from?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'from';
        _from?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAliasedHeroData_jediHero', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
