// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GAuthorsOrderField _$gAuthorsOrderFieldID =
    const GAuthorsOrderField._('ID');
const GAuthorsOrderField _$gAuthorsOrderFieldFIRST_NAME =
    const GAuthorsOrderField._('FIRST_NAME');
const GAuthorsOrderField _$gAuthorsOrderFieldLAST_NAME =
    const GAuthorsOrderField._('LAST_NAME');
const GAuthorsOrderField _$gAuthorsOrderFieldCREATED_AT =
    const GAuthorsOrderField._('CREATED_AT');
const GAuthorsOrderField _$gAuthorsOrderFieldgUnknownEnumValue =
    const GAuthorsOrderField._('gUnknownEnumValue');

GAuthorsOrderField _$gAuthorsOrderFieldValueOf(String name) {
  switch (name) {
    case 'ID':
      return _$gAuthorsOrderFieldID;
    case 'FIRST_NAME':
      return _$gAuthorsOrderFieldFIRST_NAME;
    case 'LAST_NAME':
      return _$gAuthorsOrderFieldLAST_NAME;
    case 'CREATED_AT':
      return _$gAuthorsOrderFieldCREATED_AT;
    case 'gUnknownEnumValue':
      return _$gAuthorsOrderFieldgUnknownEnumValue;
    default:
      return _$gAuthorsOrderFieldgUnknownEnumValue;
  }
}

final BuiltSet<GAuthorsOrderField> _$gAuthorsOrderFieldValues =
    new BuiltSet<GAuthorsOrderField>(const <GAuthorsOrderField>[
  _$gAuthorsOrderFieldID,
  _$gAuthorsOrderFieldFIRST_NAME,
  _$gAuthorsOrderFieldLAST_NAME,
  _$gAuthorsOrderFieldCREATED_AT,
  _$gAuthorsOrderFieldgUnknownEnumValue,
]);

const GDirection _$gDirectionASC = const GDirection._('ASC');
const GDirection _$gDirectionDESC = const GDirection._('DESC');
const GDirection _$gDirectiongUnknownEnumValue =
    const GDirection._('gUnknownEnumValue');

GDirection _$gDirectionValueOf(String name) {
  switch (name) {
    case 'ASC':
      return _$gDirectionASC;
    case 'DESC':
      return _$gDirectionDESC;
    case 'gUnknownEnumValue':
      return _$gDirectiongUnknownEnumValue;
    default:
      return _$gDirectiongUnknownEnumValue;
  }
}

final BuiltSet<GDirection> _$gDirectionValues =
    new BuiltSet<GDirection>(const <GDirection>[
  _$gDirectionASC,
  _$gDirectionDESC,
  _$gDirectiongUnknownEnumValue,
]);

Serializer<GAuthorsOrder> _$gAuthorsOrderSerializer =
    new _$GAuthorsOrderSerializer();
Serializer<GAuthorsOrderField> _$gAuthorsOrderFieldSerializer =
    new _$GAuthorsOrderFieldSerializer();
Serializer<GdeleteAuthorInput> _$gdeleteAuthorInputSerializer =
    new _$GdeleteAuthorInputSerializer();
Serializer<GDirection> _$gDirectionSerializer = new _$GDirectionSerializer();
Serializer<GloginInput> _$gloginInputSerializer = new _$GloginInputSerializer();
Serializer<GNewAuthor> _$gNewAuthorSerializer = new _$GNewAuthorSerializer();

