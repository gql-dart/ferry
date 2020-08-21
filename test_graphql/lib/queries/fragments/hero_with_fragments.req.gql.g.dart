// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragments> _$gHeroWithFragmentsSerializer =
    new _$GHeroWithFragmentsSerializer();
Serializer<GheroData> _$gheroDataSerializer = new _$GheroDataSerializer();
Serializer<GcomparisonFields> _$gcomparisonFieldsSerializer =
    new _$GcomparisonFieldsSerializer();

class _$GHeroWithFragmentsSerializer
    implements StructuredSerializer<GHeroWithFragments> {
  @override
  final Iterable<Type> types = const [GHeroWithFragments, _$GHeroWithFragments];
  @override
  final String wireName = 'GHeroWithFragments';

  @override
  Iterable<Object> serialize(Serializers serializers, GHeroWithFragments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroWithFragmentsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
    ];
    if (object.requestId != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(object.requestId,
            specifiedType: const FullType(String)));
    }
    if (object.optimisticResponse != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(object.optimisticResponse,
            specifiedType: const FullType(_i2.GHeroWithFragmentsData)));
    }
    if (object.updateCacheHandlerKey != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(object.updateCacheHandlerKey,
            specifiedType: const FullType(String)));
    }
    if (object.updateCacheHandlerContext != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(object.updateCacheHandlerContext,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    if (object.fetchPolicy != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(object.fetchPolicy,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GHeroWithFragments deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroWithFragmentsVars))
              as _i3.GHeroWithFragmentsVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation)) as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GHeroWithFragmentsData))
              as _i2.GHeroWithFragmentsData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroDataSerializer implements StructuredSerializer<GheroData> {
  @override
  final Iterable<Type> types = const [GheroData, _$GheroData];
  @override
  final String wireName = 'GheroData';

  @override
  Iterable<Object> serialize(Serializers serializers, GheroData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GheroDataVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i7.DocumentNode)),
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
  GheroData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GheroDataVars))
              as _i3.GheroDataVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i7.DocumentNode))
              as _i7.DocumentNode;
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

class _$GcomparisonFieldsSerializer
    implements StructuredSerializer<GcomparisonFields> {
  @override
  final Iterable<Type> types = const [GcomparisonFields, _$GcomparisonFields];
  @override
  final String wireName = 'GcomparisonFields';

  @override
  Iterable<Object> serialize(Serializers serializers, GcomparisonFields object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GcomparisonFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i7.DocumentNode)),
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
  GcomparisonFields deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GcomparisonFieldsVars))
              as _i3.GcomparisonFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i7.DocumentNode))
              as _i7.DocumentNode;
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

class _$GHeroWithFragments extends GHeroWithFragments {
  @override
  final _i3.GHeroWithFragmentsVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String requestId;
  @override
  final _i2.GHeroWithFragmentsData Function(
      _i2.GHeroWithFragmentsData, _i2.GHeroWithFragmentsData) updateResult;
  @override
  final _i2.GHeroWithFragmentsData optimisticResponse;
  @override
  final String updateCacheHandlerKey;
  @override
  final Map<String, dynamic> updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy fetchPolicy;

  factory _$GHeroWithFragments(
          [void Function(GHeroWithFragmentsBuilder) updates]) =>
      (new GHeroWithFragmentsBuilder()..update(updates)).build();

  _$GHeroWithFragments._(
      {this.vars,
      this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GHeroWithFragments', 'vars');
    }
    if (operation == null) {
      throw new BuiltValueNullFieldError('GHeroWithFragments', 'operation');
    }
  }

  @override
  GHeroWithFragments rebuild(
          void Function(GHeroWithFragmentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsBuilder toBuilder() =>
      new GHeroWithFragmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GHeroWithFragments &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, vars.hashCode), operation.hashCode),
                            requestId.hashCode),
                        updateResult.hashCode),
                    optimisticResponse.hashCode),
                updateCacheHandlerKey.hashCode),
            updateCacheHandlerContext.hashCode),
        fetchPolicy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroWithFragments')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy))
        .toString();
  }
}

