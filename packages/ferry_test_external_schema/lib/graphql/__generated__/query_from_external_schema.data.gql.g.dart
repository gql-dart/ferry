// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_from_external_schema.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanQueryData> _$gHumanQueryDataSerializer =
    new _$GHumanQueryDataSerializer();
Serializer<GHumanQueryData_human> _$gHumanQueryDataHumanSerializer =
    new _$GHumanQueryData_humanSerializer();
Serializer<GHumanFragData> _$gHumanFragDataSerializer =
    new _$GHumanFragDataSerializer();

class _$GHumanQueryDataSerializer
    implements StructuredSerializer<GHumanQueryData> {
  @override
  final Iterable<Type> types = const [GHumanQueryData, _$GHumanQueryData];
  @override
  final String wireName = 'GHumanQueryData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHumanQueryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'human',
      serializers.serialize(object.human,
          specifiedType: const FullType(GHumanQueryData_human)),
    ];

    return result;
  }

  @override
  GHumanQueryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanQueryDataBuilder();

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
        case 'human':
          result.human.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GHumanQueryData_human))!
              as GHumanQueryData_human);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanQueryData_humanSerializer
    implements StructuredSerializer<GHumanQueryData_human> {
  @override
  final Iterable<Type> types = const [
    GHumanQueryData_human,
    _$GHumanQueryData_human
  ];
  @override
  final String wireName = 'GHumanQueryData_human';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanQueryData_human object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'birthday',
      serializers.serialize(object.birthday,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GHumanQueryData_human deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanQueryData_humanBuilder();

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
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanFragDataSerializer
    implements StructuredSerializer<GHumanFragData> {
  @override
  final Iterable<Type> types = const [GHumanFragData, _$GHumanFragData];
  @override
  final String wireName = 'GHumanFragData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHumanFragData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'birthday',
      serializers.serialize(object.birthday,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GHumanFragData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanFragDataBuilder();

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
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanQueryData extends GHumanQueryData {
  @override
  final String G__typename;
  @override
  final GHumanQueryData_human human;

  factory _$GHumanQueryData([void Function(GHumanQueryDataBuilder)? updates]) =>
      (new GHumanQueryDataBuilder()..update(updates))._build();

  _$GHumanQueryData._({required this.G__typename, required this.human})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanQueryData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(human, r'GHumanQueryData', 'human');
  }

  @override
  GHumanQueryData rebuild(void Function(GHumanQueryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanQueryDataBuilder toBuilder() =>
      new GHumanQueryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanQueryData &&
        G__typename == other.G__typename &&
        human == other.human;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, human.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanQueryData')
          ..add('G__typename', G__typename)
          ..add('human', human))
        .toString();
  }
}

class GHumanQueryDataBuilder
    implements Builder<GHumanQueryData, GHumanQueryDataBuilder> {
  _$GHumanQueryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHumanQueryData_humanBuilder? _human;
  GHumanQueryData_humanBuilder get human =>
      _$this._human ??= new GHumanQueryData_humanBuilder();
  set human(GHumanQueryData_humanBuilder? human) => _$this._human = human;

  GHumanQueryDataBuilder() {
    GHumanQueryData._initializeBuilder(this);
  }

  GHumanQueryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _human = $v.human.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanQueryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanQueryData;
  }

  @override
  void update(void Function(GHumanQueryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanQueryData build() => _build();

  _$GHumanQueryData _build() {
    _$GHumanQueryData _$result;
    try {
      _$result = _$v ??
          new _$GHumanQueryData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHumanQueryData', 'G__typename'),
            human: human.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'human';
        human.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHumanQueryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanQueryData_human extends GHumanQueryData_human {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final DateTime birthday;
  @override
  final double? height;

  factory _$GHumanQueryData_human(
          [void Function(GHumanQueryData_humanBuilder)? updates]) =>
      (new GHumanQueryData_humanBuilder()..update(updates))._build();

  _$GHumanQueryData_human._(
      {required this.G__typename,
      required this.id,
      required this.birthday,
      this.height})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanQueryData_human', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHumanQueryData_human', 'id');
    BuiltValueNullFieldError.checkNotNull(
        birthday, r'GHumanQueryData_human', 'birthday');
  }

  @override
  GHumanQueryData_human rebuild(
          void Function(GHumanQueryData_humanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanQueryData_humanBuilder toBuilder() =>
      new GHumanQueryData_humanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanQueryData_human &&
        G__typename == other.G__typename &&
        id == other.id &&
        birthday == other.birthday &&
        height == other.height;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanQueryData_human')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('birthday', birthday)
          ..add('height', height))
        .toString();
  }
}

class GHumanQueryData_humanBuilder
    implements Builder<GHumanQueryData_human, GHumanQueryData_humanBuilder> {
  _$GHumanQueryData_human? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  GHumanQueryData_humanBuilder() {
    GHumanQueryData_human._initializeBuilder(this);
  }

  GHumanQueryData_humanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _birthday = $v.birthday;
      _height = $v.height;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanQueryData_human other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanQueryData_human;
  }

  @override
  void update(void Function(GHumanQueryData_humanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanQueryData_human build() => _build();

  _$GHumanQueryData_human _build() {
    final _$result = _$v ??
        new _$GHumanQueryData_human._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GHumanQueryData_human', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GHumanQueryData_human', 'id'),
          birthday: BuiltValueNullFieldError.checkNotNull(
              birthday, r'GHumanQueryData_human', 'birthday'),
          height: height,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GHumanFragData extends GHumanFragData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final DateTime birthday;
  @override
  final double? height;

  factory _$GHumanFragData([void Function(GHumanFragDataBuilder)? updates]) =>
      (new GHumanFragDataBuilder()..update(updates))._build();

  _$GHumanFragData._(
      {required this.G__typename,
      required this.id,
      required this.birthday,
      this.height})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanFragData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHumanFragData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        birthday, r'GHumanFragData', 'birthday');
  }

  @override
  GHumanFragData rebuild(void Function(GHumanFragDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanFragDataBuilder toBuilder() =>
      new GHumanFragDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanFragData &&
        G__typename == other.G__typename &&
        id == other.id &&
        birthday == other.birthday &&
        height == other.height;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanFragData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('birthday', birthday)
          ..add('height', height))
        .toString();
  }
}

class GHumanFragDataBuilder
    implements Builder<GHumanFragData, GHumanFragDataBuilder> {
  _$GHumanFragData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  GHumanFragDataBuilder() {
    GHumanFragData._initializeBuilder(this);
  }

  GHumanFragDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _birthday = $v.birthday;
      _height = $v.height;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanFragData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanFragData;
  }

  @override
  void update(void Function(GHumanFragDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanFragData build() => _build();

  _$GHumanFragData _build() {
    final _$result = _$v ??
        new _$GHumanFragData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GHumanFragData', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GHumanFragData', 'id'),
          birthday: BuiltValueNullFieldError.checkNotNull(
              birthday, r'GHumanFragData', 'birthday'),
          height: height,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
