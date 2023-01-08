// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetailData> _$gPokemonDetailDataSerializer =
    new _$GPokemonDetailDataSerializer();
Serializer<GPokemonDetailData_pokemon> _$gPokemonDetailDataPokemonSerializer =
    new _$GPokemonDetailData_pokemonSerializer();
Serializer<GPokemonDetailData_pokemon_height>
    _$gPokemonDetailDataPokemonHeightSerializer =
    new _$GPokemonDetailData_pokemon_heightSerializer();
Serializer<GPokemonDetailData_pokemon_weight>
    _$gPokemonDetailDataPokemonWeightSerializer =
    new _$GPokemonDetailData_pokemon_weightSerializer();
Serializer<GPokemonDetailData_pokemon_stats>
    _$gPokemonDetailDataPokemonStatsSerializer =
    new _$GPokemonDetailData_pokemon_statsSerializer();

class _$GPokemonDetailDataSerializer
    implements StructuredSerializer<GPokemonDetailData> {
  @override
  final Iterable<Type> types = const [GPokemonDetailData, _$GPokemonDetailData];
  @override
  final String wireName = 'GPokemonDetailData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.pokemon;
    if (value != null) {
      result
        ..add('pokemon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPokemonDetailData_pokemon)));
    }
    return result;
  }

  @override
  GPokemonDetailData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailDataBuilder();

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
        case 'pokemon':
          result.pokemon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPokemonDetailData_pokemon))!
              as GPokemonDetailData_pokemon);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemonSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon,
    _$GPokemonDetailData_pokemon
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon object,
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
            specifiedType: const FullType(GPokemonDetailData_pokemon_height)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPokemonDetailData_pokemon_weight)));
    }
    value = object.stats;
    if (value != null) {
      result
        ..add('stats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GPokemonDetailData_pokemon_stats)
            ])));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_pokemonBuilder();

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
        case 'height':
          result.height.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_height))!
              as GPokemonDetailData_pokemon_height);
          break;
        case 'weight':
          result.weight.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_weight))!
              as GPokemonDetailData_pokemon_weight);
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
        case 'stats':
          result.stats.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GPokemonDetailData_pokemon_stats)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_heightSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_height> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_height,
    _$GPokemonDetailData_pokemon_height
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_height';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_height object,
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
  GPokemonDetailData_pokemon_height deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_pokemon_heightBuilder();

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

class _$GPokemonDetailData_pokemon_weightSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_weight> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_weight,
    _$GPokemonDetailData_pokemon_weight
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_weight';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_weight object,
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
  GPokemonDetailData_pokemon_weight deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_pokemon_weightBuilder();

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

class _$GPokemonDetailData_pokemon_statsSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_stats> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_stats,
    _$GPokemonDetailData_pokemon_stats
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_stats';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_stats object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_stats deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_pokemon_statsBuilder();

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
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData extends GPokemonDetailData {
  @override
  final String G__typename;
  @override
  final GPokemonDetailData_pokemon? pokemon;

  factory _$GPokemonDetailData(
          [void Function(GPokemonDetailDataBuilder)? updates]) =>
      (new GPokemonDetailDataBuilder()..update(updates))._build();

  _$GPokemonDetailData._({required this.G__typename, this.pokemon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData', 'G__typename');
  }

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
    return other is GPokemonDetailData &&
        G__typename == other.G__typename &&
        pokemon == other.pokemon;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), pokemon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData')
          ..add('G__typename', G__typename)
          ..add('pokemon', pokemon))
        .toString();
  }
}

