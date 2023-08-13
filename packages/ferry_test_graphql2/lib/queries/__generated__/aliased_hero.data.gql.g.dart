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
  Iterable<Object?> serialize(Serializers serializers, GAliasedHeroData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.empireHero;
    if (value != null) {
      result
        ..add('empireHero')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAliasedHeroData_empireHero)));
    }
    value = object.jediHero;
    if (value != null) {
      result
        ..add('jediHero')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAliasedHeroData_jediHero)));
    }
    return result;
  }

  @override
  GAliasedHeroData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroDataBuilder();

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
        case 'empireHero':
          result.empireHero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAliasedHeroData_empireHero))!
              as GAliasedHeroData_empireHero);
          break;
        case 'jediHero':
          result.jediHero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAliasedHeroData_jediHero))!
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
  Iterable<Object?> serialize(
      Serializers serializers, GAliasedHeroData_empireHero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'from',
      serializers.serialize(object.from,
          specifiedType: const FullType(
              BuiltList, const [const FullType.nullable(_i2.GEpisode)])),
    ];

    return result;
  }

  @override
  GAliasedHeroData_empireHero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroData_empireHeroBuilder();

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
        case 'from':
          result.from.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(_i2.GEpisode)
              ]))! as BuiltList<Object?>);
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
  Iterable<Object?> serialize(
      Serializers serializers, GAliasedHeroData_jediHero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'from',
      serializers.serialize(object.from,
          specifiedType: const FullType(
              BuiltList, const [const FullType.nullable(_i2.GEpisode)])),
    ];

    return result;
  }

  @override
  GAliasedHeroData_jediHero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroData_jediHeroBuilder();

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
        case 'from':
          result.from.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(_i2.GEpisode)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAliasedHeroData extends GAliasedHeroData {
  @override
  final String G__typename;
  @override
  final GAliasedHeroData_empireHero? empireHero;
  @override
  final GAliasedHeroData_jediHero? jediHero;

  factory _$GAliasedHeroData(
          [void Function(GAliasedHeroDataBuilder)? updates]) =>
      (new GAliasedHeroDataBuilder()..update(updates))._build();

  _$GAliasedHeroData._(
      {required this.G__typename, this.empireHero, this.jediHero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAliasedHeroData', 'G__typename');
  }

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
        G__typename == other.G__typename &&
        empireHero == other.empireHero &&
        jediHero == other.jediHero;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, empireHero.hashCode);
    _$hash = $jc(_$hash, jediHero.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAliasedHeroData')
          ..add('G__typename', G__typename)
          ..add('empireHero', empireHero)
          ..add('jediHero', jediHero))
        .toString();
  }
}

