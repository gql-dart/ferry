// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetailData> _$gPokemonDetailDataSerializer =
    new _$GPokemonDetailDataSerializer();
Serializer<GPokemonDetailData_getPokemon>
    _$gPokemonDetailDataGetPokemonSerializer =
    new _$GPokemonDetailData_getPokemonSerializer();
Serializer<GPokemonDetailData_getPokemon_weight>
    _$gPokemonDetailDataGetPokemonWeightSerializer =
    new _$GPokemonDetailData_getPokemon_weightSerializer();
Serializer<GPokemonDetailData_getPokemon_height>
    _$gPokemonDetailDataGetPokemonHeightSerializer =
    new _$GPokemonDetailData_getPokemon_heightSerializer();

class _$GPokemonDetailDataSerializer
    implements StructuredSerializer<GPokemonDetailData> {
  @override
  final Iterable<Type> types = const [GPokemonDetailData, _$GPokemonDetailData];
  @override
  final String wireName = 'GPokemonDetailData';

  @override
  Iterable<Object> serialize(Serializers serializers, GPokemonDetailData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.getPokemon != null) {
      result
        ..add('getPokemon')
        ..add(serializers.serialize(object.getPokemon,
            specifiedType: const FullType(GPokemonDetailData_getPokemon)));
    }
    return result;
  }

  @override
  GPokemonDetailData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'getPokemon':
          result.getPokemon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPokemonDetailData_getPokemon))
              as GPokemonDetailData_getPokemon);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_getPokemonSerializer
    implements StructuredSerializer<GPokemonDetailData_getPokemon> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_getPokemon,
    _$GPokemonDetailData_getPokemon
  ];
  @override
  final String wireName = 'GPokemonDetailData_getPokemon';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GPokemonDetailData_getPokemon object,
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
    if (object.weight != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(object.weight,
            specifiedType:
                const FullType(GPokemonDetailData_getPokemon_weight)));
    }
    if (object.height != null) {
      result
        ..add('height')
        ..add(serializers.serialize(object.height,
            specifiedType:
                const FullType(GPokemonDetailData_getPokemon_height)));
    }
    return result;
  }

  @override
  GPokemonDetailData_getPokemon deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_getPokemonBuilder();

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
        case 'weight':
          result.weight.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_getPokemon_weight))
              as GPokemonDetailData_getPokemon_weight);
          break;
        case 'height':
          result.height.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_getPokemon_height))
              as GPokemonDetailData_getPokemon_height);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_getPokemon_weightSerializer
    implements StructuredSerializer<GPokemonDetailData_getPokemon_weight> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_getPokemon_weight,
    _$GPokemonDetailData_getPokemon_weight
  ];
  @override
  final String wireName = 'GPokemonDetailData_getPokemon_weight';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GPokemonDetailData_getPokemon_weight object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.minimum != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(object.minimum,
            specifiedType: const FullType(String)));
    }
    if (object.maximum != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(object.maximum,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPokemonDetailData_getPokemon_weight deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_getPokemon_weightBuilder();

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
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_getPokemon_heightSerializer
    implements StructuredSerializer<GPokemonDetailData_getPokemon_height> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_getPokemon_height,
    _$GPokemonDetailData_getPokemon_height
  ];
  @override
  final String wireName = 'GPokemonDetailData_getPokemon_height';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GPokemonDetailData_getPokemon_height object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.minimum != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(object.minimum,
            specifiedType: const FullType(String)));
    }
    if (object.maximum != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(object.maximum,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPokemonDetailData_getPokemon_height deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_getPokemon_heightBuilder();

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
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData extends GPokemonDetailData {
  @override
  final GPokemonDetailData_getPokemon getPokemon;

  factory _$GPokemonDetailData(
          [void Function(GPokemonDetailDataBuilder) updates]) =>
      (new GPokemonDetailDataBuilder()..update(updates)).build();

  _$GPokemonDetailData._({this.getPokemon}) : super._();

  @override
  GPokemonDetailData rebuild(
          void Function(GPokemonDetailDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailDataBuilder toBuilder() =>
      new GPokemonDetailDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData && getPokemon == other.getPokemon;
  }

  @override
  int get hashCode {
    return $jf($jc(0, getPokemon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPokemonDetailData')
          ..add('getPokemon', getPokemon))
        .toString();
  }
}

class GPokemonDetailDataBuilder
    implements Builder<GPokemonDetailData, GPokemonDetailDataBuilder> {
  _$GPokemonDetailData _$v;

  GPokemonDetailData_getPokemonBuilder _getPokemon;
  GPokemonDetailData_getPokemonBuilder get getPokemon =>
      _$this._getPokemon ??= new GPokemonDetailData_getPokemonBuilder();
  set getPokemon(GPokemonDetailData_getPokemonBuilder getPokemon) =>
      _$this._getPokemon = getPokemon;

  GPokemonDetailDataBuilder();

  GPokemonDetailDataBuilder get _$this {
    if (_$v != null) {
      _getPokemon = _$v.getPokemon?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPokemonDetailData;
  }

  @override
  void update(void Function(GPokemonDetailDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPokemonDetailData build() {
    _$GPokemonDetailData _$result;
    try {
      _$result =
          _$v ?? new _$GPokemonDetailData._(getPokemon: _getPokemon?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'getPokemon';
        _getPokemon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPokemonDetailData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_getPokemon extends GPokemonDetailData_getPokemon {
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
  @override
  final GPokemonDetailData_getPokemon_weight weight;
  @override
  final GPokemonDetailData_getPokemon_height height;

  factory _$GPokemonDetailData_getPokemon(
          [void Function(GPokemonDetailData_getPokemonBuilder) updates]) =>
      (new GPokemonDetailData_getPokemonBuilder()..update(updates)).build();

  _$GPokemonDetailData_getPokemon._(
      {this.G__typename,
      this.id,
      this.name,
      this.maxHP,
      this.image,
      this.weight,
      this.height})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GPokemonDetailData_getPokemon', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GPokemonDetailData_getPokemon', 'id');
    }
  }

  @override
  GPokemonDetailData_getPokemon rebuild(
          void Function(GPokemonDetailData_getPokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_getPokemonBuilder toBuilder() =>
      new GPokemonDetailData_getPokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_getPokemon &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        maxHP == other.maxHP &&
        image == other.image &&
        weight == other.weight &&
        height == other.height;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                        name.hashCode),
                    maxHP.hashCode),
                image.hashCode),
            weight.hashCode),
        height.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPokemonDetailData_getPokemon')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('maxHP', maxHP)
          ..add('image', image)
          ..add('weight', weight)
          ..add('height', height))
        .toString();
  }
}

class GPokemonDetailData_getPokemonBuilder
    implements
        Builder<GPokemonDetailData_getPokemon,
            GPokemonDetailData_getPokemonBuilder> {
  _$GPokemonDetailData_getPokemon _$v;

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

  GPokemonDetailData_getPokemon_weightBuilder _weight;
  GPokemonDetailData_getPokemon_weightBuilder get weight =>
      _$this._weight ??= new GPokemonDetailData_getPokemon_weightBuilder();
  set weight(GPokemonDetailData_getPokemon_weightBuilder weight) =>
      _$this._weight = weight;

  GPokemonDetailData_getPokemon_heightBuilder _height;
  GPokemonDetailData_getPokemon_heightBuilder get height =>
      _$this._height ??= new GPokemonDetailData_getPokemon_heightBuilder();
  set height(GPokemonDetailData_getPokemon_heightBuilder height) =>
      _$this._height = height;

  GPokemonDetailData_getPokemonBuilder() {
    GPokemonDetailData_getPokemon._initializeBuilder(this);
  }

  GPokemonDetailData_getPokemonBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _maxHP = _$v.maxHP;
      _image = _$v.image;
      _weight = _$v.weight?.toBuilder();
      _height = _$v.height?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_getPokemon other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPokemonDetailData_getPokemon;
  }

  @override
  void update(void Function(GPokemonDetailData_getPokemonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPokemonDetailData_getPokemon build() {
    _$GPokemonDetailData_getPokemon _$result;
    try {
      _$result = _$v ??
          new _$GPokemonDetailData_getPokemon._(
              G__typename: G__typename,
              id: id,
              name: name,
              maxHP: maxHP,
              image: image,
              weight: _weight?.build(),
              height: _height?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'weight';
        _weight?.build();
        _$failedField = 'height';
        _height?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPokemonDetailData_getPokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_getPokemon_weight
    extends GPokemonDetailData_getPokemon_weight {
  @override
  final String G__typename;
  @override
  final String minimum;
  @override
  final String maximum;

  factory _$GPokemonDetailData_getPokemon_weight(
          [void Function(GPokemonDetailData_getPokemon_weightBuilder)
              updates]) =>
      (new GPokemonDetailData_getPokemon_weightBuilder()..update(updates))
          .build();

  _$GPokemonDetailData_getPokemon_weight._(
      {this.G__typename, this.minimum, this.maximum})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GPokemonDetailData_getPokemon_weight', 'G__typename');
    }
  }

  @override
  GPokemonDetailData_getPokemon_weight rebuild(
          void Function(GPokemonDetailData_getPokemon_weightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_getPokemon_weightBuilder toBuilder() =>
      new GPokemonDetailData_getPokemon_weightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_getPokemon_weight &&
        G__typename == other.G__typename &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPokemonDetailData_getPokemon_weight')
          ..add('G__typename', G__typename)
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class GPokemonDetailData_getPokemon_weightBuilder
    implements
        Builder<GPokemonDetailData_getPokemon_weight,
            GPokemonDetailData_getPokemon_weightBuilder> {
  _$GPokemonDetailData_getPokemon_weight _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _minimum;
  String get minimum => _$this._minimum;
  set minimum(String minimum) => _$this._minimum = minimum;

  String _maximum;
  String get maximum => _$this._maximum;
  set maximum(String maximum) => _$this._maximum = maximum;

  GPokemonDetailData_getPokemon_weightBuilder() {
    GPokemonDetailData_getPokemon_weight._initializeBuilder(this);
  }

  GPokemonDetailData_getPokemon_weightBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _minimum = _$v.minimum;
      _maximum = _$v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_getPokemon_weight other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPokemonDetailData_getPokemon_weight;
  }

  @override
  void update(
      void Function(GPokemonDetailData_getPokemon_weightBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPokemonDetailData_getPokemon_weight build() {
    final _$result = _$v ??
        new _$GPokemonDetailData_getPokemon_weight._(
            G__typename: G__typename, minimum: minimum, maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_getPokemon_height
    extends GPokemonDetailData_getPokemon_height {
  @override
  final String G__typename;
  @override
  final String minimum;
  @override
  final String maximum;

  factory _$GPokemonDetailData_getPokemon_height(
          [void Function(GPokemonDetailData_getPokemon_heightBuilder)
              updates]) =>
      (new GPokemonDetailData_getPokemon_heightBuilder()..update(updates))
          .build();

  _$GPokemonDetailData_getPokemon_height._(
      {this.G__typename, this.minimum, this.maximum})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GPokemonDetailData_getPokemon_height', 'G__typename');
    }
  }

  @override
  GPokemonDetailData_getPokemon_height rebuild(
          void Function(GPokemonDetailData_getPokemon_heightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_getPokemon_heightBuilder toBuilder() =>
      new GPokemonDetailData_getPokemon_heightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_getPokemon_height &&
        G__typename == other.G__typename &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPokemonDetailData_getPokemon_height')
          ..add('G__typename', G__typename)
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class GPokemonDetailData_getPokemon_heightBuilder
    implements
        Builder<GPokemonDetailData_getPokemon_height,
            GPokemonDetailData_getPokemon_heightBuilder> {
  _$GPokemonDetailData_getPokemon_height _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _minimum;
  String get minimum => _$this._minimum;
  set minimum(String minimum) => _$this._minimum = minimum;

  String _maximum;
  String get maximum => _$this._maximum;
  set maximum(String maximum) => _$this._maximum = maximum;

  GPokemonDetailData_getPokemon_heightBuilder() {
    GPokemonDetailData_getPokemon_height._initializeBuilder(this);
  }

  GPokemonDetailData_getPokemon_heightBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _minimum = _$v.minimum;
      _maximum = _$v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_getPokemon_height other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPokemonDetailData_getPokemon_height;
  }

  @override
  void update(
      void Function(GPokemonDetailData_getPokemon_heightBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPokemonDetailData_getPokemon_height build() {
    final _$result = _$v ??
        new _$GPokemonDetailData_getPokemon_height._(
            G__typename: G__typename, minimum: minimum, maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
