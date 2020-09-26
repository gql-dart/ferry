// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragmentsReq> _$gHeroWithFragmentsReqSerializer =
    new _$GHeroWithFragmentsReqSerializer();
Serializer<GheroDataReq> _$gheroDataReqSerializer =
    new _$GheroDataReqSerializer();
Serializer<GcomparisonFieldsReq> _$gcomparisonFieldsReqSerializer =
    new _$GcomparisonFieldsReqSerializer();

class _$GHeroWithFragmentsReqSerializer
    implements StructuredSerializer<GHeroWithFragmentsReq> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsReq,
    _$GHeroWithFragmentsReq
  ];
  @override
  final String wireName = 'GHeroWithFragmentsReq';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GHeroWithFragmentsReq object,
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
    if (object.executeOnListen != null) {
      result
        ..add('executeOnListen')
        ..add(serializers.serialize(object.executeOnListen,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsReq deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsReqBuilder();

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
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroDataReqSerializer implements StructuredSerializer<GheroDataReq> {
  @override
  final Iterable<Type> types = const [GheroDataReq, _$GheroDataReq];
  @override
  final String wireName = 'GheroDataReq';

  @override
  Iterable<Object> serialize(Serializers serializers, GheroDataReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GheroDataVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i8.DocumentNode)),
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
  GheroDataReq deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroDataReqBuilder();

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
                  specifiedType: const FullType(_i8.DocumentNode))
              as _i8.DocumentNode;
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

class _$GcomparisonFieldsReqSerializer
    implements StructuredSerializer<GcomparisonFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GcomparisonFieldsReq,
    _$GcomparisonFieldsReq
  ];
  @override
  final String wireName = 'GcomparisonFieldsReq';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GcomparisonFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GcomparisonFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i8.DocumentNode)),
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
  GcomparisonFieldsReq deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsReqBuilder();

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
                  specifiedType: const FullType(_i8.DocumentNode))
              as _i8.DocumentNode;
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

class _$GHeroWithFragmentsReq extends GHeroWithFragmentsReq {
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
  @override
  final bool executeOnListen;

  factory _$GHeroWithFragmentsReq(
          [void Function(GHeroWithFragmentsReqBuilder) updates]) =>
      (new GHeroWithFragmentsReqBuilder()..update(updates)).build();

  _$GHeroWithFragmentsReq._(
      {this.vars,
      this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      this.executeOnListen})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GHeroWithFragmentsReq', 'vars');
    }
    if (operation == null) {
      throw new BuiltValueNullFieldError('GHeroWithFragmentsReq', 'operation');
    }
  }

  @override
  GHeroWithFragmentsReq rebuild(
          void Function(GHeroWithFragmentsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsReqBuilder toBuilder() =>
      new GHeroWithFragmentsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GHeroWithFragmentsReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
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
            fetchPolicy.hashCode),
        executeOnListen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroWithFragmentsReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen))
        .toString();
  }
}