class GAliasedHeroDataBuilder
    implements Builder<GAliasedHeroData, GAliasedHeroDataBuilder> {
  _$GAliasedHeroData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAliasedHeroData_empireHeroBuilder? _empireHero;
  GAliasedHeroData_empireHeroBuilder get empireHero =>
      _$this._empireHero ??= new GAliasedHeroData_empireHeroBuilder();
  set empireHero(GAliasedHeroData_empireHeroBuilder? empireHero) =>
      _$this._empireHero = empireHero;

  GAliasedHeroData_jediHeroBuilder? _jediHero;
  GAliasedHeroData_jediHeroBuilder get jediHero =>
      _$this._jediHero ??= new GAliasedHeroData_jediHeroBuilder();
  set jediHero(GAliasedHeroData_jediHeroBuilder? jediHero) =>
      _$this._jediHero = jediHero;

  GAliasedHeroDataBuilder() {
    GAliasedHeroData._initializeBuilder(this);
  }

  GAliasedHeroDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _empireHero = $v.empireHero?.toBuilder();
      _jediHero = $v.jediHero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAliasedHeroData;
  }

  @override
  void update(void Function(GAliasedHeroDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAliasedHeroData build() => _build();

  _$GAliasedHeroData _build() {
    _$GAliasedHeroData _$result;
    try {
      _$result = _$v ??
          new _$GAliasedHeroData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAliasedHeroData', 'G__typename'),
              empireHero: _empireHero?.build(),
              jediHero: _jediHero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'empireHero';
        _empireHero?.build();
        _$failedField = 'jediHero';
        _jediHero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAliasedHeroData', _$failedField, e.toString());
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
  final BuiltList<_i2.GEpisode?> from;

  factory _$GAliasedHeroData_empireHero(
          [void Function(GAliasedHeroData_empireHeroBuilder)? updates]) =>
      (new GAliasedHeroData_empireHeroBuilder()..update(updates))._build();

  _$GAliasedHeroData_empireHero._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.from})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAliasedHeroData_empireHero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAliasedHeroData_empireHero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GAliasedHeroData_empireHero', 'name');
    BuiltValueNullFieldError.checkNotNull(
        from, r'GAliasedHeroData_empireHero', 'from');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAliasedHeroData_empireHero')
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
  _$GAliasedHeroData_empireHero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<_i2.GEpisode?>? _from;
  ListBuilder<_i2.GEpisode?> get from =>
      _$this._from ??= new ListBuilder<_i2.GEpisode?>();
  set from(ListBuilder<_i2.GEpisode?>? from) => _$this._from = from;

  GAliasedHeroData_empireHeroBuilder() {
    GAliasedHeroData_empireHero._initializeBuilder(this);
  }

  GAliasedHeroData_empireHeroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _from = $v.from.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroData_empireHero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAliasedHeroData_empireHero;
  }

  @override
  void update(void Function(GAliasedHeroData_empireHeroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAliasedHeroData_empireHero build() => _build();

  _$GAliasedHeroData_empireHero _build() {
    _$GAliasedHeroData_empireHero _$result;
    try {
      _$result = _$v ??
          new _$GAliasedHeroData_empireHero._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAliasedHeroData_empireHero', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAliasedHeroData_empireHero', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GAliasedHeroData_empireHero', 'name'),
              from: from.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'from';
        from.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAliasedHeroData_empireHero', _$failedField, e.toString());
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
  final BuiltList<_i2.GEpisode?> from;

  factory _$GAliasedHeroData_jediHero(
          [void Function(GAliasedHeroData_jediHeroBuilder)? updates]) =>
      (new GAliasedHeroData_jediHeroBuilder()..update(updates))._build();

  _$GAliasedHeroData_jediHero._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.from})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAliasedHeroData_jediHero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAliasedHeroData_jediHero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GAliasedHeroData_jediHero', 'name');
    BuiltValueNullFieldError.checkNotNull(
        from, r'GAliasedHeroData_jediHero', 'from');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAliasedHeroData_jediHero')
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
  _$GAliasedHeroData_jediHero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<_i2.GEpisode?>? _from;
  ListBuilder<_i2.GEpisode?> get from =>
      _$this._from ??= new ListBuilder<_i2.GEpisode?>();
  set from(ListBuilder<_i2.GEpisode?>? from) => _$this._from = from;

  GAliasedHeroData_jediHeroBuilder() {
    GAliasedHeroData_jediHero._initializeBuilder(this);
  }

  GAliasedHeroData_jediHeroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _from = $v.from.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHeroData_jediHero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAliasedHeroData_jediHero;
  }

  @override
  void update(void Function(GAliasedHeroData_jediHeroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAliasedHeroData_jediHero build() => _build();

  _$GAliasedHeroData_jediHero _build() {
    _$GAliasedHeroData_jediHero _$result;
    try {
      _$result = _$v ??
          new _$GAliasedHeroData_jediHero._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAliasedHeroData_jediHero', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAliasedHeroData_jediHero', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GAliasedHeroData_jediHero', 'name'),
              from: from.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'from';
        from.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAliasedHeroData_jediHero', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
