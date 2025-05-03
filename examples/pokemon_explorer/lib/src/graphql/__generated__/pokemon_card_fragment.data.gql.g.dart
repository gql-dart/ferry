// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNestedFragmentData> _$gNestedFragmentDataSerializer =
    new _$GNestedFragmentDataSerializer();
Serializer<GPokemonCardData> _$gPokemonCardDataSerializer =
    new _$GPokemonCardDataSerializer();
Serializer<GPokemonCardData_height> _$gPokemonCardDataHeightSerializer =
    new _$GPokemonCardData_heightSerializer();
Serializer<GPokemonCardData_weight> _$gPokemonCardDataWeightSerializer =
    new _$GPokemonCardData_weightSerializer();

class _$GNestedFragmentDataSerializer
    implements StructuredSerializer<GNestedFragmentData> {
  @override
  final Iterable<Type> types = const [
    GNestedFragmentData,
    _$GNestedFragmentData
  ];
  @override
  final String wireName = 'GNestedFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNestedFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'avatar',
      serializers.serialize(object.avatar,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GNestedFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNestedFragmentDataBuilder();

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
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCardDataSerializer
    implements StructuredSerializer<GPokemonCardData> {
  @override
  final Iterable<Type> types = const [GPokemonCardData, _$GPokemonCardData];
  @override
  final String wireName = 'GPokemonCardData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPokemonCardData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'avatar',
      serializers.serialize(object.avatar,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPokemonCardData_height)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPokemonCardData_weight)));
    }
    return result;
  }

  @override
  GPokemonCardData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonCardDataBuilder();

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
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'height':
          result.height.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPokemonCardData_height))!
              as GPokemonCardData_height);
          break;
        case 'weight':
          result.weight.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPokemonCardData_weight))!
              as GPokemonCardData_weight);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCardData_heightSerializer
    implements StructuredSerializer<GPokemonCardData_height> {
  @override
  final Iterable<Type> types = const [
    GPokemonCardData_height,
    _$GPokemonCardData_height
  ];
  @override
  final String wireName = 'GPokemonCardData_height';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonCardData_height object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.in_meter;
    if (value != null) {
      result
        ..add('in_meter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPokemonCardData_height deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonCardData_heightBuilder();

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
        case 'in_meter':
          result.in_meter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCardData_weightSerializer
    implements StructuredSerializer<GPokemonCardData_weight> {
  @override
  final Iterable<Type> types = const [
    GPokemonCardData_weight,
    _$GPokemonCardData_weight
  ];
  @override
  final String wireName = 'GPokemonCardData_weight';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonCardData_weight object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.in_kg;
    if (value != null) {
      result
        ..add('in_kg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPokemonCardData_weight deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonCardData_weightBuilder();

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
        case 'in_kg':
          result.in_kg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GNestedFragmentData extends GNestedFragmentData {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final String avatar;

  factory _$GNestedFragmentData(
          [void Function(GNestedFragmentDataBuilder)? updates]) =>
      (new GNestedFragmentDataBuilder()..update(updates))._build();

  _$GNestedFragmentData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.avatar})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GNestedFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GNestedFragmentData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GNestedFragmentData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        avatar, r'GNestedFragmentData', 'avatar');
  }

  @override
  GNestedFragmentData rebuild(
          void Function(GNestedFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNestedFragmentDataBuilder toBuilder() =>
      new GNestedFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNestedFragmentData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GNestedFragmentData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('avatar', avatar))
        .toString();
  }
}

class GNestedFragmentDataBuilder
    implements Builder<GNestedFragmentData, GNestedFragmentDataBuilder> {
  _$GNestedFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  GNestedFragmentDataBuilder() {
    GNestedFragmentData._initializeBuilder(this);
  }

  GNestedFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNestedFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNestedFragmentData;
  }

  @override
  void update(void Function(GNestedFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GNestedFragmentData build() => _build();

  _$GNestedFragmentData _build() {
    final _$result = _$v ??
        new _$GNestedFragmentData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GNestedFragmentData', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GNestedFragmentData', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GNestedFragmentData', 'name'),
          avatar: BuiltValueNullFieldError.checkNotNull(
              avatar, r'GNestedFragmentData', 'avatar'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCardData extends GPokemonCardData {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final String avatar;
  @override
  final GPokemonCardData_height? height;
  @override
  final GPokemonCardData_weight? weight;

  factory _$GPokemonCardData(
          [void Function(GPokemonCardDataBuilder)? updates]) =>
      (new GPokemonCardDataBuilder()..update(updates))._build();

  _$GPokemonCardData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.avatar,
      this.height,
      this.weight})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonCardData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPokemonCardData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GPokemonCardData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        avatar, r'GPokemonCardData', 'avatar');
  }

  @override
  GPokemonCardData rebuild(void Function(GPokemonCardDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCardDataBuilder toBuilder() =>
      new GPokemonCardDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCardData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        avatar == other.avatar &&
        height == other.height &&
        weight == other.weight;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCardData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('avatar', avatar)
          ..add('height', height)
          ..add('weight', weight))
        .toString();
  }
}

class GPokemonCardDataBuilder
    implements Builder<GPokemonCardData, GPokemonCardDataBuilder> {
  _$GPokemonCardData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  GPokemonCardData_heightBuilder? _height;
  GPokemonCardData_heightBuilder get height =>
      _$this._height ??= new GPokemonCardData_heightBuilder();
  set height(GPokemonCardData_heightBuilder? height) => _$this._height = height;

  GPokemonCardData_weightBuilder? _weight;
  GPokemonCardData_weightBuilder get weight =>
      _$this._weight ??= new GPokemonCardData_weightBuilder();
  set weight(GPokemonCardData_weightBuilder? weight) => _$this._weight = weight;

  GPokemonCardDataBuilder() {
    GPokemonCardData._initializeBuilder(this);
  }

  GPokemonCardDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _avatar = $v.avatar;
      _height = $v.height?.toBuilder();
      _weight = $v.weight?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCardData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonCardData;
  }

  @override
  void update(void Function(GPokemonCardDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCardData build() => _build();

  _$GPokemonCardData _build() {
    _$GPokemonCardData _$result;
    try {
      _$result = _$v ??
          new _$GPokemonCardData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPokemonCardData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPokemonCardData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPokemonCardData', 'name'),
            avatar: BuiltValueNullFieldError.checkNotNull(
                avatar, r'GPokemonCardData', 'avatar'),
            height: _height?.build(),
            weight: _weight?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'height';
        _height?.build();
        _$failedField = 'weight';
        _weight?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPokemonCardData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCardData_height extends GPokemonCardData_height {
  @override
  final String G__typename;
  @override
  final String? in_meter;

  factory _$GPokemonCardData_height(
          [void Function(GPokemonCardData_heightBuilder)? updates]) =>
      (new GPokemonCardData_heightBuilder()..update(updates))._build();

  _$GPokemonCardData_height._({required this.G__typename, this.in_meter})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonCardData_height', 'G__typename');
  }

  @override
  GPokemonCardData_height rebuild(
          void Function(GPokemonCardData_heightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCardData_heightBuilder toBuilder() =>
      new GPokemonCardData_heightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCardData_height &&
        G__typename == other.G__typename &&
        in_meter == other.in_meter;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, in_meter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCardData_height')
          ..add('G__typename', G__typename)
          ..add('in_meter', in_meter))
        .toString();
  }
}

class GPokemonCardData_heightBuilder
    implements
        Builder<GPokemonCardData_height, GPokemonCardData_heightBuilder> {
  _$GPokemonCardData_height? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _in_meter;
  String? get in_meter => _$this._in_meter;
  set in_meter(String? in_meter) => _$this._in_meter = in_meter;

  GPokemonCardData_heightBuilder() {
    GPokemonCardData_height._initializeBuilder(this);
  }

  GPokemonCardData_heightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _in_meter = $v.in_meter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCardData_height other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonCardData_height;
  }

  @override
  void update(void Function(GPokemonCardData_heightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCardData_height build() => _build();

  _$GPokemonCardData_height _build() {
    final _$result = _$v ??
        new _$GPokemonCardData_height._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GPokemonCardData_height', 'G__typename'),
          in_meter: in_meter,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCardData_weight extends GPokemonCardData_weight {
  @override
  final String G__typename;
  @override
  final String? in_kg;

  factory _$GPokemonCardData_weight(
          [void Function(GPokemonCardData_weightBuilder)? updates]) =>
      (new GPokemonCardData_weightBuilder()..update(updates))._build();

  _$GPokemonCardData_weight._({required this.G__typename, this.in_kg})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonCardData_weight', 'G__typename');
  }

  @override
  GPokemonCardData_weight rebuild(
          void Function(GPokemonCardData_weightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCardData_weightBuilder toBuilder() =>
      new GPokemonCardData_weightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCardData_weight &&
        G__typename == other.G__typename &&
        in_kg == other.in_kg;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, in_kg.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCardData_weight')
          ..add('G__typename', G__typename)
          ..add('in_kg', in_kg))
        .toString();
  }
}

class GPokemonCardData_weightBuilder
    implements
        Builder<GPokemonCardData_weight, GPokemonCardData_weightBuilder> {
  _$GPokemonCardData_weight? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _in_kg;
  String? get in_kg => _$this._in_kg;
  set in_kg(String? in_kg) => _$this._in_kg = in_kg;

  GPokemonCardData_weightBuilder() {
    GPokemonCardData_weight._initializeBuilder(this);
  }

  GPokemonCardData_weightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _in_kg = $v.in_kg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCardData_weight other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonCardData_weight;
  }

  @override
  void update(void Function(GPokemonCardData_weightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCardData_weight build() => _build();

  _$GPokemonCardData_weight _build() {
    final _$result = _$v ??
        new _$GPokemonCardData_weight._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GPokemonCardData_weight', 'G__typename'),
          in_kg: in_kg,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
