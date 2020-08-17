// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNestedFragmentData> _$gNestedFragmentDataSerializer =
    new _$GNestedFragmentDataSerializer();
Serializer<GPokemonCardData> _$gPokemonCardDataSerializer =
    new _$GPokemonCardDataSerializer();

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
  Iterable<Object> serialize(
      Serializers serializers, GNestedFragmentData object,
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
    return result;
  }

  @override
  GNestedFragmentData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNestedFragmentDataBuilder();

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

class _$GPokemonCardDataSerializer
    implements StructuredSerializer<GPokemonCardData> {
  @override
  final Iterable<Type> types = const [GPokemonCardData, _$GPokemonCardData];
  @override
  final String wireName = 'GPokemonCardData';

  @override
  Iterable<Object> serialize(Serializers serializers, GPokemonCardData object,
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
  GPokemonCardData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonCardDataBuilder();

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

class _$GNestedFragmentData extends GNestedFragmentData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GNestedFragmentData(
          [void Function(GNestedFragmentDataBuilder) updates]) =>
      (new GNestedFragmentDataBuilder()..update(updates)).build();

  _$GNestedFragmentData._({this.G__typename, this.id, this.name}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GNestedFragmentData', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GNestedFragmentData', 'id');
    }
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
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNestedFragmentData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GNestedFragmentDataBuilder
    implements Builder<GNestedFragmentData, GNestedFragmentDataBuilder> {
  _$GNestedFragmentData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GNestedFragmentDataBuilder() {
    GNestedFragmentData._initializeBuilder(this);
  }

  GNestedFragmentDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNestedFragmentData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GNestedFragmentData;
  }

  @override
  void update(void Function(GNestedFragmentDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNestedFragmentData build() {
    final _$result = _$v ??
        new _$GNestedFragmentData._(
            G__typename: G__typename, id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCardData extends GPokemonCardData {
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

  factory _$GPokemonCardData(
          [void Function(GPokemonCardDataBuilder) updates]) =>
      (new GPokemonCardDataBuilder()..update(updates)).build();

  _$GPokemonCardData._(
      {this.G__typename, this.id, this.name, this.maxHP, this.image})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GPokemonCardData', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GPokemonCardData', 'id');
    }
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
    return (newBuiltValueToStringHelper('GPokemonCardData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('maxHP', maxHP)
          ..add('image', image))
        .toString();
  }
}

class GPokemonCardDataBuilder
    implements Builder<GPokemonCardData, GPokemonCardDataBuilder> {
  _$GPokemonCardData _$v;

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

  GPokemonCardDataBuilder() {
    GPokemonCardData._initializeBuilder(this);
  }

  GPokemonCardDataBuilder get _$this {
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
  void replace(GPokemonCardData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPokemonCardData;
  }

  @override
  void update(void Function(GPokemonCardDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPokemonCardData build() {
    final _$result = _$v ??
        new _$GPokemonCardData._(
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
