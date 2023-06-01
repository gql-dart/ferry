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
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroWithFragmentsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GHeroWithFragmentsData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroWithFragmentsVars))!
              as _i3.GHeroWithFragmentsVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation))! as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GHeroWithFragmentsData))!
              as _i2.GHeroWithFragmentsData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy?;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
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
  Iterable<Object?> serialize(Serializers serializers, GheroDataReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GheroDataVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i7.DocumentNode)),
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
  GheroDataReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroDataReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GheroDataVars))!
              as _i3.GheroDataVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i7.DocumentNode))!
              as _i7.DocumentNode;
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
  Iterable<Object?> serialize(
      Serializers serializers, GcomparisonFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GcomparisonFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i7.DocumentNode)),
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
  GcomparisonFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcomparisonFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GcomparisonFieldsVars))!
              as _i3.GcomparisonFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i7.DocumentNode))!
              as _i7.DocumentNode;
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

class _$GHeroWithFragmentsReq extends GHeroWithFragmentsReq {
  @override
  final _i3.GHeroWithFragmentsVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GHeroWithFragmentsData? Function(
      _i2.GHeroWithFragmentsData?, _i2.GHeroWithFragmentsData?)? updateResult;
  @override
  final _i2.GHeroWithFragmentsData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GHeroWithFragmentsReq(
          [void Function(GHeroWithFragmentsReqBuilder)? updates]) =>
      (new GHeroWithFragmentsReqBuilder()..update(updates))._build();

  _$GHeroWithFragmentsReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GHeroWithFragmentsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroWithFragmentsReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, r'GHeroWithFragmentsReq', 'executeOnListen');
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
    return (newBuiltValueToStringHelper(r'GHeroWithFragmentsReq')
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
  _$GHeroWithFragmentsReq? _$v;

  _i3.GHeroWithFragmentsVarsBuilder? _vars;
  _i3.GHeroWithFragmentsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWithFragmentsVarsBuilder();
  set vars(_i3.GHeroWithFragmentsVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GHeroWithFragmentsData? Function(
      _i2.GHeroWithFragmentsData?, _i2.GHeroWithFragmentsData?)? _updateResult;
  _i2.GHeroWithFragmentsData? Function(
          _i2.GHeroWithFragmentsData?, _i2.GHeroWithFragmentsData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GHeroWithFragmentsData? Function(
                  _i2.GHeroWithFragmentsData?, _i2.GHeroWithFragmentsData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GHeroWithFragmentsDataBuilder? _optimisticResponse;
  _i2.GHeroWithFragmentsDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GHeroWithFragmentsDataBuilder();
  set optimisticResponse(
          _i2.GHeroWithFragmentsDataBuilder? optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GHeroWithFragmentsReqBuilder() {
    GHeroWithFragmentsReq._initializeBuilder(this);
  }

  GHeroWithFragmentsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsReq;
  }

  @override
  void update(void Function(GHeroWithFragmentsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsReq build() => _build();

  _$GHeroWithFragmentsReq _build() {
    _$GHeroWithFragmentsReq _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroWithFragmentsReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  r'GHeroWithFragmentsReq',
                  'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithFragmentsReq', _$failedField, e.toString());
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
  final _i7.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GheroDataReq([void Function(GheroDataReqBuilder)? updates]) =>
      (new GheroDataReqBuilder()..update(updates))._build();

  _$GheroDataReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GheroDataReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GheroDataReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GheroDataReq', 'idFields');
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
    return (newBuiltValueToStringHelper(r'GheroDataReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GheroDataReqBuilder
    implements Builder<GheroDataReq, GheroDataReqBuilder> {
  _$GheroDataReq? _$v;

  _i3.GheroDataVarsBuilder? _vars;
  _i3.GheroDataVarsBuilder get vars =>
      _$this._vars ??= new _i3.GheroDataVarsBuilder();
  set vars(_i3.GheroDataVarsBuilder? vars) => _$this._vars = vars;

  _i7.DocumentNode? _document;
  _i7.DocumentNode? get document => _$this._document;
  set document(_i7.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GheroDataReqBuilder() {
    GheroDataReq._initializeBuilder(this);
  }

  GheroDataReqBuilder get _$this {
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
  void replace(GheroDataReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroDataReq;
  }

  @override
  void update(void Function(GheroDataReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroDataReq build() => _build();

  _$GheroDataReq _build() {
    _$GheroDataReq _$result;
    try {
      _$result = _$v ??
          new _$GheroDataReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GheroDataReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GheroDataReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GheroDataReq', _$failedField, e.toString());
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
  final _i7.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GcomparisonFieldsReq(
          [void Function(GcomparisonFieldsReqBuilder)? updates]) =>
      (new GcomparisonFieldsReqBuilder()..update(updates))._build();

  _$GcomparisonFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GcomparisonFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GcomparisonFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GcomparisonFieldsReq', 'idFields');
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
    return (newBuiltValueToStringHelper(r'GcomparisonFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GcomparisonFieldsReqBuilder
    implements Builder<GcomparisonFieldsReq, GcomparisonFieldsReqBuilder> {
  _$GcomparisonFieldsReq? _$v;

  _i3.GcomparisonFieldsVarsBuilder? _vars;
  _i3.GcomparisonFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GcomparisonFieldsVarsBuilder();
  set vars(_i3.GcomparisonFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i7.DocumentNode? _document;
  _i7.DocumentNode? get document => _$this._document;
  set document(_i7.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GcomparisonFieldsReqBuilder() {
    GcomparisonFieldsReq._initializeBuilder(this);
  }

  GcomparisonFieldsReqBuilder get _$this {
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
  void replace(GcomparisonFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcomparisonFieldsReq;
  }

  @override
  void update(void Function(GcomparisonFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GcomparisonFieldsReq build() => _build();

  _$GcomparisonFieldsReq _build() {
    _$GcomparisonFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GcomparisonFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GcomparisonFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GcomparisonFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GcomparisonFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