class _$GAuthorsOrderSerializer implements StructuredSerializer<GAuthorsOrder> {
  @override
  final Iterable<Type> types = const [GAuthorsOrder, _$GAuthorsOrder];
  @override
  final String wireName = 'GAuthorsOrder';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAuthorsOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(GAuthorsOrderField)),
      'direction',
      serializers.serialize(object.direction,
          specifiedType: const FullType(GDirection)),
    ];

    return result;
  }

  @override
  GAuthorsOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAuthorsOrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'field':
          result.field = serializers.deserialize(value,
                  specifiedType: const FullType(GAuthorsOrderField))!
              as GAuthorsOrderField;
          break;
        case 'direction':
          result.direction = serializers.deserialize(value,
              specifiedType: const FullType(GDirection))! as GDirection;
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthorsOrderFieldSerializer
    implements PrimitiveSerializer<GAuthorsOrderField> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'gUnknownEnumValue': 'gUnknownEnumValue',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'gUnknownEnumValue': 'gUnknownEnumValue',
  };

  @override
  final Iterable<Type> types = const <Type>[GAuthorsOrderField];
  @override
  final String wireName = 'GAuthorsOrderField';

  @override
  Object serialize(Serializers serializers, GAuthorsOrderField object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GAuthorsOrderField deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GAuthorsOrderField.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$GdeleteAuthorInputSerializer
    implements StructuredSerializer<GdeleteAuthorInput> {
  @override
  final Iterable<Type> types = const [GdeleteAuthorInput, _$GdeleteAuthorInput];
  @override
  final String wireName = 'GdeleteAuthorInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GdeleteAuthorInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GdeleteAuthorInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GdeleteAuthorInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GDirectionSerializer implements PrimitiveSerializer<GDirection> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'gUnknownEnumValue': 'gUnknownEnumValue',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'gUnknownEnumValue': 'gUnknownEnumValue',
  };

  @override
  final Iterable<Type> types = const <Type>[GDirection];
  @override
  final String wireName = 'GDirection';

  @override
  Object serialize(Serializers serializers, GDirection object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GDirection deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GDirection.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$GloginInputSerializer implements StructuredSerializer<GloginInput> {
  @override
  final Iterable<Type> types = const [GloginInput, _$GloginInput];
  @override
  final String wireName = 'GloginInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GloginInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GloginInput deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GloginInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GNewAuthorSerializer implements StructuredSerializer<GNewAuthor> {
  @override
  final Iterable<Type> types = const [GNewAuthor, _$GNewAuthor];
  @override
  final String wireName = 'GNewAuthor';

  @override
  Iterable<Object?> serialize(Serializers serializers, GNewAuthor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GNewAuthor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNewAuthorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthorsOrder extends GAuthorsOrder {
  @override
  final GAuthorsOrderField field;
  @override
  final GDirection direction;

  factory _$GAuthorsOrder([void Function(GAuthorsOrderBuilder)? updates]) =>
      (new GAuthorsOrderBuilder()..update(updates))._build();

  _$GAuthorsOrder._({required this.field, required this.direction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(field, r'GAuthorsOrder', 'field');
    BuiltValueNullFieldError.checkNotNull(
        direction, r'GAuthorsOrder', 'direction');
  }

  @override
  GAuthorsOrder rebuild(void Function(GAuthorsOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthorsOrderBuilder toBuilder() => new GAuthorsOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthorsOrder &&
        field == other.field &&
        direction == other.direction;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, field.hashCode), direction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAuthorsOrder')
          ..add('field', field)
          ..add('direction', direction))
        .toString();
  }
}

class GAuthorsOrderBuilder
    implements Builder<GAuthorsOrder, GAuthorsOrderBuilder> {
  _$GAuthorsOrder? _$v;

  GAuthorsOrderField? _field;
  GAuthorsOrderField? get field => _$this._field;
  set field(GAuthorsOrderField? field) => _$this._field = field;

  GDirection? _direction;
  GDirection? get direction => _$this._direction;
  set direction(GDirection? direction) => _$this._direction = direction;

  GAuthorsOrderBuilder();

  GAuthorsOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _direction = $v.direction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthorsOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAuthorsOrder;
  }

  @override
  void update(void Function(GAuthorsOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAuthorsOrder build() => _build();

  _$GAuthorsOrder _build() {
    final _$result = _$v ??
        new _$GAuthorsOrder._(
            field: BuiltValueNullFieldError.checkNotNull(
                field, r'GAuthorsOrder', 'field'),
            direction: BuiltValueNullFieldError.checkNotNull(
                direction, r'GAuthorsOrder', 'direction'));
    replace(_$result);
    return _$result;
  }
}

class _$GdeleteAuthorInput extends GdeleteAuthorInput {
  @override
  final int id;

  factory _$GdeleteAuthorInput(
          [void Function(GdeleteAuthorInputBuilder)? updates]) =>
      (new GdeleteAuthorInputBuilder()..update(updates))._build();

  _$GdeleteAuthorInput._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GdeleteAuthorInput', 'id');
  }

  @override
  GdeleteAuthorInput rebuild(
          void Function(GdeleteAuthorInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GdeleteAuthorInputBuilder toBuilder() =>
      new GdeleteAuthorInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GdeleteAuthorInput && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GdeleteAuthorInput')..add('id', id))
        .toString();
  }
}

class GdeleteAuthorInputBuilder
    implements Builder<GdeleteAuthorInput, GdeleteAuthorInputBuilder> {
  _$GdeleteAuthorInput? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GdeleteAuthorInputBuilder();

  GdeleteAuthorInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GdeleteAuthorInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GdeleteAuthorInput;
  }

  @override
  void update(void Function(GdeleteAuthorInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GdeleteAuthorInput build() => _build();

  _$GdeleteAuthorInput _build() {
    final _$result = _$v ??
        new _$GdeleteAuthorInput._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GdeleteAuthorInput', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$GloginInput extends GloginInput {
  @override
  final String username;
  @override
  final String password;

  factory _$GloginInput([void Function(GloginInputBuilder)? updates]) =>
      (new GloginInputBuilder()..update(updates))._build();

  _$GloginInput._({required this.username, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(username, r'GloginInput', 'username');
    BuiltValueNullFieldError.checkNotNull(password, r'GloginInput', 'password');
  }

  @override
  GloginInput rebuild(void Function(GloginInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GloginInputBuilder toBuilder() => new GloginInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GloginInput &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GloginInput')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class GloginInputBuilder implements Builder<GloginInput, GloginInputBuilder> {
  _$GloginInput? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  GloginInputBuilder();

  GloginInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GloginInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GloginInput;
  }

  @override
  void update(void Function(GloginInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GloginInput build() => _build();

  _$GloginInput _build() {
    final _$result = _$v ??
        new _$GloginInput._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'GloginInput', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'GloginInput', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$GNewAuthor extends GNewAuthor {
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$GNewAuthor([void Function(GNewAuthorBuilder)? updates]) =>
      (new GNewAuthorBuilder()..update(updates))._build();

  _$GNewAuthor._({required this.firstName, required this.lastName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'GNewAuthor', 'firstName');
    BuiltValueNullFieldError.checkNotNull(lastName, r'GNewAuthor', 'lastName');
  }

  @override
  GNewAuthor rebuild(void Function(GNewAuthorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNewAuthorBuilder toBuilder() => new GNewAuthorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNewAuthor &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, firstName.hashCode), lastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GNewAuthor')
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class GNewAuthorBuilder implements Builder<GNewAuthor, GNewAuthorBuilder> {
  _$GNewAuthor? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GNewAuthorBuilder();

  GNewAuthorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNewAuthor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNewAuthor;
  }

  @override
  void update(void Function(GNewAuthorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GNewAuthor build() => _build();

  _$GNewAuthor _build() {
    final _$result = _$v ??
        new _$GNewAuthor._(
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'GNewAuthor', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'GNewAuthor', 'lastName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