class GPokemonDetailDataBuilder
    implements Builder<GPokemonDetailData, GPokemonDetailDataBuilder> {
  _$GPokemonDetailData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPokemonDetailData_pokemonBuilder? _pokemon;
  GPokemonDetailData_pokemonBuilder get pokemon =>
      _$this._pokemon ??= new GPokemonDetailData_pokemonBuilder();
  set pokemon(GPokemonDetailData_pokemonBuilder? pokemon) =>
      _$this._pokemon = pokemon;

  GPokemonDetailDataBuilder() {
    GPokemonDetailData._initializeBuilder(this);
  }

  GPokemonDetailDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pokemon = $v.pokemon?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData;
  }

  @override
  void update(void Function(GPokemonDetailDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData build() => _build();

  _$GPokemonDetailData _build() {
    _$GPokemonDetailData _$result;
    try {
      _$result = _$v ??
          new _$GPokemonDetailData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPokemonDetailData', 'G__typename'),
              pokemon: _pokemon?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon';
        _pokemon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPokemonDetailData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon extends GPokemonDetailData_pokemon {
  @override
  final String G__typename;
  @override
  final GPokemonDetailData_pokemon_height? height;
  @override
  final GPokemonDetailData_pokemon_weight? weight;
  @override
  final int id;
  @override
  final String name;
  @override
  final String avatar;
  @override
  final BuiltList<GPokemonDetailData_pokemon_stats?>? stats;

  factory _$GPokemonDetailData_pokemon(
          [void Function(GPokemonDetailData_pokemonBuilder)? updates]) =>
      (new GPokemonDetailData_pokemonBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon._(
      {required this.G__typename,
      this.height,
      this.weight,
      required this.id,
      required this.name,
      required this.avatar,
      this.stats})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData_pokemon', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPokemonDetailData_pokemon', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GPokemonDetailData_pokemon', 'name');
    BuiltValueNullFieldError.checkNotNull(
        avatar, r'GPokemonDetailData_pokemon', 'avatar');
  }

  @override
  GPokemonDetailData_pokemon rebuild(
          void Function(GPokemonDetailData_pokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemonBuilder toBuilder() =>
      new GPokemonDetailData_pokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon &&
        G__typename == other.G__typename &&
        height == other.height &&
        weight == other.weight &&
        id == other.id &&
        name == other.name &&
        avatar == other.avatar &&
        stats == other.stats;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), height.hashCode),
                        weight.hashCode),
                    id.hashCode),
                name.hashCode),
            avatar.hashCode),
        stats.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon')
          ..add('G__typename', G__typename)
          ..add('height', height)
          ..add('weight', weight)
          ..add('id', id)
          ..add('name', name)
          ..add('avatar', avatar)
          ..add('stats', stats))
        .toString();
  }
}

