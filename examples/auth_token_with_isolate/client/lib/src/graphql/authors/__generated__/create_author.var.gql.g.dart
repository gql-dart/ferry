// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_author.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAuthorVars> _$gCreateAuthorVarsSerializer =
    new _$GCreateAuthorVarsSerializer();

class _$GCreateAuthorVarsSerializer
    implements StructuredSerializer<GCreateAuthorVars> {
  @override
  final Iterable<Type> types = const [GCreateAuthorVars, _$GCreateAuthorVars];
  @override
  final String wireName = 'GCreateAuthorVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateAuthorVars object,
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
  GCreateAuthorVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAuthorVarsBuilder();

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

class _$GCreateAuthorVars extends GCreateAuthorVars {
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$GCreateAuthorVars(
          [void Function(GCreateAuthorVarsBuilder)? updates]) =>
      (new GCreateAuthorVarsBuilder()..update(updates))._build();

  _$GCreateAuthorVars._({required this.firstName, required this.lastName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'GCreateAuthorVars', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'GCreateAuthorVars', 'lastName');
  }

  @override
  GCreateAuthorVars rebuild(void Function(GCreateAuthorVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAuthorVarsBuilder toBuilder() =>
      new GCreateAuthorVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAuthorVars &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAuthorVars')
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class GCreateAuthorVarsBuilder
    implements Builder<GCreateAuthorVars, GCreateAuthorVarsBuilder> {
  _$GCreateAuthorVars? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GCreateAuthorVarsBuilder();

  GCreateAuthorVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAuthorVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAuthorVars;
  }

  @override
  void update(void Function(GCreateAuthorVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAuthorVars build() => _build();

  _$GCreateAuthorVars _build() {
    final _$result = _$v ??
        new _$GCreateAuthorVars._(
          firstName: BuiltValueNullFieldError.checkNotNull(
              firstName, r'GCreateAuthorVars', 'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(
              lastName, r'GCreateAuthorVars', 'lastName'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
