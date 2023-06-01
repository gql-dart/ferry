// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_inline_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroForEpisodeReq> _$gHeroForEpisodeReqSerializer =
    new _$GHeroForEpisodeReqSerializer();
Serializer<GDroidFragmentReq> _$gDroidFragmentReqSerializer =
    new _$GDroidFragmentReqSerializer();

class _$GHeroForEpisodeReqSerializer
    implements StructuredSerializer<GHeroForEpisodeReq> {
  @override
  final Iterable<Type> types = const [GHeroForEpisodeReq, _$GHeroForEpisodeReq];
  @override
  final String wireName = 'GHeroForEpisodeReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroForEpisodeReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroForEpisodeVars)),
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
            specifiedType: const FullType(_i2.GHeroForEpisodeData)));
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
  GHeroForEpisodeReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroForEpisodeReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroForEpisodeVars))!
              as _i3.GHeroForEpisodeVars);
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
                  specifiedType: const FullType(_i2.GHeroForEpisodeData))!
              as _i2.GHeroForEpisodeData);
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

class _$GDroidFragmentReqSerializer
    implements StructuredSerializer<GDroidFragmentReq> {
  @override
  final Iterable<Type> types = const [GDroidFragmentReq, _$GDroidFragmentReq];
  @override
  final String wireName = 'GDroidFragmentReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDroidFragmentReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GDroidFragmentVars)),
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
  GDroidFragmentReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDroidFragmentReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GDroidFragmentVars))!
              as _i3.GDroidFragmentVars);
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

class _$GHeroForEpisodeReq extends GHeroForEpisodeReq {
  @override
  final _i3.GHeroForEpisodeVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GHeroForEpisodeData? Function(
      _i2.GHeroForEpisodeData?, _i2.GHeroForEpisodeData?)? updateResult;
  @override
  final _i2.GHeroForEpisodeData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GHeroForEpisodeReq(
          [void Function(GHeroForEpisodeReqBuilder)? updates]) =>
      (new GHeroForEpisodeReqBuilder()..update(updates))._build();

  _$GHeroForEpisodeReq._(
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
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroForEpisodeReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroForEpisodeReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, r'GHeroForEpisodeReq', 'executeOnListen');
  }

  @override
  GHeroForEpisodeReq rebuild(
          void Function(GHeroForEpisodeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroForEpisodeReqBuilder toBuilder() =>
      new GHeroForEpisodeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GHeroForEpisodeReq &&
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
    return (newBuiltValueToStringHelper(r'GHeroForEpisodeReq')
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

class GHeroForEpisodeReqBuilder
    implements Builder<GHeroForEpisodeReq, GHeroForEpisodeReqBuilder> {
  _$GHeroForEpisodeReq? _$v;

  _i3.GHeroForEpisodeVarsBuilder? _vars;
  _i3.GHeroForEpisodeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroForEpisodeVarsBuilder();
  set vars(_i3.GHeroForEpisodeVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GHeroForEpisodeData? Function(
      _i2.GHeroForEpisodeData?, _i2.GHeroForEpisodeData?)? _updateResult;
  _i2.GHeroForEpisodeData? Function(
          _i2.GHeroForEpisodeData?, _i2.GHeroForEpisodeData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GHeroForEpisodeData? Function(
                  _i2.GHeroForEpisodeData?, _i2.GHeroForEpisodeData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GHeroForEpisodeDataBuilder? _optimisticResponse;
  _i2.GHeroForEpisodeDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GHeroForEpisodeDataBuilder();
  set optimisticResponse(_i2.GHeroForEpisodeDataBuilder? optimisticResponse) =>
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

  GHeroForEpisodeReqBuilder() {
    GHeroForEpisodeReq._initializeBuilder(this);
  }

  GHeroForEpisodeReqBuilder get _$this {
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
  void replace(GHeroForEpisodeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroForEpisodeReq;
  }

  @override
  void update(void Function(GHeroForEpisodeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroForEpisodeReq build() => _build();

  _$GHeroForEpisodeReq _build() {
    _$GHeroForEpisodeReq _$result;
    try {
      _$result = _$v ??
          new _$GHeroForEpisodeReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroForEpisodeReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, r'GHeroForEpisodeReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroForEpisodeReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDroidFragmentReq extends GDroidFragmentReq {
  @override
  final _i3.GDroidFragmentVars vars;
  @override
  final _i7.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GDroidFragmentReq(
          [void Function(GDroidFragmentReqBuilder)? updates]) =>
      (new GDroidFragmentReqBuilder()..update(updates))._build();

  _$GDroidFragmentReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GDroidFragmentReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GDroidFragmentReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GDroidFragmentReq', 'idFields');
  }

  @override
  GDroidFragmentReq rebuild(void Function(GDroidFragmentReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDroidFragmentReqBuilder toBuilder() =>
      new GDroidFragmentReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDroidFragmentReq &&
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
    return (newBuiltValueToStringHelper(r'GDroidFragmentReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GDroidFragmentReqBuilder
    implements Builder<GDroidFragmentReq, GDroidFragmentReqBuilder> {
  _$GDroidFragmentReq? _$v;

  _i3.GDroidFragmentVarsBuilder? _vars;
  _i3.GDroidFragmentVarsBuilder get vars =>
      _$this._vars ??= new _i3.GDroidFragmentVarsBuilder();
  set vars(_i3.GDroidFragmentVarsBuilder? vars) => _$this._vars = vars;

  _i7.DocumentNode? _document;
  _i7.DocumentNode? get document => _$this._document;
  set document(_i7.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GDroidFragmentReqBuilder() {
    GDroidFragmentReq._initializeBuilder(this);
  }

  GDroidFragmentReqBuilder get _$this {
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
  void replace(GDroidFragmentReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDroidFragmentReq;
  }

  @override
  void update(void Function(GDroidFragmentReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDroidFragmentReq build() => _build();

  _$GDroidFragmentReq _build() {
    _$GDroidFragmentReq _$result;
    try {
      _$result = _$v ??
          new _$GDroidFragmentReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GDroidFragmentReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GDroidFragmentReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDroidFragmentReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
