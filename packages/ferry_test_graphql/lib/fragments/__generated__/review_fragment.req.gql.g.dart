// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewFragmentReq> _$gReviewFragmentReqSerializer =
    new _$GReviewFragmentReqSerializer();

class _$GReviewFragmentReqSerializer
    implements StructuredSerializer<GReviewFragmentReq> {
  @override
  final Iterable<Type> types = const [GReviewFragmentReq, _$GReviewFragmentReq];
  @override
  final String wireName = 'GReviewFragmentReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReviewFragmentReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GReviewFragmentVars)),
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
    value = object.cacheDeduplicationStrategy;
    if (value != null) {
      result
        ..add('cacheDeduplicationStrategy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.CacheDeduplicationStrategy)));
    }
    return result;
  }

  @override
  GReviewFragmentReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewFragmentReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GReviewFragmentVars))!
              as _i3.GReviewFragmentVars);
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
        case 'cacheDeduplicationStrategy':
          result.cacheDeduplicationStrategy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.CacheDeduplicationStrategy))
              as _i1.CacheDeduplicationStrategy?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewFragmentReq extends GReviewFragmentReq {
  @override
  final _i3.GReviewFragmentVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;
  @override
  final _i1.CacheDeduplicationStrategy? cacheDeduplicationStrategy;

  factory _$GReviewFragmentReq(
          [void Function(GReviewFragmentReqBuilder)? updates]) =>
      (new GReviewFragmentReqBuilder()..update(updates))._build();

  _$GReviewFragmentReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields,
      this.cacheDeduplicationStrategy})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GReviewFragmentReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GReviewFragmentReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GReviewFragmentReq', 'idFields');
  }

  @override
  GReviewFragmentReq rebuild(
          void Function(GReviewFragmentReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewFragmentReqBuilder toBuilder() =>
      new GReviewFragmentReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewFragmentReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields &&
        cacheDeduplicationStrategy == other.cacheDeduplicationStrategy;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, vars.hashCode), document.hashCode),
                fragmentName.hashCode),
            idFields.hashCode),
        cacheDeduplicationStrategy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewFragmentReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields)
          ..add('cacheDeduplicationStrategy', cacheDeduplicationStrategy))
        .toString();
  }
}

class GReviewFragmentReqBuilder
    implements Builder<GReviewFragmentReq, GReviewFragmentReqBuilder> {
  _$GReviewFragmentReq? _$v;

  _i3.GReviewFragmentVarsBuilder? _vars;
  _i3.GReviewFragmentVarsBuilder get vars =>
      _$this._vars ??= new _i3.GReviewFragmentVarsBuilder();
  set vars(_i3.GReviewFragmentVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  _i1.CacheDeduplicationStrategy? _cacheDeduplicationStrategy;
  _i1.CacheDeduplicationStrategy? get cacheDeduplicationStrategy =>
      _$this._cacheDeduplicationStrategy;
  set cacheDeduplicationStrategy(
          _i1.CacheDeduplicationStrategy? cacheDeduplicationStrategy) =>
      _$this._cacheDeduplicationStrategy = cacheDeduplicationStrategy;

  GReviewFragmentReqBuilder() {
    GReviewFragmentReq._initializeBuilder(this);
  }

  GReviewFragmentReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _cacheDeduplicationStrategy = $v.cacheDeduplicationStrategy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewFragmentReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewFragmentReq;
  }

  @override
  void update(void Function(GReviewFragmentReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewFragmentReq build() => _build();

  _$GReviewFragmentReq _build() {
    _$GReviewFragmentReq _$result;
    try {
      _$result = _$v ??
          new _$GReviewFragmentReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GReviewFragmentReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GReviewFragmentReq', 'idFields'),
              cacheDeduplicationStrategy: cacheDeduplicationStrategy);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewFragmentReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
