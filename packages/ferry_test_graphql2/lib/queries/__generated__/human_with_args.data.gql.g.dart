// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_with_args.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanWithArgsData> _$gHumanWithArgsDataSerializer =
    new _$GHumanWithArgsDataSerializer();
Serializer<GHumanWithArgsData_human> _$gHumanWithArgsDataHumanSerializer =
    new _$GHumanWithArgsData_humanSerializer();
Serializer<GHumanWithArgsData_human_friendsConnection>
    _$gHumanWithArgsDataHumanFriendsConnectionSerializer =
    new _$GHumanWithArgsData_human_friendsConnectionSerializer();
Serializer<GHumanWithArgsData_human_friendsConnection_friends>
    _$gHumanWithArgsDataHumanFriendsConnectionFriendsSerializer =
    new _$GHumanWithArgsData_human_friendsConnection_friendsSerializer();

class _$GHumanWithArgsDataSerializer
    implements StructuredSerializer<GHumanWithArgsData> {
  @override
  final Iterable<Type> types = const [GHumanWithArgsData, _$GHumanWithArgsData];
  @override
  final String wireName = 'GHumanWithArgsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanWithArgsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'human',
      serializers.serialize(object.human,
          specifiedType: const FullType(GHumanWithArgsData_human)),
    ];

    return result;
  }

  @override
  GHumanWithArgsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsDataBuilder();

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
                  specifiedType: const FullType(GHumanWithArgsData_human))!
              as GHumanWithArgsData_human);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsData_humanSerializer
    implements StructuredSerializer<GHumanWithArgsData_human> {
  @override
  final Iterable<Type> types = const [
    GHumanWithArgsData_human,
    _$GHumanWithArgsData_human
  ];
  @override
  final String wireName = 'GHumanWithArgsData_human';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanWithArgsData_human object,
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
              const FullType(GHumanWithArgsData_human_friendsConnection)),
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
  GHumanWithArgsData_human deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsData_humanBuilder();

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
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GHumanWithArgsData_human_friendsConnection))!
              as GHumanWithArgsData_human_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsData_human_friendsConnectionSerializer
    implements
        StructuredSerializer<GHumanWithArgsData_human_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GHumanWithArgsData_human_friendsConnection,
    _$GHumanWithArgsData_human_friendsConnection
  ];
  @override
  final String wireName = 'GHumanWithArgsData_human_friendsConnection';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHumanWithArgsData_human_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GHumanWithArgsData_human_friendsConnection_friends)
            ])));
    }
    return result;
  }

  @override
  GHumanWithArgsData_human_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsData_human_friendsConnectionBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GHumanWithArgsData_human_friendsConnection_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsData_human_friendsConnection_friendsSerializer
    implements
        StructuredSerializer<
            GHumanWithArgsData_human_friendsConnection_friends> {
  @override
  final Iterable<Type> types = const [
    GHumanWithArgsData_human_friendsConnection_friends,
    _$GHumanWithArgsData_human_friendsConnection_friends
  ];
  @override
  final String wireName = 'GHumanWithArgsData_human_friendsConnection_friends';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHumanWithArgsData_human_friendsConnection_friends object,
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
  GHumanWithArgsData_human_friendsConnection_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHumanWithArgsData_human_friendsConnection_friendsBuilder();

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

class _$GHumanWithArgsData extends GHumanWithArgsData {
  @override
  final String G__typename;
  @override
  final GHumanWithArgsData_human human;

  factory _$GHumanWithArgsData(
          [void Function(GHumanWithArgsDataBuilder)? updates]) =>
      (new GHumanWithArgsDataBuilder()..update(updates))._build();

  _$GHumanWithArgsData._({required this.G__typename, required this.human})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanWithArgsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        human, r'GHumanWithArgsData', 'human');
  }

  @override
  GHumanWithArgsData rebuild(
          void Function(GHumanWithArgsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsDataBuilder toBuilder() =>
      new GHumanWithArgsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData &&
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
    return (newBuiltValueToStringHelper(r'GHumanWithArgsData')
          ..add('G__typename', G__typename)
          ..add('human', human))
        .toString();
  }
}

