// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_author.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAuthorData> _$gCreateAuthorDataSerializer =
    new _$GCreateAuthorDataSerializer();
Serializer<GCreateAuthorData_createAuthor>
    _$gCreateAuthorDataCreateAuthorSerializer =
    new _$GCreateAuthorData_createAuthorSerializer();

class _$GCreateAuthorDataSerializer
    implements StructuredSerializer<GCreateAuthorData> {
  @override
  final Iterable<Type> types = const [GCreateAuthorData, _$GCreateAuthorData];
  @override
  final String wireName = 'GCreateAuthorData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateAuthorData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createAuthor;
    if (value != null) {
      result
        ..add('createAuthor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GCreateAuthorData_createAuthor)));
    }
    return result;
  }

  @override
  GCreateAuthorData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAuthorDataBuilder();

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
        case 'createAuthor':
          result.createAuthor.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateAuthorData_createAuthor))!
              as GCreateAuthorData_createAuthor);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAuthorData_createAuthorSerializer
    implements StructuredSerializer<GCreateAuthorData_createAuthor> {
  @override
  final Iterable<Type> types = const [
    GCreateAuthorData_createAuthor,
    _$GCreateAuthorData_createAuthor
  ];
  @override
  final String wireName = 'GCreateAuthorData_createAuthor';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAuthorData_createAuthor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
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
  GCreateAuthorData_createAuthor deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAuthorData_createAuthorBuilder();

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

class _$GCreateAuthorData extends GCreateAuthorData {
  @override
  final String G__typename;
  @override
  final GCreateAuthorData_createAuthor? createAuthor;

  factory _$GCreateAuthorData(
          [void Function(GCreateAuthorDataBuilder)? updates]) =>
      (new GCreateAuthorDataBuilder()..update(updates))._build();

  _$GCreateAuthorData._({required this.G__typename, this.createAuthor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAuthorData', 'G__typename');
  }

  @override
  GCreateAuthorData rebuild(void Function(GCreateAuthorDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAuthorDataBuilder toBuilder() =>
      new GCreateAuthorDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAuthorData &&
        G__typename == other.G__typename &&
        createAuthor == other.createAuthor;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), createAuthor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAuthorData')
          ..add('G__typename', G__typename)
          ..add('createAuthor', createAuthor))
        .toString();
  }
}

class GCreateAuthorDataBuilder
    implements Builder<GCreateAuthorData, GCreateAuthorDataBuilder> {
  _$GCreateAuthorData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateAuthorData_createAuthorBuilder? _createAuthor;
  GCreateAuthorData_createAuthorBuilder get createAuthor =>
      _$this._createAuthor ??= new GCreateAuthorData_createAuthorBuilder();
  set createAuthor(GCreateAuthorData_createAuthorBuilder? createAuthor) =>
      _$this._createAuthor = createAuthor;

  GCreateAuthorDataBuilder() {
    GCreateAuthorData._initializeBuilder(this);
  }

  GCreateAuthorDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createAuthor = $v.createAuthor?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAuthorData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAuthorData;
  }

  @override
  void update(void Function(GCreateAuthorDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAuthorData build() => _build();

  _$GCreateAuthorData _build() {
    _$GCreateAuthorData _$result;
    try {
      _$result = _$v ??
          new _$GCreateAuthorData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateAuthorData', 'G__typename'),
              createAuthor: _createAuthor?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createAuthor';
        _createAuthor?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateAuthorData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateAuthorData_createAuthor extends GCreateAuthorData_createAuthor {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$GCreateAuthorData_createAuthor(
          [void Function(GCreateAuthorData_createAuthorBuilder)? updates]) =>
      (new GCreateAuthorData_createAuthorBuilder()..update(updates))._build();

  _$GCreateAuthorData_createAuthor._(
      {required this.G__typename,
      required this.id,
      required this.firstName,
      required this.lastName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAuthorData_createAuthor', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateAuthorData_createAuthor', 'id');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'GCreateAuthorData_createAuthor', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'GCreateAuthorData_createAuthor', 'lastName');
  }

  @override
  GCreateAuthorData_createAuthor rebuild(
          void Function(GCreateAuthorData_createAuthorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAuthorData_createAuthorBuilder toBuilder() =>
      new GCreateAuthorData_createAuthorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAuthorData_createAuthor &&
        G__typename == other.G__typename &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), firstName.hashCode),
        lastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAuthorData_createAuthor')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class GCreateAuthorData_createAuthorBuilder
    implements
        Builder<GCreateAuthorData_createAuthor,
            GCreateAuthorData_createAuthorBuilder> {
  _$GCreateAuthorData_createAuthor? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GCreateAuthorData_createAuthorBuilder() {
    GCreateAuthorData_createAuthor._initializeBuilder(this);
  }

  GCreateAuthorData_createAuthorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAuthorData_createAuthor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAuthorData_createAuthor;
  }

  @override
  void update(void Function(GCreateAuthorData_createAuthorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAuthorData_createAuthor build() => _build();

  _$GCreateAuthorData_createAuthor _build() {
    final _$result = _$v ??
        new _$GCreateAuthorData_createAuthor._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateAuthorData_createAuthor', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateAuthorData_createAuthor', 'id'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'GCreateAuthorData_createAuthor', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'GCreateAuthorData_createAuthor', 'lastName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