class GHeroWithFragmentsBuilder
    implements Builder<GHeroWithFragments, GHeroWithFragmentsBuilder> {
  _$GHeroWithFragments _$v;

  _i3.GHeroWithFragmentsVarsBuilder _vars;
  _i3.GHeroWithFragmentsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWithFragmentsVarsBuilder();
  set vars(_i3.GHeroWithFragmentsVarsBuilder vars) => _$this._vars = vars;

  _i4.Operation _operation;
  _i4.Operation get operation => _$this._operation;
  set operation(_i4.Operation operation) => _$this._operation = operation;

  String _requestId;
  String get requestId => _$this._requestId;
  set requestId(String requestId) => _$this._requestId = requestId;

  _i2.GHeroWithFragmentsData Function(
      _i2.GHeroWithFragmentsData, _i2.GHeroWithFragmentsData) _updateResult;
  _i2.GHeroWithFragmentsData Function(
          _i2.GHeroWithFragmentsData, _i2.GHeroWithFragmentsData)
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GHeroWithFragmentsData Function(
                  _i2.GHeroWithFragmentsData, _i2.GHeroWithFragmentsData)
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GHeroWithFragmentsDataBuilder _optimisticResponse;
  _i2.GHeroWithFragmentsDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GHeroWithFragmentsDataBuilder();
  set optimisticResponse(
          _i2.GHeroWithFragmentsDataBuilder optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String _updateCacheHandlerKey;
  String get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic> _updateCacheHandlerContext;
  Map<String, dynamic> get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic> updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy _fetchPolicy;
  _i1.FetchPolicy get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  GHeroWithFragmentsBuilder() {
    GHeroWithFragments._initializeBuilder(this);
  }

  GHeroWithFragmentsBuilder get _$this {
    if (_$v != null) {
      _vars = _$v.vars?.toBuilder();
      _operation = _$v.operation;
      _requestId = _$v.requestId;
      _updateResult = _$v.updateResult;
      _optimisticResponse = _$v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = _$v.updateCacheHandlerKey;
      _updateCacheHandlerContext = _$v.updateCacheHandlerContext;
      _fetchPolicy = _$v.fetchPolicy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragments other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroWithFragments;
  }

  @override
  void update(void Function(GHeroWithFragmentsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragments build() {
    _$GHeroWithFragments _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragments._(
              vars: vars.build(),
              operation: operation,
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroWithFragments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GheroData extends GheroData {
  @override
  final _i3.GheroDataVars vars;
  @override
  final _i7.DocumentNode document;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GheroData([void Function(GheroDataBuilder) updates]) =>
      (new GheroDataBuilder()..update(updates)).build();

  _$GheroData._({this.vars, this.document, this.fragmentName, this.idFields})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GheroData', 'vars');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('GheroData', 'document');
    }
    if (fragmentName == null) {
      throw new BuiltValueNullFieldError('GheroData', 'fragmentName');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('GheroData', 'idFields');
    }
  }

  @override
  GheroData rebuild(void Function(GheroDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroDataBuilder toBuilder() => new GheroDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroData &&
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
    return (newBuiltValueToStringHelper('GheroData')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GheroDataBuilder implements Builder<GheroData, GheroDataBuilder> {
  _$GheroData _$v;

  _i3.GheroDataVarsBuilder _vars;
  _i3.GheroDataVarsBuilder get vars =>
      _$this._vars ??= new _i3.GheroDataVarsBuilder();
  set vars(_i3.GheroDataVarsBuilder vars) => _$this._vars = vars;

  _i7.DocumentNode _document;
  _i7.DocumentNode get document => _$this._document;
  set document(_i7.DocumentNode document) => _$this._document = document;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  GheroDataBuilder() {
    GheroData._initializeBuilder(this);
  }

  GheroDataBuilder get _$this {
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
  void replace(GheroData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GheroData;
  }

  @override
  void update(void Function(GheroDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GheroData build() {
    _$GheroData _$result;
    try {
      _$result = _$v ??
          new _$GheroData._(
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
            'GheroData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFields extends GcomparisonFields {
  @override
  final _i3.GcomparisonFieldsVars vars;
  @override
  final _i7.DocumentNode document;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GcomparisonFields(
          [void Function(GcomparisonFieldsBuilder) updates]) =>
      (new GcomparisonFieldsBuilder()..update(updates)).build();

  _$GcomparisonFields._(
      {this.vars, this.document, this.fragmentName, this.idFields})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GcomparisonFields', 'vars');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('GcomparisonFields', 'document');
    }
    if (fragmentName == null) {
      throw new BuiltValueNullFieldError('GcomparisonFields', 'fragmentName');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('GcomparisonFields', 'idFields');
    }
  }

  @override
  GcomparisonFields rebuild(void Function(GcomparisonFieldsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsBuilder toBuilder() =>
      new GcomparisonFieldsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFields &&
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
    return (newBuiltValueToStringHelper('GcomparisonFields')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GcomparisonFieldsBuilder
    implements Builder<GcomparisonFields, GcomparisonFieldsBuilder> {
  _$GcomparisonFields _$v;

  _i3.GcomparisonFieldsVarsBuilder _vars;
  _i3.GcomparisonFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GcomparisonFieldsVarsBuilder();
  set vars(_i3.GcomparisonFieldsVarsBuilder vars) => _$this._vars = vars;

  _i7.DocumentNode _document;
  _i7.DocumentNode get document => _$this._document;
  set document(_i7.DocumentNode document) => _$this._document = document;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  GcomparisonFieldsBuilder() {
    GcomparisonFields._initializeBuilder(this);
  }

  GcomparisonFieldsBuilder get _$this {
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
  void replace(GcomparisonFields other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GcomparisonFields;
  }

  @override
  void update(void Function(GcomparisonFieldsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcomparisonFields build() {
    _$GcomparisonFields _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFields._(
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
            'GcomparisonFields', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
