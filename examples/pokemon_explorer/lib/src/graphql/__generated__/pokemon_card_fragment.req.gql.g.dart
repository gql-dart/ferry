// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNestedFragmentReq> _$gNestedFragmentReqSerializer =
    new _$GNestedFragmentReqSerializer();
Serializer<GPokemonCardReq> _$gPokemonCardReqSerializer =
    new _$GPokemonCardReqSerializer();

class _$GNestedFragmentReqSerializer
    implements StructuredSerializer<GNestedFragmentReq> {
  @override
  final Iterable<Type> types = const [GNestedFragmentReq, _$GNestedFragmentReq];
  @override
  final String wireName = 'GNestedFragmentReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNestedFragmentReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GNestedFragmentVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GNestedFragmentReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNestedFragmentReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GNestedFragmentVars))!
              as _i3.GNestedFragmentVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))!
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ]))! as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCardReqSerializer
    implements StructuredSerializer<GPokemonCardReq> {
  @override
  final Iterable<Type> types = const [GPokemonCardReq, _$GPokemonCardReq];
  @override
  final String wireName = 'GPokemonCardReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPokemonCardReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GPokemonCardVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPokemonCardReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonCardReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GPokemonCardVars))!
              as _i3.GPokemonCardVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))!
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ]))! as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GNestedFragmentReq extends GNestedFragmentReq {
  @override
  final _i3.GNestedFragmentVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GNestedFragmentReq(
          [void Function(GNestedFragmentReqBuilder)? updates]) =>
      (new GNestedFragmentReqBuilder()..update(updates))._build();

  _$GNestedFragmentReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GNestedFragmentReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GNestedFragmentReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GNestedFragmentReq', 'idFields');
  }

  @override
  GNestedFragmentReq rebuild(
          void Function(GNestedFragmentReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNestedFragmentReqBuilder toBuilder() =>
      new GNestedFragmentReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNestedFragmentReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, document.hashCode);
    _$hash = $jc(_$hash, fragmentName.hashCode);
    _$hash = $jc(_$hash, idFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GNestedFragmentReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GNestedFragmentReqBuilder
    implements Builder<GNestedFragmentReq, GNestedFragmentReqBuilder> {
  _$GNestedFragmentReq? _$v;

  _i3.GNestedFragmentVarsBuilder? _vars;
  _i3.GNestedFragmentVarsBuilder get vars =>
      _$this._vars ??= new _i3.GNestedFragmentVarsBuilder();
  set vars(_i3.GNestedFragmentVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GNestedFragmentReqBuilder() {
    GNestedFragmentReq._initializeBuilder(this);
  }

  GNestedFragmentReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNestedFragmentReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNestedFragmentReq;
  }

  @override
  void update(void Function(GNestedFragmentReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GNestedFragmentReq build() => _build();

  _$GNestedFragmentReq _build() {
    _$GNestedFragmentReq _$result;
    try {
      _$result = _$v ??
          new _$GNestedFragmentReq._(
            vars: vars.build(),
            document: BuiltValueNullFieldError.checkNotNull(
                document, r'GNestedFragmentReq', 'document'),
            fragmentName: fragmentName,
            idFields: BuiltValueNullFieldError.checkNotNull(
                idFields, r'GNestedFragmentReq', 'idFields'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GNestedFragmentReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCardReq extends GPokemonCardReq {
  @override
  final _i3.GPokemonCardVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GPokemonCardReq([void Function(GPokemonCardReqBuilder)? updates]) =>
      (new GPokemonCardReqBuilder()..update(updates))._build();

  _$GPokemonCardReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GPokemonCardReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GPokemonCardReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GPokemonCardReq', 'idFields');
  }

  @override
  GPokemonCardReq rebuild(void Function(GPokemonCardReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCardReqBuilder toBuilder() =>
      new GPokemonCardReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCardReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, document.hashCode);
    _$hash = $jc(_$hash, fragmentName.hashCode);
    _$hash = $jc(_$hash, idFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCardReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GPokemonCardReqBuilder
    implements Builder<GPokemonCardReq, GPokemonCardReqBuilder> {
  _$GPokemonCardReq? _$v;

  _i3.GPokemonCardVarsBuilder? _vars;
  _i3.GPokemonCardVarsBuilder get vars =>
      _$this._vars ??= new _i3.GPokemonCardVarsBuilder();
  set vars(_i3.GPokemonCardVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GPokemonCardReqBuilder() {
    GPokemonCardReq._initializeBuilder(this);
  }

  GPokemonCardReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCardReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonCardReq;
  }

  @override
  void update(void Function(GPokemonCardReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCardReq build() => _build();

  _$GPokemonCardReq _build() {
    _$GPokemonCardReq _$result;
    try {
      _$result = _$v ??
          new _$GPokemonCardReq._(
            vars: vars.build(),
            document: BuiltValueNullFieldError.checkNotNull(
                document, r'GPokemonCardReq', 'document'),
            fragmentName: fragmentName,
            idFields: BuiltValueNullFieldError.checkNotNull(
                idFields, r'GPokemonCardReq', 'idFields'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPokemonCardReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
