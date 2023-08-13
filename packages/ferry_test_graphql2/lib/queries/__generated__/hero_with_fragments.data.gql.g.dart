// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragmentsData> _$gHeroWithFragmentsDataSerializer =
    new _$GHeroWithFragmentsDataSerializer();
Serializer<GHeroWithFragmentsData_hero> _$gHeroWithFragmentsDataHeroSerializer =
    new _$GHeroWithFragmentsData_heroSerializer();
Serializer<GHeroWithFragmentsData_hero_friendsConnection>
    _$gHeroWithFragmentsDataHeroFriendsConnectionSerializer =
    new _$GHeroWithFragmentsData_hero_friendsConnectionSerializer();
Serializer<GHeroWithFragmentsData_hero_friendsConnection_edges>
    _$gHeroWithFragmentsDataHeroFriendsConnectionEdgesSerializer =
    new _$GHeroWithFragmentsData_hero_friendsConnection_edgesSerializer();
Serializer<GheroDataData> _$gheroDataDataSerializer =
    new _$GheroDataDataSerializer();
Serializer<GcomparisonFieldsData> _$gcomparisonFieldsDataSerializer =
    new _$GcomparisonFieldsDataSerializer();
Serializer<GcomparisonFieldsData_friendsConnection>
    _$gcomparisonFieldsDataFriendsConnectionSerializer =
    new _$GcomparisonFieldsData_friendsConnectionSerializer();
Serializer<GcomparisonFieldsData_friendsConnection_edges>
    _$gcomparisonFieldsDataFriendsConnectionEdgesSerializer =
    new _$GcomparisonFieldsData_friendsConnection_edgesSerializer();

class _$GHeroWithFragmentsDataSerializer
    implements StructuredSerializer<GHeroWithFragmentsData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsData,
    _$GHeroWithFragmentsData
  ];
  @override
  final String wireName = 'GHeroWithFragmentsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.hero;
    if (value != null) {
      result
        ..add('hero')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GHeroWithFragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsDataBuilder();

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
        case 'hero':
          result.hero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GHeroWithFragmentsData_hero))!
              as GHeroWithFragmentsData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsData_heroSerializer
    implements StructuredSerializer<GHeroWithFragmentsData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsData_hero,
    _$GHeroWithFragmentsData_hero
  ];
  @override
  final String wireName = 'GHeroWithFragmentsData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'friendsConnection',
      serializers.serialize(object.friendsConnection,
          specifiedType:
              const FullType(GHeroWithFragmentsData_hero_friendsConnection)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithFragmentsData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsData_heroBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GHeroWithFragmentsData_hero_friendsConnection))!
              as GHeroWithFragmentsData_hero_friendsConnection);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsData_hero_friendsConnectionSerializer
    implements
        StructuredSerializer<GHeroWithFragmentsData_hero_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsData_hero_friendsConnection,
    _$GHeroWithFragmentsData_hero_friendsConnection
  ];
  @override
  final String wireName = 'GHeroWithFragmentsData_hero_friendsConnection';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithFragmentsData_hero_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.totalCount;
    if (value != null) {
      result
        ..add('totalCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.edges;
    if (value != null) {
      result
        ..add('edges')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GHeroWithFragmentsData_hero_friendsConnection_edges)
            ])));
    }
    return result;
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsData_hero_friendsConnectionBuilder();

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
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'edges':
          result.edges.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GHeroWithFragmentsData_hero_friendsConnection_edges)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsData_hero_friendsConnection_edgesSerializer
    implements
        StructuredSerializer<
            GHeroWithFragmentsData_hero_friendsConnection_edges> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsData_hero_friendsConnection_edges,
    _$GHeroWithFragmentsData_hero_friendsConnection_edges
  ];
  @override
  final String wireName = 'GHeroWithFragmentsData_hero_friendsConnection_edges';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithFragmentsData_hero_friendsConnection_edges object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.node;
    if (value != null) {
      result
        ..add('node')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GheroDataData)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edges deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder();

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
        case 'node':
          result.node.replace(serializers.deserialize(value,
              specifiedType: const FullType(GheroDataData))! as GheroDataData);
          break;
      }
    }

    return result.build();
  }
}

class _$GheroDataDataSerializer implements StructuredSerializer<GheroDataData> {
  @override
  final Iterable<Type> types = const [GheroDataData, _$GheroDataData];
  @override
  final String wireName = 'GheroDataData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroDataData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
  GheroDataData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroDataDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GcomparisonFieldsDataSerializer
    implements StructuredSerializer<GcomparisonFieldsData> {
  @override
  final Iterable<Type> types = const [
    GcomparisonFieldsData,
    _$GcomparisonFieldsData
  ];
  @override
  final String wireName = 'GcomparisonFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcomparisonFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'friendsConnection',
      serializers.serialize(object.friendsConnection,
          specifiedType:
              const FullType(GcomparisonFieldsData_friendsConnection)),
    ];

