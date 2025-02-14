// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanFragmentData> _$gHumanFragmentDataSerializer =
    new _$GHumanFragmentDataSerializer();
Serializer<GHumanFragmentData_friendsConnection>
    _$gHumanFragmentDataFriendsConnectionSerializer =
    new _$GHumanFragmentData_friendsConnectionSerializer();
Serializer<GHumanFragmentData_friendsConnection_friends>
    _$gHumanFragmentDataFriendsConnectionFriendsSerializer =
    new _$GHumanFragmentData_friendsConnection_friendsSerializer();

class _$GHumanFragmentDataSerializer
    implements StructuredSerializer<GHumanFragmentData> {
  @override
  final Iterable<Type> types = const [GHumanFragmentData, _$GHumanFragmentData];
  @override
  final String wireName = 'GHumanFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanFragmentData object,
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
          specifiedType: const FullType(GHumanFragmentData_friendsConnection)),
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
  GHumanFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanFragmentDataBuilder();

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
                  specifiedType:
                      const FullType(GHumanFragmentData_friendsConnection))!
              as GHumanFragmentData_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanFragmentData_friendsConnectionSerializer
    implements StructuredSerializer<GHumanFragmentData_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GHumanFragmentData_friendsConnection,
    _$GHumanFragmentData_friendsConnection
  ];
  @override
  final String wireName = 'GHumanFragmentData_friendsConnection';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanFragmentData_friendsConnection object,
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
                  GHumanFragmentData_friendsConnection_friends)
            ])));
    }
    return result;
  }

  @override
  GHumanFragmentData_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanFragmentData_friendsConnectionBuilder();

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
                    GHumanFragmentData_friendsConnection_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanFragmentData_friendsConnection_friendsSerializer
    implements
        StructuredSerializer<GHumanFragmentData_friendsConnection_friends> {
  @override
  final Iterable<Type> types = const [
    GHumanFragmentData_friendsConnection_friends,
    _$GHumanFragmentData_friendsConnection_friends
  ];
  @override
  final String wireName = 'GHumanFragmentData_friendsConnection_friends';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHumanFragmentData_friendsConnection_friends object,
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
  GHumanFragmentData_friendsConnection_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanFragmentData_friendsConnection_friendsBuilder();

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

class _$GHumanFragmentData extends GHumanFragmentData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final double? height;
  @override
  final GHumanFragmentData_friendsConnection friendsConnection;

  factory _$GHumanFragmentData(
          [void Function(GHumanFragmentDataBuilder)? updates]) =>
      (new GHumanFragmentDataBuilder()..update(updates))._build();

  _$GHumanFragmentData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.height,
      required this.friendsConnection})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHumanFragmentData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GHumanFragmentData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        friendsConnection, r'GHumanFragmentData', 'friendsConnection');
  }

  @override
  GHumanFragmentData rebuild(
          void Function(GHumanFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanFragmentDataBuilder toBuilder() =>
      new GHumanFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanFragmentData &&
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
    return (newBuiltValueToStringHelper(r'GHumanFragmentData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('height', height)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GHumanFragmentDataBuilder
    implements Builder<GHumanFragmentData, GHumanFragmentDataBuilder> {
  _$GHumanFragmentData? _$v;

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

  GHumanFragmentData_friendsConnectionBuilder? _friendsConnection;
  GHumanFragmentData_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??=
          new GHumanFragmentData_friendsConnectionBuilder();
  set friendsConnection(
          GHumanFragmentData_friendsConnectionBuilder? friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GHumanFragmentDataBuilder() {
    GHumanFragmentData._initializeBuilder(this);
  }

  GHumanFragmentDataBuilder get _$this {
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
  void replace(GHumanFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanFragmentData;
  }

  @override
  void update(void Function(GHumanFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanFragmentData build() => _build();

  _$GHumanFragmentData _build() {
    _$GHumanFragmentData _$result;
    try {
      _$result = _$v ??
          new _$GHumanFragmentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHumanFragmentData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHumanFragmentData', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GHumanFragmentData', 'name'),
              height: height,
              friendsConnection: friendsConnection.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHumanFragmentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanFragmentData_friendsConnection
    extends GHumanFragmentData_friendsConnection {
  @override
  final String G__typename;
  @override
  final BuiltList<GHumanFragmentData_friendsConnection_friends?>? friends;

  factory _$GHumanFragmentData_friendsConnection(
          [void Function(GHumanFragmentData_friendsConnectionBuilder)?
              updates]) =>
      (new GHumanFragmentData_friendsConnectionBuilder()..update(updates))
          ._build();

  _$GHumanFragmentData_friendsConnection._(
      {required this.G__typename, this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanFragmentData_friendsConnection', 'G__typename');
  }

  @override
  GHumanFragmentData_friendsConnection rebuild(
          void Function(GHumanFragmentData_friendsConnectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanFragmentData_friendsConnectionBuilder toBuilder() =>
      new GHumanFragmentData_friendsConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanFragmentData_friendsConnection &&
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
    return (newBuiltValueToStringHelper(r'GHumanFragmentData_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('friends', friends))
        .toString();
  }
}

class GHumanFragmentData_friendsConnectionBuilder
    implements
        Builder<GHumanFragmentData_friendsConnection,
            GHumanFragmentData_friendsConnectionBuilder> {
  _$GHumanFragmentData_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GHumanFragmentData_friendsConnection_friends?>? _friends;
  ListBuilder<GHumanFragmentData_friendsConnection_friends?> get friends =>
      _$this._friends ??=
          new ListBuilder<GHumanFragmentData_friendsConnection_friends?>();
  set friends(
          ListBuilder<GHumanFragmentData_friendsConnection_friends?>?
              friends) =>
      _$this._friends = friends;

  GHumanFragmentData_friendsConnectionBuilder() {
    GHumanFragmentData_friendsConnection._initializeBuilder(this);
  }

  GHumanFragmentData_friendsConnectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanFragmentData_friendsConnection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanFragmentData_friendsConnection;
  }

  @override
  void update(
      void Function(GHumanFragmentData_friendsConnectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanFragmentData_friendsConnection build() => _build();

  _$GHumanFragmentData_friendsConnection _build() {
    _$GHumanFragmentData_friendsConnection _$result;
    try {
      _$result = _$v ??
          new _$GHumanFragmentData_friendsConnection._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GHumanFragmentData_friendsConnection', 'G__typename'),
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHumanFragmentData_friendsConnection',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanFragmentData_friendsConnection_friends
    extends GHumanFragmentData_friendsConnection_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHumanFragmentData_friendsConnection_friends(
          [void Function(GHumanFragmentData_friendsConnection_friendsBuilder)?
              updates]) =>
      (new GHumanFragmentData_friendsConnection_friendsBuilder()
            ..update(updates))
          ._build();

  _$GHumanFragmentData_friendsConnection_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHumanFragmentData_friendsConnection_friends', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHumanFragmentData_friendsConnection_friends', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHumanFragmentData_friendsConnection_friends', 'name');
  }

  @override
  GHumanFragmentData_friendsConnection_friends rebuild(
          void Function(GHumanFragmentData_friendsConnection_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanFragmentData_friendsConnection_friendsBuilder toBuilder() =>
      new GHumanFragmentData_friendsConnection_friendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanFragmentData_friendsConnection_friends &&
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
            r'GHumanFragmentData_friendsConnection_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHumanFragmentData_friendsConnection_friendsBuilder
    implements
        Builder<GHumanFragmentData_friendsConnection_friends,
            GHumanFragmentData_friendsConnection_friendsBuilder> {
  _$GHumanFragmentData_friendsConnection_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHumanFragmentData_friendsConnection_friendsBuilder() {
    GHumanFragmentData_friendsConnection_friends._initializeBuilder(this);
  }

  GHumanFragmentData_friendsConnection_friendsBuilder get _$this {
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
  void replace(GHumanFragmentData_friendsConnection_friends other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanFragmentData_friendsConnection_friends;
  }

  @override
  void update(
      void Function(GHumanFragmentData_friendsConnection_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanFragmentData_friendsConnection_friends build() => _build();

  _$GHumanFragmentData_friendsConnection_friends _build() {
    final _$result = _$v ??
        new _$GHumanFragmentData_friendsConnection_friends._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHumanFragmentData_friendsConnection_friends', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHumanFragmentData_friendsConnection_friends', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHumanFragmentData_friendsConnection_friends', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