class GHeroWithFragmentsReqBuilder
    implements Builder<GHeroWithFragmentsReq, GHeroWithFragmentsReqBuilder> {
  _$GHeroWithFragmentsReq _$v;

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

  bool _executeOnListen;
  bool get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GHeroWithFragmentsReqBuilder() {
    GHeroWithFragmentsReq._initializeBuilder(this);
  }

  GHeroWithFragmentsReqBuilder get _$this {
    if (_$v != null) {
      _vars = _$v.vars?.toBuilder();
      _operation = _$v.operation;
      _requestId = _$v.requestId;
      _updateResult = _$v.updateResult;
      _optimisticResponse = _$v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = _$v.updateCacheHandlerKey;
      _updateCacheHandlerContext = _$v.updateCacheHandlerContext;
      _fetchPolicy = _$v.fetchPolicy;
      _executeOnListen = _$v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsReq other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHeroWithFragmentsReq;
  }

  @override
  void update(void Function(GHeroWithFragmentsReqBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragmentsReq build() {
    _$GHeroWithFragmentsReq _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsReq._(
              vars: vars.build(),
              operation: operation,
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: executeOnListen);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroWithFragmentsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GheroDataReq extends GheroDataReq {
  @override
  final _i3.GheroDataVars vars;
  @override
  final _i8.DocumentNode document;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GheroDataReq([void Function(GheroDataReqBuilder) updates]) =>
      (new GheroDataReqBuilder()..update(updates)).build();

  _$GheroDataReq._({this.vars, this.document, this.fragmentName, this.idFields})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GheroDataReq', 'vars');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('GheroDataReq', 'document');
    }
    if (fragmentName == null) {
      throw new BuiltValueNullFieldError('GheroDataReq', 'fragmentName');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('GheroDataReq', 'idFields');
    }
  }

  @override
  GheroDataReq rebuild(void Function(GheroDataReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroDataReqBuilder toBuilder() => new GheroDataReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroDataReq &&
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
    return (newBuiltValueToStringHelper('GheroDataReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GheroDataReqBuilder
    implements Builder<GheroDataReq, GheroDataReqBuilder> {
  _$GheroDataReq _$v;

  _i3.GheroDataVarsBuilder _vars;
  _i3.GheroDataVarsBuilder get vars =>
      _$this._vars ??= new _i3.GheroDataVarsBuilder();
  set vars(_i3.GheroDataVarsBuilder vars) => _$this._vars = vars;

  _i8.DocumentNode _document;
  _i8.DocumentNode get document => _$this._document;
  set document(_i8.DocumentNode document) => _$this._document = document;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  GheroDataReqBuilder() {
    GheroDataReq._initializeBuilder(this);
  }

  GheroDataReqBuilder get _$this {
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
  void replace(GheroDataReq other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GheroDataReq;
  }

  @override
  void update(void Function(GheroDataReqBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GheroDataReq build() {
    _$GheroDataReq _$result;
    try {
      _$result = _$v ??
          new _$GheroDataReq._(
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
            'GheroDataReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFieldsReq extends GcomparisonFieldsReq {
  @override
  final _i3.GcomparisonFieldsVars vars;
  @override
  final _i8.DocumentNode document;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GcomparisonFieldsReq(
          [void Function(GcomparisonFieldsReqBuilder) updates]) =>
      (new GcomparisonFieldsReqBuilder()..update(updates)).build();

  _$GcomparisonFieldsReq._(
      {this.vars, this.document, this.fragmentName, this.idFields})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GcomparisonFieldsReq', 'vars');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('GcomparisonFieldsReq', 'document');
    }
    if (fragmentName == null) {
      throw new BuiltValueNullFieldError(
          'GcomparisonFieldsReq', 'fragmentName');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('GcomparisonFieldsReq', 'idFields');
    }
  }

  @override
  GcomparisonFieldsReq rebuild(
          void Function(GcomparisonFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsReqBuilder toBuilder() =>
      new GcomparisonFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFieldsReq &&
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
    return (newBuiltValueToStringHelper('GcomparisonFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GcomparisonFieldsReqBuilder
    implements Builder<GcomparisonFieldsReq, GcomparisonFieldsReqBuilder> {
  _$GcomparisonFieldsReq _$v;

  _i3.GcomparisonFieldsVarsBuilder _vars;
  _i3.GcomparisonFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GcomparisonFieldsVarsBuilder();
  set vars(_i3.GcomparisonFieldsVarsBuilder vars) => _$this._vars = vars;

  _i8.DocumentNode _document;
  _i8.DocumentNode get document => _$this._document;
  set document(_i8.DocumentNode document) => _$this._document = document;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  GcomparisonFieldsReqBuilder() {
    GcomparisonFieldsReq._initializeBuilder(this);
  }

  GcomparisonFieldsReqBuilder get _$this {
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
  void replace(GcomparisonFieldsReq other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GcomparisonFieldsReq;
  }

  @override
  void update(void Function(GcomparisonFieldsReqBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcomparisonFieldsReq build() {
    _$GcomparisonFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsReq._(
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
            'GcomparisonFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
