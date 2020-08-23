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
Serializer<GHeroWithFragmentsData_hero_friendsConnection_edges_node>
    _$gHeroWithFragmentsDataHeroFriendsConnectionEdgesNodeSerializer =
    new _$GHeroWithFragmentsData_hero_friendsConnection_edges_nodeSerializer();
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
Serializer<GcomparisonFieldsData_friendsConnection_edges_node>
    _$gcomparisonFieldsDataFriendsConnectionEdgesNodeSerializer =
    new _$GcomparisonFieldsData_friendsConnection_edges_nodeSerializer();

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
  Iterable<Object> serialize(
      Serializers serializers, GHeroWithFragmentsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.hero != null) {
      result
        ..add('hero')
        ..add(serializers.serialize(object.hero,
            specifiedType: const FullType(GHeroWithFragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hero':
          result.hero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GHeroWithFragmentsData_hero))
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
  Iterable<Object> serialize(
      Serializers serializers, GHeroWithFragmentsData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
              const FullType(GHeroWithFragmentsData_hero_friendsConnection)),
    ];

    return result;
  }

  @override
  GHeroWithFragmentsData_hero deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsData_heroBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GHeroWithFragmentsData_hero_friendsConnection))
              as GHeroWithFragmentsData_hero_friendsConnection);
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
  Iterable<Object> serialize(Serializers serializers,
      GHeroWithFragmentsData_hero_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.totalCount != null) {
      result
        ..add('totalCount')
        ..add(serializers.serialize(object.totalCount,
            specifiedType: const FullType(int)));
    }
    if (object.edges != null) {
      result
        ..add('edges')
        ..add(serializers.serialize(object.edges,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  GHeroWithFragmentsData_hero_friendsConnection_edges)
            ])));
    }
    return result;
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsData_hero_friendsConnectionBuilder();

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
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'edges':
          result.edges.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GHeroWithFragmentsData_hero_friendsConnection_edges)
              ])) as BuiltList<Object>);
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
  Iterable<Object> serialize(Serializers serializers,
      GHeroWithFragmentsData_hero_friendsConnection_edges object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.node != null) {
      result
        ..add('node')
        ..add(serializers.serialize(object.node,
            specifiedType: const FullType(
                GHeroWithFragmentsData_hero_friendsConnection_edges_node)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edges deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder();

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
        case 'node':
          result.node.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GHeroWithFragmentsData_hero_friendsConnection_edges_node))
              as GHeroWithFragmentsData_hero_friendsConnection_edges_node);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsData_hero_friendsConnection_edges_nodeSerializer
    implements
        StructuredSerializer<
            GHeroWithFragmentsData_hero_friendsConnection_edges_node> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsData_hero_friendsConnection_edges_node,
    _$GHeroWithFragmentsData_hero_friendsConnection_edges_node
  ];
  @override
  final String wireName =
      'GHeroWithFragmentsData_hero_friendsConnection_edges_node';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GHeroWithFragmentsData_hero_friendsConnection_edges_node object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edges_node deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  Iterable<Object> serialize(Serializers serializers, GheroDataData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GheroDataData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroDataDataBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  Iterable<Object> serialize(
      Serializers serializers, GcomparisonFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsDataBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GcomparisonFieldsData_friendsConnection))
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
  Iterable<Object> serialize(
      Serializers serializers, GcomparisonFieldsData_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.totalCount != null) {
      result
        ..add('totalCount')
        ..add(serializers.serialize(object.totalCount,
            specifiedType: const FullType(int)));
    }
    if (object.edges != null) {
      result
        ..add('edges')
        ..add(serializers.serialize(object.edges,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GcomparisonFieldsData_friendsConnection_edges)
            ])));
    }
    return result;
  }

  @override
  GcomparisonFieldsData_friendsConnection deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsData_friendsConnectionBuilder();

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
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'edges':
          result.edges.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GcomparisonFieldsData_friendsConnection_edges)
              ])) as BuiltList<Object>);
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
  Iterable<Object> serialize(Serializers serializers,
      GcomparisonFieldsData_friendsConnection_edges object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.node != null) {
      result
        ..add('node')
        ..add(serializers.serialize(object.node,
            specifiedType: const FullType(
                GcomparisonFieldsData_friendsConnection_edges_node)));
    }
    return result;
  }

  @override
  GcomparisonFieldsData_friendsConnection_edges deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsData_friendsConnection_edgesBuilder();

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
        case 'node':
          result.node.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GcomparisonFieldsData_friendsConnection_edges_node))
              as GcomparisonFieldsData_friendsConnection_edges_node);
          break;
      }
    }

    return result.build();
  }
}

