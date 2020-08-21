// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPokemon> _$gAllPokemonSerializer = new _$GAllPokemonSerializer();

class _$GAllPokemonSerializer implements StructuredSerializer<GAllPokemon> {
  @override
  final Iterable<Type> types = const [GAllPokemon, _$GAllPokemon];
  @override
  final String wireName = 'GAllPokemon';

  @override
  Iterable<Object> serialize(Serializers serializers, GAllPokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAllPokemonVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
    ];
    if (object.queryId != null) {
      result
        ..add('queryId')
        ..add(serializers.serialize(object.queryId,
            specifiedType: const FullType(String)));
    }
    if (object.optimisticResponse != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(object.optimisticResponse,
            specifiedType: const FullType(_i2.GAllPokemonData)));
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
  GAllPokemon deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GAllPokemonVars))
              as _i3.GAllPokemonVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation)) as _i4.Operation;
          break;
        case 'queryId':
          result.queryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GAllPokemonData))
              as _i2.GAllPokemonData);
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

class _$GAllPokemon extends GAllPokemon {
  @override
  final _i3.GAllPokemonVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String queryId;
  @override
  final _i2.GAllPokemonData Function(_i2.GAllPokemonData, _i2.GAllPokemonData)
      updateResult;
  @override
  final _i2.GAllPokemonData optimisticResponse;
  @override
  final String updateCacheHandlerKey;
  @override
  final Map<String, dynamic> updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy fetchPolicy;

  factory _$GAllPokemon([void Function(GAllPokemonBuilder) updates]) =>
      (new GAllPokemonBuilder()..update(updates)).build();

  _$GAllPokemon._(
      {this.vars,
      this.operation,
      this.queryId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy})
      : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GAllPokemon', 'vars');
    }
    if (operation == null) {
      throw new BuiltValueNullFieldError('GAllPokemon', 'operation');
    }
  }

  @override
  GAllPokemon rebuild(void Function(GAllPokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonBuilder toBuilder() => new GAllPokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GAllPokemon &&
        vars == other.vars &&
        operation == other.operation &&
        queryId == other.queryId &&
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
                            queryId.hashCode),
                        updateResult.hashCode),
                    optimisticResponse.hashCode),
                updateCacheHandlerKey.hashCode),
            updateCacheHandlerContext.hashCode),
        fetchPolicy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAllPokemon')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('queryId', queryId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy))
        .toString();
  }
}

class GAllPokemonBuilder implements Builder<GAllPokemon, GAllPokemonBuilder> {
  _$GAllPokemon _$v;

  _i3.GAllPokemonVarsBuilder _vars;
  _i3.GAllPokemonVarsBuilder get vars =>
      _$this._vars ??= new _i3.GAllPokemonVarsBuilder();
  set vars(_i3.GAllPokemonVarsBuilder vars) => _$this._vars = vars;

  _i4.Operation _operation;
  _i4.Operation get operation => _$this._operation;
  set operation(_i4.Operation operation) => _$this._operation = operation;

  String _queryId;
  String get queryId => _$this._queryId;
  set queryId(String queryId) => _$this._queryId = queryId;

  _i2.GAllPokemonData Function(_i2.GAllPokemonData, _i2.GAllPokemonData)
      _updateResult;
  _i2.GAllPokemonData Function(_i2.GAllPokemonData, _i2.GAllPokemonData)
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GAllPokemonData Function(_i2.GAllPokemonData, _i2.GAllPokemonData)
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GAllPokemonDataBuilder _optimisticResponse;
  _i2.GAllPokemonDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GAllPokemonDataBuilder();
  set optimisticResponse(_i2.GAllPokemonDataBuilder optimisticResponse) =>
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

  GAllPokemonBuilder() {
    GAllPokemon._initializeBuilder(this);
  }

  GAllPokemonBuilder get _$this {
    if (_$v != null) {
      _vars = _$v.vars?.toBuilder();
      _operation = _$v.operation;
      _queryId = _$v.queryId;
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
  void replace(GAllPokemon other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAllPokemon;
  }

  @override
  void update(void Function(GAllPokemonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAllPokemon build() {
    _$GAllPokemon _$result;
    try {
      _$result = _$v ??
          new _$GAllPokemon._(
              vars: vars.build(),
              operation: operation,
              queryId: queryId,
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
            'GAllPokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
