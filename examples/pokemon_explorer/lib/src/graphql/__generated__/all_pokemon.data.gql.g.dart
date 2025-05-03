// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPokemonData> _$gAllPokemonDataSerializer =
    new _$GAllPokemonDataSerializer();
Serializer<GAllPokemonData_pokemons> _$gAllPokemonDataPokemonsSerializer =
    new _$GAllPokemonData_pokemonsSerializer();
Serializer<GAllPokemonData_pokemons_results>
    _$gAllPokemonDataPokemonsResultsSerializer =
    new _$GAllPokemonData_pokemons_resultsSerializer();
Serializer<GAllPokemonData_pokemons_results_height>
    _$gAllPokemonDataPokemonsResultsHeightSerializer =
    new _$GAllPokemonData_pokemons_results_heightSerializer();
Serializer<GAllPokemonData_pokemons_results_weight>
    _$gAllPokemonDataPokemonsResultsWeightSerializer =
    new _$GAllPokemonData_pokemons_results_weightSerializer();

class _$GAllPokemonDataSerializer
    implements StructuredSerializer<GAllPokemonData> {
  @override
  final Iterable<Type> types = const [GAllPokemonData, _$GAllPokemonData];
  @override
  final String wireName = 'GAllPokemonData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAllPokemonData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.pokemons;
    if (value != null) {
      result
        ..add('pokemons')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAllPokemonData_pokemons)));
    }
    return result;
  }

  @override
  GAllPokemonData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonDataBuilder();

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
        case 'pokemons':
          result.pokemons.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAllPokemonData_pokemons))!
              as GAllPokemonData_pokemons);
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonData_pokemonsSerializer
    implements StructuredSerializer<GAllPokemonData_pokemons> {
  @override
  final Iterable<Type> types = const [
    GAllPokemonData_pokemons,
    _$GAllPokemonData_pokemons
  ];
  @override
  final String wireName = 'GAllPokemonData_pokemons';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAllPokemonData_pokemons object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.results;
    if (value != null) {
      result
        ..add('results')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GAllPokemonData_pokemons_results)
            ])));
    }
    return result;
  }

  @override
  GAllPokemonData_pokemons deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonData_pokemonsBuilder();

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
        case 'results':
          result.results.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GAllPokemonData_pokemons_results)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonData_pokemons_resultsSerializer
    implements StructuredSerializer<GAllPokemonData_pokemons_results> {
  @override
  final Iterable<Type> types = const [
    GAllPokemonData_pokemons_results,
    _$GAllPokemonData_pokemons_results
  ];
  @override
  final String wireName = 'GAllPokemonData_pokemons_results';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAllPokemonData_pokemons_results object,
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
            specifiedType:
                const FullType(GAllPokemonData_pokemons_results_height)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GAllPokemonData_pokemons_results_weight)));
    }
    return result;
  }

  @override
  GAllPokemonData_pokemons_results deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonData_pokemons_resultsBuilder();

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
                  specifiedType:
                      const FullType(GAllPokemonData_pokemons_results_height))!
              as GAllPokemonData_pokemons_results_height);
          break;
        case 'weight':
          result.weight.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GAllPokemonData_pokemons_results_weight))!
              as GAllPokemonData_pokemons_results_weight);
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonData_pokemons_results_heightSerializer
    implements StructuredSerializer<GAllPokemonData_pokemons_results_height> {
  @override
  final Iterable<Type> types = const [
    GAllPokemonData_pokemons_results_height,
    _$GAllPokemonData_pokemons_results_height
  ];
  @override
  final String wireName = 'GAllPokemonData_pokemons_results_height';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAllPokemonData_pokemons_results_height object,
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
  GAllPokemonData_pokemons_results_height deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonData_pokemons_results_heightBuilder();

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

class _$GAllPokemonData_pokemons_results_weightSerializer
    implements StructuredSerializer<GAllPokemonData_pokemons_results_weight> {
  @override
  final Iterable<Type> types = const [
    GAllPokemonData_pokemons_results_weight,
    _$GAllPokemonData_pokemons_results_weight
  ];
  @override
  final String wireName = 'GAllPokemonData_pokemons_results_weight';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAllPokemonData_pokemons_results_weight object,
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
  GAllPokemonData_pokemons_results_weight deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonData_pokemons_results_weightBuilder();

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

class _$GAllPokemonData extends GAllPokemonData {
  @override
  final String G__typename;
  @override
  final GAllPokemonData_pokemons? pokemons;

  factory _$GAllPokemonData([void Function(GAllPokemonDataBuilder)? updates]) =>
      (new GAllPokemonDataBuilder()..update(updates))._build();

  _$GAllPokemonData._({required this.G__typename, this.pokemons}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllPokemonData', 'G__typename');
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
        pokemons == other.pokemons;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, pokemons.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllPokemonData')
          ..add('G__typename', G__typename)
          ..add('pokemons', pokemons))
        .toString();
  }
}

class GAllPokemonDataBuilder
    implements Builder<GAllPokemonData, GAllPokemonDataBuilder> {
  _$GAllPokemonData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAllPokemonData_pokemonsBuilder? _pokemons;
  GAllPokemonData_pokemonsBuilder get pokemons =>
      _$this._pokemons ??= new GAllPokemonData_pokemonsBuilder();
  set pokemons(GAllPokemonData_pokemonsBuilder? pokemons) =>
      _$this._pokemons = pokemons;

  GAllPokemonDataBuilder() {
    GAllPokemonData._initializeBuilder(this);
  }

  GAllPokemonDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pokemons = $v.pokemons?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonData;
  }

  @override
  void update(void Function(GAllPokemonDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonData build() => _build();

  _$GAllPokemonData _build() {
    _$GAllPokemonData _$result;
    try {
      _$result = _$v ??
          new _$GAllPokemonData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAllPokemonData', 'G__typename'),
            pokemons: _pokemons?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemons';
        _pokemons?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAllPokemonData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAllPokemonData_pokemons extends GAllPokemonData_pokemons {
  @override
  final String G__typename;
  @override
  final BuiltList<GAllPokemonData_pokemons_results?>? results;

  factory _$GAllPokemonData_pokemons(
          [void Function(GAllPokemonData_pokemonsBuilder)? updates]) =>
      (new GAllPokemonData_pokemonsBuilder()..update(updates))._build();

  _$GAllPokemonData_pokemons._({required this.G__typename, this.results})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllPokemonData_pokemons', 'G__typename');
  }

  @override
  GAllPokemonData_pokemons rebuild(
          void Function(GAllPokemonData_pokemonsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonData_pokemonsBuilder toBuilder() =>
      new GAllPokemonData_pokemonsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData_pokemons &&
        G__typename == other.G__typename &&
        results == other.results;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, results.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllPokemonData_pokemons')
          ..add('G__typename', G__typename)
          ..add('results', results))
        .toString();
  }
}

class GAllPokemonData_pokemonsBuilder
    implements
        Builder<GAllPokemonData_pokemons, GAllPokemonData_pokemonsBuilder> {
  _$GAllPokemonData_pokemons? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAllPokemonData_pokemons_results?>? _results;
  ListBuilder<GAllPokemonData_pokemons_results?> get results =>
      _$this._results ??= new ListBuilder<GAllPokemonData_pokemons_results?>();
  set results(ListBuilder<GAllPokemonData_pokemons_results?>? results) =>
      _$this._results = results;

  GAllPokemonData_pokemonsBuilder() {
    GAllPokemonData_pokemons._initializeBuilder(this);
  }

  GAllPokemonData_pokemonsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _results = $v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData_pokemons other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonData_pokemons;
  }

  @override
  void update(void Function(GAllPokemonData_pokemonsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonData_pokemons build() => _build();

  _$GAllPokemonData_pokemons _build() {
    _$GAllPokemonData_pokemons _$result;
    try {
      _$result = _$v ??
          new _$GAllPokemonData_pokemons._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAllPokemonData_pokemons', 'G__typename'),
            results: _results?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAllPokemonData_pokemons', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAllPokemonData_pokemons_results
    extends GAllPokemonData_pokemons_results {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final String avatar;
  @override
  final GAllPokemonData_pokemons_results_height? height;
  @override
  final GAllPokemonData_pokemons_results_weight? weight;

  factory _$GAllPokemonData_pokemons_results(
          [void Function(GAllPokemonData_pokemons_resultsBuilder)? updates]) =>
      (new GAllPokemonData_pokemons_resultsBuilder()..update(updates))._build();

  _$GAllPokemonData_pokemons_results._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.avatar,
      this.height,
      this.weight})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllPokemonData_pokemons_results', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAllPokemonData_pokemons_results', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GAllPokemonData_pokemons_results', 'name');
    BuiltValueNullFieldError.checkNotNull(
        avatar, r'GAllPokemonData_pokemons_results', 'avatar');
  }

  @override
  GAllPokemonData_pokemons_results rebuild(
          void Function(GAllPokemonData_pokemons_resultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonData_pokemons_resultsBuilder toBuilder() =>
      new GAllPokemonData_pokemons_resultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData_pokemons_results &&
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
    return (newBuiltValueToStringHelper(r'GAllPokemonData_pokemons_results')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('avatar', avatar)
          ..add('height', height)
          ..add('weight', weight))
        .toString();
  }
}

class GAllPokemonData_pokemons_resultsBuilder
    implements
        Builder<GAllPokemonData_pokemons_results,
            GAllPokemonData_pokemons_resultsBuilder> {
  _$GAllPokemonData_pokemons_results? _$v;

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

  GAllPokemonData_pokemons_results_heightBuilder? _height;
  GAllPokemonData_pokemons_results_heightBuilder get height =>
      _$this._height ??= new GAllPokemonData_pokemons_results_heightBuilder();
  set height(GAllPokemonData_pokemons_results_heightBuilder? height) =>
      _$this._height = height;

  GAllPokemonData_pokemons_results_weightBuilder? _weight;
  GAllPokemonData_pokemons_results_weightBuilder get weight =>
      _$this._weight ??= new GAllPokemonData_pokemons_results_weightBuilder();
  set weight(GAllPokemonData_pokemons_results_weightBuilder? weight) =>
      _$this._weight = weight;

  GAllPokemonData_pokemons_resultsBuilder() {
    GAllPokemonData_pokemons_results._initializeBuilder(this);
  }

  GAllPokemonData_pokemons_resultsBuilder get _$this {
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
  void replace(GAllPokemonData_pokemons_results other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonData_pokemons_results;
  }

  @override
  void update(void Function(GAllPokemonData_pokemons_resultsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonData_pokemons_results build() => _build();

  _$GAllPokemonData_pokemons_results _build() {
    _$GAllPokemonData_pokemons_results _$result;
    try {
      _$result = _$v ??
          new _$GAllPokemonData_pokemons_results._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GAllPokemonData_pokemons_results', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAllPokemonData_pokemons_results', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GAllPokemonData_pokemons_results', 'name'),
            avatar: BuiltValueNullFieldError.checkNotNull(
                avatar, r'GAllPokemonData_pokemons_results', 'avatar'),
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
            r'GAllPokemonData_pokemons_results', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAllPokemonData_pokemons_results_height
    extends GAllPokemonData_pokemons_results_height {
  @override
  final String G__typename;
  @override
  final String? in_meter;

  factory _$GAllPokemonData_pokemons_results_height(
          [void Function(GAllPokemonData_pokemons_results_heightBuilder)?
              updates]) =>
      (new GAllPokemonData_pokemons_results_heightBuilder()..update(updates))
          ._build();

  _$GAllPokemonData_pokemons_results_height._(
      {required this.G__typename, this.in_meter})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllPokemonData_pokemons_results_height', 'G__typename');
  }

  @override
  GAllPokemonData_pokemons_results_height rebuild(
          void Function(GAllPokemonData_pokemons_results_heightBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonData_pokemons_results_heightBuilder toBuilder() =>
      new GAllPokemonData_pokemons_results_heightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData_pokemons_results_height &&
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
    return (newBuiltValueToStringHelper(
            r'GAllPokemonData_pokemons_results_height')
          ..add('G__typename', G__typename)
          ..add('in_meter', in_meter))
        .toString();
  }
}

class GAllPokemonData_pokemons_results_heightBuilder
    implements
        Builder<GAllPokemonData_pokemons_results_height,
            GAllPokemonData_pokemons_results_heightBuilder> {
  _$GAllPokemonData_pokemons_results_height? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _in_meter;
  String? get in_meter => _$this._in_meter;
  set in_meter(String? in_meter) => _$this._in_meter = in_meter;

  GAllPokemonData_pokemons_results_heightBuilder() {
    GAllPokemonData_pokemons_results_height._initializeBuilder(this);
  }

  GAllPokemonData_pokemons_results_heightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _in_meter = $v.in_meter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData_pokemons_results_height other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonData_pokemons_results_height;
  }

  @override
  void update(
      void Function(GAllPokemonData_pokemons_results_heightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonData_pokemons_results_height build() => _build();

  _$GAllPokemonData_pokemons_results_height _build() {
    final _$result = _$v ??
        new _$GAllPokemonData_pokemons_results_height._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GAllPokemonData_pokemons_results_height', 'G__typename'),
          in_meter: in_meter,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GAllPokemonData_pokemons_results_weight
    extends GAllPokemonData_pokemons_results_weight {
  @override
  final String G__typename;
  @override
  final String? in_kg;

  factory _$GAllPokemonData_pokemons_results_weight(
          [void Function(GAllPokemonData_pokemons_results_weightBuilder)?
              updates]) =>
      (new GAllPokemonData_pokemons_results_weightBuilder()..update(updates))
          ._build();

  _$GAllPokemonData_pokemons_results_weight._(
      {required this.G__typename, this.in_kg})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllPokemonData_pokemons_results_weight', 'G__typename');
  }

  @override
  GAllPokemonData_pokemons_results_weight rebuild(
          void Function(GAllPokemonData_pokemons_results_weightBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonData_pokemons_results_weightBuilder toBuilder() =>
      new GAllPokemonData_pokemons_results_weightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData_pokemons_results_weight &&
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
    return (newBuiltValueToStringHelper(
            r'GAllPokemonData_pokemons_results_weight')
          ..add('G__typename', G__typename)
          ..add('in_kg', in_kg))
        .toString();
  }
}

class GAllPokemonData_pokemons_results_weightBuilder
    implements
        Builder<GAllPokemonData_pokemons_results_weight,
            GAllPokemonData_pokemons_results_weightBuilder> {
  _$GAllPokemonData_pokemons_results_weight? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _in_kg;
  String? get in_kg => _$this._in_kg;
  set in_kg(String? in_kg) => _$this._in_kg = in_kg;

  GAllPokemonData_pokemons_results_weightBuilder() {
    GAllPokemonData_pokemons_results_weight._initializeBuilder(this);
  }

  GAllPokemonData_pokemons_results_weightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _in_kg = $v.in_kg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData_pokemons_results_weight other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonData_pokemons_results_weight;
  }

  @override
  void update(
      void Function(GAllPokemonData_pokemons_results_weightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonData_pokemons_results_weight build() => _build();

  _$GAllPokemonData_pokemons_results_weight _build() {
    final _$result = _$v ??
        new _$GAllPokemonData_pokemons_results_weight._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GAllPokemonData_pokemons_results_weight', 'G__typename'),
          in_kg: in_kg,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