class _$GcomparisonFieldsData_friendsConnection_edges_nodeSerializer
    implements
        StructuredSerializer<
            GcomparisonFieldsData_friendsConnection_edges_node> {
  @override
  final Iterable<Type> types = const [
    GcomparisonFieldsData_friendsConnection_edges_node,
    _$GcomparisonFieldsData_friendsConnection_edges_node
  ];
  @override
  final String wireName = 'GcomparisonFieldsData_friendsConnection_edges_node';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GcomparisonFieldsData_friendsConnection_edges_node object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GcomparisonFieldsData_friendsConnection_edges_node deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GcomparisonFieldsData_friendsConnection_edges_nodeBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsData extends GHeroWithFragmentsData {
  @override
  final GHeroWithFragmentsData_hero hero;

  factory _$GHeroWithFragmentsData(
          [void Function(GHeroWithFragmentsDataBuilder) updates]) =>
      (new GHeroWithFragmentsDataBuilder()..update(updates)).build();

  _$GHeroWithFragmentsData._({this.hero}) : super._();

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
    return other is GHeroWithFragmentsData && hero == other.hero;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hero.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroWithFragmentsData')
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithFragmentsDataBuilder
    implements Builder<GHeroWithFragmentsData, GHeroWithFragmentsDataBuilder> {
  _$GHeroWithFragmentsData _$v;

  GHeroWithFragmentsData_heroBuilder _hero;
  GHeroWithFragmentsData_heroBuilder get hero =>
      _$this._hero ??= new GHeroWithFragmentsData_heroBuilder();
  set hero(GHeroWithFragmentsData_heroBuilder hero) => _$this._hero = hero;

  GHeroWithFragmentsDataBuilder();

  GHeroWithFragmentsDataBuilder get _$this {
    if (_$v != null) {
      _hero = _$v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroWithFragmentsData;
  }

  @override
  void update(void Function(GHeroWithFragmentsDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragmentsData build() {
    _$GHeroWithFragmentsData _$result;
    try {
      _$result = _$v ?? new _$GHeroWithFragmentsData._(hero: _hero?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroWithFragmentsData', _$failedField, e.toString());
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
  final String name;
  @override
  final GHeroWithFragmentsData_hero_friendsConnection friendsConnection;

  factory _$GHeroWithFragmentsData_hero(
          [void Function(GHeroWithFragmentsData_heroBuilder) updates]) =>
      (new GHeroWithFragmentsData_heroBuilder()..update(updates)).build();

  _$GHeroWithFragmentsData_hero._(
      {this.G__typename, this.id, this.name, this.friendsConnection})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GHeroWithFragmentsData_hero', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GHeroWithFragmentsData_hero', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GHeroWithFragmentsData_hero', 'name');
    }
    if (friendsConnection == null) {
      throw new BuiltValueNullFieldError(
          'GHeroWithFragmentsData_hero', 'friendsConnection');
    }
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
        name == other.name &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
        friendsConnection.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroWithFragmentsData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GHeroWithFragmentsData_heroBuilder
    implements
        Builder<GHeroWithFragmentsData_hero,
            GHeroWithFragmentsData_heroBuilder> {
  _$GHeroWithFragmentsData_hero _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GHeroWithFragmentsData_hero_friendsConnectionBuilder _friendsConnection;
  GHeroWithFragmentsData_hero_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??=
          new GHeroWithFragmentsData_hero_friendsConnectionBuilder();
  set friendsConnection(
          GHeroWithFragmentsData_hero_friendsConnectionBuilder
              friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GHeroWithFragmentsData_heroBuilder() {
    GHeroWithFragmentsData_hero._initializeBuilder(this);
  }

  GHeroWithFragmentsData_heroBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _friendsConnection = _$v.friendsConnection?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData_hero other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroWithFragmentsData_hero;
  }

  @override
  void update(void Function(GHeroWithFragmentsData_heroBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragmentsData_hero build() {
    _$GHeroWithFragmentsData_hero _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsData_hero._(
              G__typename: G__typename,
              id: id,
              name: name,
              friendsConnection: friendsConnection.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroWithFragmentsData_hero', _$failedField, e.toString());
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
  final int totalCount;
  @override
  final BuiltList<GHeroWithFragmentsData_hero_friendsConnection_edges> edges;

  factory _$GHeroWithFragmentsData_hero_friendsConnection(
          [void Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder)
              updates]) =>
      (new GHeroWithFragmentsData_hero_friendsConnectionBuilder()
            ..update(updates))
          .build();

  _$GHeroWithFragmentsData_hero_friendsConnection._(
      {this.G__typename, this.totalCount, this.edges})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GHeroWithFragmentsData_hero_friendsConnection', 'G__typename');
    }
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
    return $jf($jc($jc($jc(0, G__typename.hashCode), totalCount.hashCode),
        edges.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GHeroWithFragmentsData_hero_friendsConnection')
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
  _$GHeroWithFragmentsData_hero_friendsConnection _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _totalCount;
  int get totalCount => _$this._totalCount;
  set totalCount(int totalCount) => _$this._totalCount = totalCount;

  ListBuilder<GHeroWithFragmentsData_hero_friendsConnection_edges> _edges;
  ListBuilder<
      GHeroWithFragmentsData_hero_friendsConnection_edges> get edges => _$this
          ._edges ??=
      new ListBuilder<GHeroWithFragmentsData_hero_friendsConnection_edges>();
  set edges(
          ListBuilder<GHeroWithFragmentsData_hero_friendsConnection_edges>
              edges) =>
      _$this._edges = edges;

  GHeroWithFragmentsData_hero_friendsConnectionBuilder() {
    GHeroWithFragmentsData_hero_friendsConnection._initializeBuilder(this);
  }

  GHeroWithFragmentsData_hero_friendsConnectionBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _totalCount = _$v.totalCount;
      _edges = _$v.edges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData_hero_friendsConnection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroWithFragmentsData_hero_friendsConnection;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragmentsData_hero_friendsConnection build() {
    _$GHeroWithFragmentsData_hero_friendsConnection _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsData_hero_friendsConnection._(
              G__typename: G__typename,
              totalCount: totalCount,
              edges: _edges?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'edges';
        _edges?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroWithFragmentsData_hero_friendsConnection',
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
  final GHeroWithFragmentsData_hero_friendsConnection_edges_node node;

  factory _$GHeroWithFragmentsData_hero_friendsConnection_edges(
          [void Function(
                  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder)
              updates]) =>
      (new GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder()
            ..update(updates))
          .build();

  _$GHeroWithFragmentsData_hero_friendsConnection_edges._(
      {this.G__typename, this.node})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GHeroWithFragmentsData_hero_friendsConnection_edges', 'G__typename');
    }
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
    return $jf($jc($jc(0, G__typename.hashCode), node.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GHeroWithFragmentsData_hero_friendsConnection_edges')
          ..add('G__typename', G__typename)
          ..add('node', node))
        .toString();
  }
}

class GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder
    implements
        Builder<GHeroWithFragmentsData_hero_friendsConnection_edges,
            GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder> {
  _$GHeroWithFragmentsData_hero_friendsConnection_edges _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder _node;
  GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder get node =>
      _$this._node ??=
          new GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder();
  set node(
          GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder
              node) =>
      _$this._node = node;

  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder() {
    GHeroWithFragmentsData_hero_friendsConnection_edges._initializeBuilder(
        this);
  }

  GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _node = _$v.node?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData_hero_friendsConnection_edges other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroWithFragmentsData_hero_friendsConnection_edges;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragmentsData_hero_friendsConnection_edges build() {
    _$GHeroWithFragmentsData_hero_friendsConnection_edges _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsData_hero_friendsConnection_edges._(
              G__typename: G__typename, node: _node?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'node';
        _node?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroWithFragmentsData_hero_friendsConnection_edges',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithFragmentsData_hero_friendsConnection_edges_node
    extends GHeroWithFragmentsData_hero_friendsConnection_edges_node {
  @override
  final String G__typename;
  @override
  final String name;

  factory _$GHeroWithFragmentsData_hero_friendsConnection_edges_node(
          [void Function(
                  GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder)
              updates]) =>
      (new GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder()
            ..update(updates))
          .build();

  _$GHeroWithFragmentsData_hero_friendsConnection_edges_node._(
      {this.G__typename, this.name})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GHeroWithFragmentsData_hero_friendsConnection_edges_node',
          'G__typename');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError(
          'GHeroWithFragmentsData_hero_friendsConnection_edges_node', 'name');
    }
  }

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edges_node rebuild(
          void Function(
                  GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder toBuilder() =>
      new GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsData_hero_friendsConnection_edges_node &&
        G__typename == other.G__typename &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GHeroWithFragmentsData_hero_friendsConnection_edges_node')
          ..add('G__typename', G__typename)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder
    implements
        Builder<GHeroWithFragmentsData_hero_friendsConnection_edges_node,
            GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder> {
  _$GHeroWithFragmentsData_hero_friendsConnection_edges_node _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder() {
    GHeroWithFragmentsData_hero_friendsConnection_edges_node._initializeBuilder(
        this);
  }

  GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsData_hero_friendsConnection_edges_node other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroWithFragmentsData_hero_friendsConnection_edges_node;
  }

  @override
  void update(
      void Function(
              GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragmentsData_hero_friendsConnection_edges_node build() {
    final _$result = _$v ??
        new _$GHeroWithFragmentsData_hero_friendsConnection_edges_node._(
            G__typename: G__typename, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$GheroDataData extends GheroDataData {
  @override
  final String G__typename;
  @override
  final String name;

  factory _$GheroDataData([void Function(GheroDataDataBuilder) updates]) =>
      (new GheroDataDataBuilder()..update(updates)).build();

  _$GheroDataData._({this.G__typename, this.name}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GheroDataData', 'G__typename');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GheroDataData', 'name');
    }
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
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GheroDataData')
          ..add('G__typename', G__typename)
          ..add('name', name))
        .toString();
  }
}

class GheroDataDataBuilder
    implements Builder<GheroDataData, GheroDataDataBuilder> {
  _$GheroDataData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GheroDataDataBuilder() {
    GheroDataData._initializeBuilder(this);
  }

  GheroDataDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroDataData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GheroDataData;
  }

  @override
  void update(void Function(GheroDataDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GheroDataData build() {
    final _$result =
        _$v ?? new _$GheroDataData._(G__typename: G__typename, name: name);
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
          [void Function(GcomparisonFieldsDataBuilder) updates]) =>
      (new GcomparisonFieldsDataBuilder()..update(updates)).build();

  _$GcomparisonFieldsData._(
      {this.G__typename, this.id, this.name, this.friendsConnection})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GcomparisonFieldsData', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GcomparisonFieldsData', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GcomparisonFieldsData', 'name');
    }
    if (friendsConnection == null) {
      throw new BuiltValueNullFieldError(
          'GcomparisonFieldsData', 'friendsConnection');
    }
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
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
        friendsConnection.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GcomparisonFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GcomparisonFieldsDataBuilder
    implements Builder<GcomparisonFieldsData, GcomparisonFieldsDataBuilder> {
  _$GcomparisonFieldsData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GcomparisonFieldsData_friendsConnectionBuilder _friendsConnection;
  GcomparisonFieldsData_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??=
          new GcomparisonFieldsData_friendsConnectionBuilder();
  set friendsConnection(
          GcomparisonFieldsData_friendsConnectionBuilder friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GcomparisonFieldsDataBuilder() {
    GcomparisonFieldsData._initializeBuilder(this);
  }

  GcomparisonFieldsDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _friendsConnection = _$v.friendsConnection?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GcomparisonFieldsData;
  }

  @override
  void update(void Function(GcomparisonFieldsDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcomparisonFieldsData build() {
    _$GcomparisonFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsData._(
              G__typename: G__typename,
              id: id,
              name: name,
              friendsConnection: friendsConnection.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GcomparisonFieldsData', _$failedField, e.toString());
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
  final int totalCount;
  @override
  final BuiltList<GcomparisonFieldsData_friendsConnection_edges> edges;

  factory _$GcomparisonFieldsData_friendsConnection(
          [void Function(GcomparisonFieldsData_friendsConnectionBuilder)
              updates]) =>
      (new GcomparisonFieldsData_friendsConnectionBuilder()..update(updates))
          .build();

  _$GcomparisonFieldsData_friendsConnection._(
      {this.G__typename, this.totalCount, this.edges})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GcomparisonFieldsData_friendsConnection', 'G__typename');
    }
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
    return $jf($jc($jc($jc(0, G__typename.hashCode), totalCount.hashCode),
        edges.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GcomparisonFieldsData_friendsConnection')
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
  _$GcomparisonFieldsData_friendsConnection _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _totalCount;
  int get totalCount => _$this._totalCount;
  set totalCount(int totalCount) => _$this._totalCount = totalCount;

  ListBuilder<GcomparisonFieldsData_friendsConnection_edges> _edges;
  ListBuilder<GcomparisonFieldsData_friendsConnection_edges> get edges =>
      _$this._edges ??=
          new ListBuilder<GcomparisonFieldsData_friendsConnection_edges>();
  set edges(ListBuilder<GcomparisonFieldsData_friendsConnection_edges> edges) =>
      _$this._edges = edges;

  GcomparisonFieldsData_friendsConnectionBuilder() {
    GcomparisonFieldsData_friendsConnection._initializeBuilder(this);
  }

  GcomparisonFieldsData_friendsConnectionBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _totalCount = _$v.totalCount;
      _edges = _$v.edges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsData_friendsConnection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GcomparisonFieldsData_friendsConnection;
  }

  @override
  void update(
      void Function(GcomparisonFieldsData_friendsConnectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcomparisonFieldsData_friendsConnection build() {
    _$GcomparisonFieldsData_friendsConnection _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsData_friendsConnection._(
              G__typename: G__typename,
              totalCount: totalCount,
              edges: _edges?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'edges';
        _edges?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GcomparisonFieldsData_friendsConnection',
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
  final GcomparisonFieldsData_friendsConnection_edges_node node;

  factory _$GcomparisonFieldsData_friendsConnection_edges(
          [void Function(GcomparisonFieldsData_friendsConnection_edgesBuilder)
              updates]) =>
      (new GcomparisonFieldsData_friendsConnection_edgesBuilder()
            ..update(updates))
          .build();

  _$GcomparisonFieldsData_friendsConnection_edges._(
      {this.G__typename, this.node})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GcomparisonFieldsData_friendsConnection_edges', 'G__typename');
    }
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
    return $jf($jc($jc(0, G__typename.hashCode), node.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GcomparisonFieldsData_friendsConnection_edges')
          ..add('G__typename', G__typename)
          ..add('node', node))
        .toString();
  }
}

class GcomparisonFieldsData_friendsConnection_edgesBuilder
    implements
        Builder<GcomparisonFieldsData_friendsConnection_edges,
            GcomparisonFieldsData_friendsConnection_edgesBuilder> {
  _$GcomparisonFieldsData_friendsConnection_edges _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GcomparisonFieldsData_friendsConnection_edges_nodeBuilder _node;
  GcomparisonFieldsData_friendsConnection_edges_nodeBuilder get node =>
      _$this._node ??=
          new GcomparisonFieldsData_friendsConnection_edges_nodeBuilder();
  set node(GcomparisonFieldsData_friendsConnection_edges_nodeBuilder node) =>
      _$this._node = node;

  GcomparisonFieldsData_friendsConnection_edgesBuilder() {
    GcomparisonFieldsData_friendsConnection_edges._initializeBuilder(this);
  }

  GcomparisonFieldsData_friendsConnection_edgesBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _node = _$v.node?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsData_friendsConnection_edges other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GcomparisonFieldsData_friendsConnection_edges;
  }

  @override
  void update(
      void Function(GcomparisonFieldsData_friendsConnection_edgesBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcomparisonFieldsData_friendsConnection_edges build() {
    _$GcomparisonFieldsData_friendsConnection_edges _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsData_friendsConnection_edges._(
              G__typename: G__typename, node: _node?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'node';
        _node?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GcomparisonFieldsData_friendsConnection_edges',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFieldsData_friendsConnection_edges_node
    extends GcomparisonFieldsData_friendsConnection_edges_node {
  @override
  final String G__typename;
  @override
  final String name;

  factory _$GcomparisonFieldsData_friendsConnection_edges_node(
          [void Function(
                  GcomparisonFieldsData_friendsConnection_edges_nodeBuilder)
              updates]) =>
      (new GcomparisonFieldsData_friendsConnection_edges_nodeBuilder()
            ..update(updates))
          .build();

  _$GcomparisonFieldsData_friendsConnection_edges_node._(
      {this.G__typename, this.name})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GcomparisonFieldsData_friendsConnection_edges_node', 'G__typename');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError(
          'GcomparisonFieldsData_friendsConnection_edges_node', 'name');
    }
  }

  @override
  GcomparisonFieldsData_friendsConnection_edges_node rebuild(
          void Function(
                  GcomparisonFieldsData_friendsConnection_edges_nodeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsData_friendsConnection_edges_nodeBuilder toBuilder() =>
      new GcomparisonFieldsData_friendsConnection_edges_nodeBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFieldsData_friendsConnection_edges_node &&
        G__typename == other.G__typename &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GcomparisonFieldsData_friendsConnection_edges_node')
          ..add('G__typename', G__typename)
          ..add('name', name))
        .toString();
  }
}

class GcomparisonFieldsData_friendsConnection_edges_nodeBuilder
    implements
        Builder<GcomparisonFieldsData_friendsConnection_edges_node,
            GcomparisonFieldsData_friendsConnection_edges_nodeBuilder> {
  _$GcomparisonFieldsData_friendsConnection_edges_node _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GcomparisonFieldsData_friendsConnection_edges_nodeBuilder() {
    GcomparisonFieldsData_friendsConnection_edges_node._initializeBuilder(this);
  }

  GcomparisonFieldsData_friendsConnection_edges_nodeBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsData_friendsConnection_edges_node other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GcomparisonFieldsData_friendsConnection_edges_node;
  }

  @override
  void update(
      void Function(GcomparisonFieldsData_friendsConnection_edges_nodeBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcomparisonFieldsData_friendsConnection_edges_node build() {
    final _$result = _$v ??
        new _$GcomparisonFieldsData_friendsConnection_edges_node._(
            G__typename: G__typename, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