    return result;
  }

  @override
  GcomparisonFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsDataBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GcomparisonFieldsData_friendsConnection))!
              as GcomparisonFieldsData_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GcomparisonFieldsData_friendsConnectionSerializer
    implements StructuredSerializer<GcomparisonFieldsData_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GcomparisonFieldsData_friendsConnection,
    _$GcomparisonFieldsData_friendsConnection
  ];
  @override
  final String wireName = 'GcomparisonFieldsData_friendsConnection';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcomparisonFieldsData_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.totalCount;
    if (value != null) {
      result
        ..add('totalCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.edges;
    if (value != null) {
      result
        ..add('edges')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GcomparisonFieldsData_friendsConnection_edges)
            ])));
    }
    return result;
  }

  @override
  GcomparisonFieldsData_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsData_friendsConnectionBuilder();

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
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'edges':
          result.edges.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GcomparisonFieldsData_friendsConnection_edges)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GcomparisonFieldsData_friendsConnection_edgesSerializer
    implements
        StructuredSerializer<GcomparisonFieldsData_friendsConnection_edges> {
  @override
  final Iterable<Type> types = const [
    GcomparisonFieldsData_friendsConnection_edges,
    _$GcomparisonFieldsData_friendsConnection_edges
  ];
  @override
  final String wireName = 'GcomparisonFieldsData_friendsConnection_edges';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GcomparisonFieldsData_friendsConnection_edges object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.node;
    if (value != null) {
      result
        ..add('node')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GheroDataData)));
    }
    return result;
  }

  @override
  GcomparisonFieldsData_friendsConnection_edges deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsData_friendsConnection_edgesBuilder();

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
        case 'node':
          result.node.replace(serializers.deserialize(value,
              specifiedType: const FullType(GheroDataData))! as GheroDataData);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsData extends GHeroWithFragmentsData {
  @override
  final String G__typename;
  @override
  final GHeroWithFragmentsData_hero? hero;

  factory _$GHeroWithFragmentsData(
          [void Function(GHeroWithFragmentsDataBuilder)? updates]) =>
      (new GHeroWithFragmentsDataBuilder()..update(updates))._build();

  _$GHeroWithFragmentsData._({required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithFragmentsData', 'G__typename');
  }

  @override
  GHeroWithFragmentsData rebuild(
          void Function(GHeroWithFragmentsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsDataBuilder toBuilder() =>
      new GHeroWithFragmentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsData &&
        G__typename == other.G__typename &&
        hero == other.hero;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hero.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroWithFragmentsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithFragmentsDataBuilder
    implements Builder<GHeroWithFragmentsData, GHeroWithFragmentsDataBuilder> {
  _$GHeroWithFragmentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithFragmentsData_heroBuilder? _hero;
  GHeroWithFragmentsData_heroBuilder get hero =>
      _$this._hero ??= new GHeroWithFragmentsData_heroBuilder();
  set hero(GHeroWithFragmentsData_heroBuilder? hero) => _$this._hero = hero;

  GHeroWithFragmentsDataBuilder() {
    GHeroWithFragmentsData._initializeBuilder(this);
  }

  GHeroWithFragmentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsData;
  }

  @override
  void update(void Function(GHeroWithFragmentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsData build() => _build();

  _$GHeroWithFragmentsData _build() {
    _$GHeroWithFragmentsData _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroWithFragmentsData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithFragmentsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithFragmentsData_hero extends GHeroWithFragmentsData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GHeroWithFragmentsData_hero_friendsConnection friendsConnection;
  @override
  final String name;

  factory _$GHeroWithFragmentsData_hero(
          [void Function(GHeroWithFragmentsData_heroBuilder)? updates]) =>
      (new GHeroWithFragmentsData_heroBuilder()..update(updates))._build();

  _$GHeroWithFragmentsData_hero._(
      {required this.G__typename,
      required this.id,
      required this.friendsConnection,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithFragmentsData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithFragmentsData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        friendsConnection, r'GHeroWithFragmentsData_hero', 'friendsConnection');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithFragmentsData_hero', 'name');
  }

  @override
  GHeroWithFragmentsData_hero rebuild(
          void Function(GHeroWithFragmentsData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsData_heroBuilder toBuilder() =>
      new GHeroWithFragmentsData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsData_hero &&
        G__typename == other.G__typename &&
        id == other.id &&
        friendsConnection == other.friendsConnection &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroWithFragmentsData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('friendsConnection', friendsConnection)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithFragmentsData_heroBuilder
    implements
        Builder<GHeroWithFragmentsData_hero,
            GHeroWithFragmentsData_heroBuilder> {
  _$GHeroWithFragmentsData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GHeroWithFragmentsData_hero_friendsConnectionBuilder? _friendsConnection;
  GHeroWithFragmentsData_hero_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??=
          new GHeroWithFragmentsData_hero_friendsConnectionBuilder();
  set friendsConnection(
          GHeroWithFragmentsData_hero_friendsConnectionBuilder?
              friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroWithFragmentsData_heroBuilder() {
    GHeroWithFragmentsData_hero._initializeBuilder(this);
  }

  GHeroWithFragmentsData_heroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsData_hero;
  }

  @override
  void update(void Function(GHeroWithFragmentsData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsData_hero build() => _build();

  _$GHeroWithFragmentsData_hero _build() {
    _$GHeroWithFragmentsData_hero _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsData_hero._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroWithFragmentsData_hero', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHeroWithFragmentsData_hero', 'id'),
              friendsConnection: friendsConnection.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GHeroWithFragmentsData_hero', 'name'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithFragmentsData_hero', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithFragmentsData_hero_friendsConnection
    extends GHeroWithFragmentsData_hero_friendsConnection {
  @override
  final String G__typename;
  @override
  final int? totalCount;
  @override
  final BuiltList<GHeroWithFragmentsData_hero_friendsConnection_edges?>? edges;

  factory _$GHeroWithFragmentsData_hero_friendsConnection(
          [void Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder)?
              updates]) =>
      (new GHeroWithFragmentsData_hero_friendsConnectionBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithFragmentsData_hero_friendsConnection._(
      {required this.G__typename, this.totalCount, this.edges})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithFragmentsData_hero_friendsConnection', 'G__typename');
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection rebuild(
          void Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsData_hero_friendsConnectionBuilder toBuilder() =>
      new GHeroWithFragmentsData_hero_friendsConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsData_hero_friendsConnection &&
        G__typename == other.G__typename &&
        totalCount == other.totalCount &&
        edges == other.edges;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jc(_$hash, edges.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithFragmentsData_hero_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount)
          ..add('edges', edges))
        .toString();
  }
}

class GHeroWithFragmentsData_hero_friendsConnectionBuilder
    implements
        Builder<GHeroWithFragmentsData_hero_friendsConnection,
            GHeroWithFragmentsData_hero_friendsConnectionBuilder> {
  _$GHeroWithFragmentsData_hero_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  ListBuilder<GHeroWithFragmentsData_hero_friendsConnection_edges?>? _edges;
  ListBuilder<
      GHeroWithFragmentsData_hero_friendsConnection_edges?> get edges => _$this
          ._edges ??=
      new ListBuilder<GHeroWithFragmentsData_hero_friendsConnection_edges?>();
  set edges(
          ListBuilder<GHeroWithFragmentsData_hero_friendsConnection_edges?>?
              edges) =>
      _$this._edges = edges;

  GHeroWithFragmentsData_hero_friendsConnectionBuilder() {
    GHeroWithFragmentsData_hero_friendsConnection._initializeBuilder(this);
  }

  GHeroWithFragmentsData_hero_friendsConnectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _edges = $v.edges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData_hero_friendsConnection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsData_hero_friendsConnection;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection build() => _build();

  _$GHeroWithFragmentsData_hero_friendsConnection _build() {
    _$GHeroWithFragmentsData_hero_friendsConnection _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsData_hero_friendsConnection._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GHeroWithFragmentsData_hero_friendsConnection',
                  'G__typename'),
              totalCount: totalCount,
              edges: _edges?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'edges';
        _edges?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithFragmentsData_hero_friendsConnection',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithFragmentsData_hero_friendsConnection_edges
    extends GHeroWithFragmentsData_hero_friendsConnection_edges {
  @override
  final String G__typename;
  @override
  final GheroDataData? node;

  factory _$GHeroWithFragmentsData_hero_friendsConnection_edges(
          [void Function(
                  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder)?
              updates]) =>
      (new GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithFragmentsData_hero_friendsConnection_edges._(
      {required this.G__typename, this.node})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithFragmentsData_hero_friendsConnection_edges', 'G__typename');
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edges rebuild(
          void Function(
                  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder toBuilder() =>
      new GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsData_hero_friendsConnection_edges &&
        G__typename == other.G__typename &&
        node == other.node;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithFragmentsData_hero_friendsConnection_edges')
          ..add('G__typename', G__typename)
          ..add('node', node))
        .toString();
  }
}

class GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder
    implements
        Builder<GHeroWithFragmentsData_hero_friendsConnection_edges,
            GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder> {
  _$GHeroWithFragmentsData_hero_friendsConnection_edges? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GheroDataDataBuilder? _node;
  GheroDataDataBuilder get node => _$this._node ??= new GheroDataDataBuilder();
  set node(GheroDataDataBuilder? node) => _$this._node = node;

  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder() {
    GHeroWithFragmentsData_hero_friendsConnection_edges._initializeBuilder(
        this);
  }

  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _node = $v.node?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData_hero_friendsConnection_edges other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsData_hero_friendsConnection_edges;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edges build() => _build();

  _$GHeroWithFragmentsData_hero_friendsConnection_edges _build() {
    _$GHeroWithFragmentsData_hero_friendsConnection_edges _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsData_hero_friendsConnection_edges._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GHeroWithFragmentsData_hero_friendsConnection_edges',
                  'G__typename'),
              node: _node?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'node';
        _node?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithFragmentsData_hero_friendsConnection_edges',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GheroDataData extends GheroDataData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GheroDataData([void Function(GheroDataDataBuilder)? updates]) =>
      (new GheroDataDataBuilder()..update(updates))._build();

  _$GheroDataData._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroDataData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GheroDataData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GheroDataData', 'name');
  }

  @override
  GheroDataData rebuild(void Function(GheroDataDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroDataDataBuilder toBuilder() => new GheroDataDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroDataData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroDataData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GheroDataDataBuilder
    implements Builder<GheroDataData, GheroDataDataBuilder> {
  _$GheroDataData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GheroDataDataBuilder() {
    GheroDataData._initializeBuilder(this);
  }

  GheroDataDataBuilder get _$this {
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
  void replace(GheroDataData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroDataData;
  }

  @override
  void update(void Function(GheroDataDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroDataData build() => _build();

  _$GheroDataData _build() {
    final _$result = _$v ??
        new _$GheroDataData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GheroDataData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroDataData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroDataData', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFieldsData extends GcomparisonFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GcomparisonFieldsData_friendsConnection friendsConnection;

  factory _$GcomparisonFieldsData(
          [void Function(GcomparisonFieldsDataBuilder)? updates]) =>
      (new GcomparisonFieldsDataBuilder()..update(updates))._build();

  _$GcomparisonFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.friendsConnection})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GcomparisonFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GcomparisonFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GcomparisonFieldsData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        friendsConnection, r'GcomparisonFieldsData', 'friendsConnection');
  }

  @override
  GcomparisonFieldsData rebuild(
          void Function(GcomparisonFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsDataBuilder toBuilder() =>
      new GcomparisonFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GcomparisonFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GcomparisonFieldsDataBuilder
    implements Builder<GcomparisonFieldsData, GcomparisonFieldsDataBuilder> {
  _$GcomparisonFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GcomparisonFieldsData_friendsConnectionBuilder? _friendsConnection;
  GcomparisonFieldsData_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??=
          new GcomparisonFieldsData_friendsConnectionBuilder();
  set friendsConnection(
          GcomparisonFieldsData_friendsConnectionBuilder? friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GcomparisonFieldsDataBuilder() {
    GcomparisonFieldsData._initializeBuilder(this);
  }

  GcomparisonFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcomparisonFieldsData;
  }

  @override
  void update(void Function(GcomparisonFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GcomparisonFieldsData build() => _build();

  _$GcomparisonFieldsData _build() {
    _$GcomparisonFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GcomparisonFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GcomparisonFieldsData', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GcomparisonFieldsData', 'name'),
              friendsConnection: friendsConnection.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GcomparisonFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFieldsData_friendsConnection
    extends GcomparisonFieldsData_friendsConnection {
  @override
  final String G__typename;
  @override
  final int? totalCount;
  @override
  final BuiltList<GcomparisonFieldsData_friendsConnection_edges?>? edges;

  factory _$GcomparisonFieldsData_friendsConnection(
          [void Function(GcomparisonFieldsData_friendsConnectionBuilder)?
              updates]) =>
      (new GcomparisonFieldsData_friendsConnectionBuilder()..update(updates))
          ._build();

  _$GcomparisonFieldsData_friendsConnection._(
      {required this.G__typename, this.totalCount, this.edges})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GcomparisonFieldsData_friendsConnection', 'G__typename');
  }

  @override
  GcomparisonFieldsData_friendsConnection rebuild(
          void Function(GcomparisonFieldsData_friendsConnectionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsData_friendsConnectionBuilder toBuilder() =>
      new GcomparisonFieldsData_friendsConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFieldsData_friendsConnection &&
        G__typename == other.G__typename &&
        totalCount == other.totalCount &&
        edges == other.edges;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jc(_$hash, edges.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GcomparisonFieldsData_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount)
          ..add('edges', edges))
        .toString();
  }
}

class GcomparisonFieldsData_friendsConnectionBuilder
    implements
        Builder<GcomparisonFieldsData_friendsConnection,
            GcomparisonFieldsData_friendsConnectionBuilder> {
  _$GcomparisonFieldsData_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  ListBuilder<GcomparisonFieldsData_friendsConnection_edges?>? _edges;
  ListBuilder<GcomparisonFieldsData_friendsConnection_edges?> get edges =>
      _$this._edges ??=
          new ListBuilder<GcomparisonFieldsData_friendsConnection_edges?>();
  set edges(
          ListBuilder<GcomparisonFieldsData_friendsConnection_edges?>? edges) =>
      _$this._edges = edges;

  GcomparisonFieldsData_friendsConnectionBuilder() {
    GcomparisonFieldsData_friendsConnection._initializeBuilder(this);
  }

  GcomparisonFieldsData_friendsConnectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _edges = $v.edges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsData_friendsConnection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcomparisonFieldsData_friendsConnection;
  }

  @override
  void update(
      void Function(GcomparisonFieldsData_friendsConnectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GcomparisonFieldsData_friendsConnection build() => _build();

  _$GcomparisonFieldsData_friendsConnection _build() {
    _$GcomparisonFieldsData_friendsConnection _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsData_friendsConnection._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GcomparisonFieldsData_friendsConnection', 'G__typename'),
              totalCount: totalCount,
              edges: _edges?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'edges';
        _edges?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GcomparisonFieldsData_friendsConnection',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFieldsData_friendsConnection_edges
    extends GcomparisonFieldsData_friendsConnection_edges {
  @override
  final String G__typename;
  @override
  final GheroDataData? node;

  factory _$GcomparisonFieldsData_friendsConnection_edges(
          [void Function(GcomparisonFieldsData_friendsConnection_edgesBuilder)?
              updates]) =>
      (new GcomparisonFieldsData_friendsConnection_edgesBuilder()
            ..update(updates))
          ._build();

  _$GcomparisonFieldsData_friendsConnection_edges._(
      {required this.G__typename, this.node})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GcomparisonFieldsData_friendsConnection_edges', 'G__typename');
  }

  @override
  GcomparisonFieldsData_friendsConnection_edges rebuild(
          void Function(GcomparisonFieldsData_friendsConnection_edgesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsData_friendsConnection_edgesBuilder toBuilder() =>
      new GcomparisonFieldsData_friendsConnection_edgesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFieldsData_friendsConnection_edges &&
        G__typename == other.G__typename &&
        node == other.node;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GcomparisonFieldsData_friendsConnection_edges')
          ..add('G__typename', G__typename)
          ..add('node', node))
        .toString();
  }
}

class GcomparisonFieldsData_friendsConnection_edgesBuilder
    implements
        Builder<GcomparisonFieldsData_friendsConnection_edges,
            GcomparisonFieldsData_friendsConnection_edgesBuilder> {
  _$GcomparisonFieldsData_friendsConnection_edges? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GheroDataDataBuilder? _node;
  GheroDataDataBuilder get node => _$this._node ??= new GheroDataDataBuilder();
  set node(GheroDataDataBuilder? node) => _$this._node = node;

  GcomparisonFieldsData_friendsConnection_edgesBuilder() {
    GcomparisonFieldsData_friendsConnection_edges._initializeBuilder(this);
  }

  GcomparisonFieldsData_friendsConnection_edgesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _node = $v.node?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsData_friendsConnection_edges other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcomparisonFieldsData_friendsConnection_edges;
  }

  @override
  void update(
      void Function(GcomparisonFieldsData_friendsConnection_edgesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GcomparisonFieldsData_friendsConnection_edges build() => _build();

  _$GcomparisonFieldsData_friendsConnection_edges _build() {
    _$GcomparisonFieldsData_friendsConnection_edges _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsData_friendsConnection_edges._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GcomparisonFieldsData_friendsConnection_edges',
                  'G__typename'),
              node: _node?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'node';
        _node?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GcomparisonFieldsData_friendsConnection_edges',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