class GPokemonDetailData_pokemonBuilder
    implements
        Builder<GPokemonDetailData_pokemon, GPokemonDetailData_pokemonBuilder> {
  _$GPokemonDetailData_pokemon? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPokemonDetailData_pokemon_heightBuilder? _height;
  GPokemonDetailData_pokemon_heightBuilder get height =>
      _$this._height ??= new GPokemonDetailData_pokemon_heightBuilder();
  set height(GPokemonDetailData_pokemon_heightBuilder? height) =>
      _$this._height = height;

  GPokemonDetailData_pokemon_weightBuilder? _weight;
  GPokemonDetailData_pokemon_weightBuilder get weight =>
      _$this._weight ??= new GPokemonDetailData_pokemon_weightBuilder();
  set weight(GPokemonDetailData_pokemon_weightBuilder? weight) =>
      _$this._weight = weight;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  ListBuilder<GPokemonDetailData_pokemon_stats?>? _stats;
  ListBuilder<GPokemonDetailData_pokemon_stats?> get stats =>
      _$this._stats ??= new ListBuilder<GPokemonDetailData_pokemon_stats?>();
  set stats(ListBuilder<GPokemonDetailData_pokemon_stats?>? stats) =>
      _$this._stats = stats;

  GPokemonDetailData_pokemonBuilder() {
    GPokemonDetailData_pokemon._initializeBuilder(this);
  }

  GPokemonDetailData_pokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _height = $v.height?.toBuilder();
      _weight = $v.weight?.toBuilder();
      _id = $v.id;
      _name = $v.name;
      _avatar = $v.avatar;
      _stats = $v.stats?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData_pokemon;
  }

  @override
  void update(void Function(GPokemonDetailData_pokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon build() => _build();

  _$GPokemonDetailData_pokemon _build() {
    _$GPokemonDetailData_pokemon _$result;
    try {
      _$result = _$v ??
          new _$GPokemonDetailData_pokemon._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPokemonDetailData_pokemon', 'G__typename'),
              height: _height?.build(),
              weight: _weight?.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPokemonDetailData_pokemon', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GPokemonDetailData_pokemon', 'name'),
              avatar: BuiltValueNullFieldError.checkNotNull(
                  avatar, r'GPokemonDetailData_pokemon', 'avatar'),
              stats: _stats?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'height';
        _height?.build();
        _$failedField = 'weight';
        _weight?.build();

        _$failedField = 'stats';
        _stats?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_height
    extends GPokemonDetailData_pokemon_height {
  @override
  final String G__typename;
  @override
  final String? in_meter;

  factory _$GPokemonDetailData_pokemon_height(
          [void Function(GPokemonDetailData_pokemon_heightBuilder)? updates]) =>
      (new GPokemonDetailData_pokemon_heightBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_height._(
      {required this.G__typename, this.in_meter})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData_pokemon_height', 'G__typename');
  }

  @override
  GPokemonDetailData_pokemon_height rebuild(
          void Function(GPokemonDetailData_pokemon_heightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_heightBuilder toBuilder() =>
      new GPokemonDetailData_pokemon_heightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_height &&
        G__typename == other.G__typename &&
        in_meter == other.in_meter;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), in_meter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_height')
          ..add('G__typename', G__typename)
          ..add('in_meter', in_meter))
        .toString();
  }
}

class GPokemonDetailData_pokemon_heightBuilder
    implements
        Builder<GPokemonDetailData_pokemon_height,
            GPokemonDetailData_pokemon_heightBuilder> {
  _$GPokemonDetailData_pokemon_height? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _in_meter;
  String? get in_meter => _$this._in_meter;
  set in_meter(String? in_meter) => _$this._in_meter = in_meter;

  GPokemonDetailData_pokemon_heightBuilder() {
    GPokemonDetailData_pokemon_height._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_heightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _in_meter = $v.in_meter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_height other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData_pokemon_height;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_heightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_height build() => _build();

  _$GPokemonDetailData_pokemon_height _build() {
    final _$result = _$v ??
        new _$GPokemonDetailData_pokemon_height._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_height', 'G__typename'),
            in_meter: in_meter);
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_weight
    extends GPokemonDetailData_pokemon_weight {
  @override
  final String G__typename;
  @override
  final String? in_kg;

  factory _$GPokemonDetailData_pokemon_weight(
          [void Function(GPokemonDetailData_pokemon_weightBuilder)? updates]) =>
      (new GPokemonDetailData_pokemon_weightBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_weight._({required this.G__typename, this.in_kg})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData_pokemon_weight', 'G__typename');
  }

  @override
  GPokemonDetailData_pokemon_weight rebuild(
          void Function(GPokemonDetailData_pokemon_weightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_weightBuilder toBuilder() =>
      new GPokemonDetailData_pokemon_weightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_weight &&
        G__typename == other.G__typename &&
        in_kg == other.in_kg;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), in_kg.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_weight')
          ..add('G__typename', G__typename)
          ..add('in_kg', in_kg))
        .toString();
  }
}

class GPokemonDetailData_pokemon_weightBuilder
    implements
        Builder<GPokemonDetailData_pokemon_weight,
            GPokemonDetailData_pokemon_weightBuilder> {
  _$GPokemonDetailData_pokemon_weight? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _in_kg;
  String? get in_kg => _$this._in_kg;
  set in_kg(String? in_kg) => _$this._in_kg = in_kg;

  GPokemonDetailData_pokemon_weightBuilder() {
    GPokemonDetailData_pokemon_weight._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_weightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _in_kg = $v.in_kg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_weight other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData_pokemon_weight;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_weightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_weight build() => _build();

  _$GPokemonDetailData_pokemon_weight _build() {
    final _$result = _$v ??
        new _$GPokemonDetailData_pokemon_weight._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_weight', 'G__typename'),
            in_kg: in_kg);
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_stats
    extends GPokemonDetailData_pokemon_stats {
  @override
  final String G__typename;
  @override
  final int? id;
  @override
  final String? name;

  factory _$GPokemonDetailData_pokemon_stats(
          [void Function(GPokemonDetailData_pokemon_statsBuilder)? updates]) =>
      (new GPokemonDetailData_pokemon_statsBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon_stats._(
      {required this.G__typename, this.id, this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData_pokemon_stats', 'G__typename');
  }

  @override
  GPokemonDetailData_pokemon_stats rebuild(
          void Function(GPokemonDetailData_pokemon_statsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_statsBuilder toBuilder() =>
      new GPokemonDetailData_pokemon_statsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_stats &&
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
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_stats')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_statsBuilder
    implements
        Builder<GPokemonDetailData_pokemon_stats,
            GPokemonDetailData_pokemon_statsBuilder> {
  _$GPokemonDetailData_pokemon_stats? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_statsBuilder() {
    GPokemonDetailData_pokemon_stats._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_statsBuilder get _$this {
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
  void replace(GPokemonDetailData_pokemon_stats other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData_pokemon_stats;
  }

  @override
  void update(void Function(GPokemonDetailData_pokemon_statsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_stats build() => _build();

  _$GPokemonDetailData_pokemon_stats _build() {
    final _$result = _$v ??
        new _$GPokemonDetailData_pokemon_stats._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_stats', 'G__typename'),
            id: id,
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
