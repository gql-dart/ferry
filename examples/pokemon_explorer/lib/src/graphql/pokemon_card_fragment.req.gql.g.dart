// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNestedFragment> _$gNestedFragmentSerializer =
    new _$GNestedFragmentSerializer();
Serializer<GPokemonCard> _$gPokemonCardSerializer =
    new _$GPokemonCardSerializer();

class _$GNestedFragmentSerializer
    implements StructuredSerializer<GNestedFragment> {
  @override
  final Iterable<Type> types = const [GNestedFragment, _$GNestedFragment];
  @override
  final String wireName = 'GNestedFragment';

  @override
  Iterable<Object> serialize(Serializers serializers, GNestedFragment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GNestedFragmentVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'fragmentName',
      serializers.serialize(object.fragmentName,
          specifiedType: const FullType(String)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  GNestedFragment deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNestedFragmentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GNestedFragmentVars))
              as _i3.GNestedFragmentVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCardSerializer implements StructuredSerializer<GPokemonCard> {
  @override
  final Iterable<Type> types = const [GPokemonCard, _$GPokemonCard];
  @override
  final String wireName = 'GPokemonCard';

  @override
  Iterable<Object> serialize(Serializers serializers, GPokemonCard object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GPokemonCardVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'fragmentName',
      serializers.serialize(object.fragmentName,
          specifiedType: const FullType(String)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  GPokemonCard deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonCardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GPokemonCardVars))
              as _i3.GPokemonCardVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GNestedFragment extends GNestedFragment {
  @override
  final _i3.GNestedFragmentVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GNestedFragment([void Function(GNestedFragmentBuilder) updates]) =>
      (new GNestedFragmentBuilder()..update(updates)).build();

  _$GNestedFragment._(
      {this.vars, this.document, this.fragmentName, this.idFields})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GNestedFragment', 'vars');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('GNestedFragment', 'document');
    }
    if (fragmentName == null) {
      throw new BuiltValueNullFieldError('GNestedFragment', 'fragmentName');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('GNestedFragment', 'idFields');
    }
  }

  @override
  GNestedFragment rebuild(void Function(GNestedFragmentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNestedFragmentBuilder toBuilder() =>
      new GNestedFragmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNestedFragment &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, vars.hashCode), document.hashCode),
            fragmentName.hashCode),
        idFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNestedFragment')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GNestedFragmentBuilder
    implements Builder<GNestedFragment, GNestedFragmentBuilder> {
  _$GNestedFragment _$v;

  _i3.GNestedFragmentVarsBuilder _vars;
  _i3.GNestedFragmentVarsBuilder get vars =>
      _$this._vars ??= new _i3.GNestedFragmentVarsBuilder();
  set vars(_i3.GNestedFragmentVarsBuilder vars) => _$this._vars = vars;

  _i5.DocumentNode _document;
  _i5.DocumentNode get document => _$this._document;
  set document(_i5.DocumentNode document) => _$this._document = document;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  GNestedFragmentBuilder() {
    GNestedFragment._initializeBuilder(this);
  }

  GNestedFragmentBuilder get _$this {
    if (_$v != null) {
      _vars = _$v.vars?.toBuilder();
      _document = _$v.document;
      _fragmentName = _$v.fragmentName;
      _idFields = _$v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNestedFragment other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GNestedFragment;
  }

  @override
  void update(void Function(GNestedFragmentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNestedFragment build() {
    _$GNestedFragment _$result;
    try {
      _$result = _$v ??
          new _$GNestedFragment._(
              vars: vars.build(),
              document: document,
              fragmentName: fragmentName,
              idFields: idFields);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GNestedFragment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCard extends GPokemonCard {
  @override
  final _i3.GPokemonCardVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GPokemonCard([void Function(GPokemonCardBuilder) updates]) =>
      (new GPokemonCardBuilder()..update(updates)).build();

  _$GPokemonCard._({this.vars, this.document, this.fragmentName, this.idFields})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GPokemonCard', 'vars');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('GPokemonCard', 'document');
    }
    if (fragmentName == null) {
      throw new BuiltValueNullFieldError('GPokemonCard', 'fragmentName');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('GPokemonCard', 'idFields');
    }
  }

  @override
  GPokemonCard rebuild(void Function(GPokemonCardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCardBuilder toBuilder() => new GPokemonCardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCard &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, vars.hashCode), document.hashCode),
            fragmentName.hashCode),
        idFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPokemonCard')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GPokemonCardBuilder
    implements Builder<GPokemonCard, GPokemonCardBuilder> {
  _$GPokemonCard _$v;

  _i3.GPokemonCardVarsBuilder _vars;
  _i3.GPokemonCardVarsBuilder get vars =>
      _$this._vars ??= new _i3.GPokemonCardVarsBuilder();
  set vars(_i3.GPokemonCardVarsBuilder vars) => _$this._vars = vars;

  _i5.DocumentNode _document;
  _i5.DocumentNode get document => _$this._document;
  set document(_i5.DocumentNode document) => _$this._document = document;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  GPokemonCardBuilder() {
    GPokemonCard._initializeBuilder(this);
  }

  GPokemonCardBuilder get _$this {
    if (_$v != null) {
      _vars = _$v.vars?.toBuilder();
      _document = _$v.document;
      _fragmentName = _$v.fragmentName;
      _idFields = _$v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCard other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPokemonCard;
  }

  @override
  void update(void Function(GPokemonCardBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPokemonCard build() {
    _$GPokemonCard _$result;
    try {
      _$result = _$v ??
          new _$GPokemonCard._(
              vars: vars.build(),
              document: document,
              fragmentName: fragmentName,
              idFields: idFields);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPokemonCard', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