class GHumanWithArgsDataBuilder
    implements Builder<GHumanWithArgsData, GHumanWithArgsDataBuilder> {
  _$GHumanWithArgsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHumanWithArgsData_humanBuilder? _human;
  GHumanWithArgsData_humanBuilder get human =>
      _$this._human ??= new GHumanWithArgsData_humanBuilder();
  set human(GHumanWithArgsData_humanBuilder? human) => _$this._human = human;

  GHumanWithArgsDataBuilder() {
    GHumanWithArgsData._initializeBuilder(this);
  }

  GHumanWithArgsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _human = $v.human.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgsData;
  }

  @override
  void update(void Function(GHumanWithArgsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanWithArgsData build() => _build();

  _$GHumanWithArgsData _build() {
    _$GHumanWithArgsData _$result;
    try {
      _$result = _$v ??
          new _$GHumanWithArgsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHumanWithArgsData', 'G__typename'),
            human: human.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'human';
        human.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHumanWithArgsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanWithArgsData_human extends GHumanWithArgsData_human {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final double? height;
  @override
  final GHumanWithArgsData_human_friendsConnection friendsConnection;

  factory _$GHumanWithArgsData_human(
          [void Function(GHumanWithArgsData_humanBuilder)? updates]) =>
      (new GHumanWithArgsData_humanBuilder()..update(updates))._build();

  _$GHumanWithArgsData_human._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.height,
      required this.friendsConnection})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanWithArgsData_human', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHumanWithArgsData_human', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHumanWithArgsData_human', 'name');
    BuiltValueNullFieldError.checkNotNull(
        friendsConnection, r'GHumanWithArgsData_human', 'friendsConnection');
  }

  @override
  GHumanWithArgsData_human rebuild(
          void Function(GHumanWithArgsData_humanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsData_humanBuilder toBuilder() =>
      new GHumanWithArgsData_humanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData_human &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        height == other.height &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanWithArgsData_human')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('height', height)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GHumanWithArgsData_humanBuilder
    implements
        Builder<GHumanWithArgsData_human, GHumanWithArgsData_humanBuilder> {
  _$GHumanWithArgsData_human? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  GHumanWithArgsData_human_friendsConnectionBuilder? _friendsConnection;
  GHumanWithArgsData_human_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??=
          new GHumanWithArgsData_human_friendsConnectionBuilder();
  set friendsConnection(
          GHumanWithArgsData_human_friendsConnectionBuilder?
              friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GHumanWithArgsData_humanBuilder() {
    GHumanWithArgsData_human._initializeBuilder(this);
  }

  GHumanWithArgsData_humanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _height = $v.height;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsData_human other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgsData_human;
  }

  @override
  void update(void Function(GHumanWithArgsData_humanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanWithArgsData_human build() => _build();

  _$GHumanWithArgsData_human _build() {
    _$GHumanWithArgsData_human _$result;
    try {
      _$result = _$v ??
          new _$GHumanWithArgsData_human._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHumanWithArgsData_human', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHumanWithArgsData_human', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHumanWithArgsData_human', 'name'),
            height: height,
            friendsConnection: friendsConnection.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHumanWithArgsData_human', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanWithArgsData_human_friendsConnection
    extends GHumanWithArgsData_human_friendsConnection {
  @override
  final String G__typename;
  @override
  final BuiltList<GHumanWithArgsData_human_friendsConnection_friends?>? friends;

  factory _$GHumanWithArgsData_human_friendsConnection(
          [void Function(GHumanWithArgsData_human_friendsConnectionBuilder)?
              updates]) =>
      (new GHumanWithArgsData_human_friendsConnectionBuilder()..update(updates))
          ._build();

  _$GHumanWithArgsData_human_friendsConnection._(
      {required this.G__typename, this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHumanWithArgsData_human_friendsConnection', 'G__typename');
  }

  @override
  GHumanWithArgsData_human_friendsConnection rebuild(
          void Function(GHumanWithArgsData_human_friendsConnectionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsData_human_friendsConnectionBuilder toBuilder() =>
      new GHumanWithArgsData_human_friendsConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData_human_friendsConnection &&
        G__typename == other.G__typename &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHumanWithArgsData_human_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('friends', friends))
        .toString();
  }
}

class GHumanWithArgsData_human_friendsConnectionBuilder
    implements
        Builder<GHumanWithArgsData_human_friendsConnection,
            GHumanWithArgsData_human_friendsConnectionBuilder> {
  _$GHumanWithArgsData_human_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GHumanWithArgsData_human_friendsConnection_friends?>? _friends;
  ListBuilder<
      GHumanWithArgsData_human_friendsConnection_friends?> get friends => _$this
          ._friends ??=
      new ListBuilder<GHumanWithArgsData_human_friendsConnection_friends?>();
  set friends(
          ListBuilder<GHumanWithArgsData_human_friendsConnection_friends?>?
              friends) =>
      _$this._friends = friends;

  GHumanWithArgsData_human_friendsConnectionBuilder() {
    GHumanWithArgsData_human_friendsConnection._initializeBuilder(this);
  }

  GHumanWithArgsData_human_friendsConnectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsData_human_friendsConnection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgsData_human_friendsConnection;
  }

  @override
  void update(
      void Function(GHumanWithArgsData_human_friendsConnectionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanWithArgsData_human_friendsConnection build() => _build();

  _$GHumanWithArgsData_human_friendsConnection _build() {
    _$GHumanWithArgsData_human_friendsConnection _$result;
    try {
      _$result = _$v ??
          new _$GHumanWithArgsData_human_friendsConnection._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHumanWithArgsData_human_friendsConnection', 'G__typename'),
            friends: _friends?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHumanWithArgsData_human_friendsConnection',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanWithArgsData_human_friendsConnection_friends
    extends GHumanWithArgsData_human_friendsConnection_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHumanWithArgsData_human_friendsConnection_friends(
          [void Function(
                  GHumanWithArgsData_human_friendsConnection_friendsBuilder)?
              updates]) =>
      (new GHumanWithArgsData_human_friendsConnection_friendsBuilder()
            ..update(updates))
          ._build();

  _$GHumanWithArgsData_human_friendsConnection_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHumanWithArgsData_human_friendsConnection_friends', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHumanWithArgsData_human_friendsConnection_friends', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHumanWithArgsData_human_friendsConnection_friends', 'name');
  }

  @override
  GHumanWithArgsData_human_friendsConnection_friends rebuild(
          void Function(
                  GHumanWithArgsData_human_friendsConnection_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsData_human_friendsConnection_friendsBuilder toBuilder() =>
      new GHumanWithArgsData_human_friendsConnection_friendsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData_human_friendsConnection_friends &&
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
    return (newBuiltValueToStringHelper(
            r'GHumanWithArgsData_human_friendsConnection_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHumanWithArgsData_human_friendsConnection_friendsBuilder
    implements
        Builder<GHumanWithArgsData_human_friendsConnection_friends,
            GHumanWithArgsData_human_friendsConnection_friendsBuilder> {
  _$GHumanWithArgsData_human_friendsConnection_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHumanWithArgsData_human_friendsConnection_friendsBuilder() {
    GHumanWithArgsData_human_friendsConnection_friends._initializeBuilder(this);
  }

  GHumanWithArgsData_human_friendsConnection_friendsBuilder get _$this {
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
  void replace(GHumanWithArgsData_human_friendsConnection_friends other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgsData_human_friendsConnection_friends;
  }

  @override
  void update(
      void Function(GHumanWithArgsData_human_friendsConnection_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanWithArgsData_human_friendsConnection_friends build() => _build();

  _$GHumanWithArgsData_human_friendsConnection_friends _build() {
    final _$result = _$v ??
        new _$GHumanWithArgsData_human_friendsConnection_friends._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GHumanWithArgsData_human_friendsConnection_friends',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GHumanWithArgsData_human_friendsConnection_friends', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(name,
              r'GHumanWithArgsData_human_friendsConnection_friends', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
