// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_from_external_schema.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanQueryVars> _$gHumanQueryVarsSerializer =
    new _$GHumanQueryVarsSerializer();
Serializer<GHumanFragVars> _$gHumanFragVarsSerializer =
    new _$GHumanFragVarsSerializer();

class _$GHumanQueryVarsSerializer
    implements StructuredSerializer<GHumanQueryVars> {
  @override
  final Iterable<Type> types = const [GHumanQueryVars, _$GHumanQueryVars];
  @override
  final String wireName = 'GHumanQueryVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHumanQueryVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHumanQueryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanQueryVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanFragVarsSerializer
    implements StructuredSerializer<GHumanFragVars> {
  @override
  final Iterable<Type> types = const [GHumanFragVars, _$GHumanFragVars];
  @override
  final String wireName = 'GHumanFragVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHumanFragVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GHumanFragVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHumanFragVarsBuilder().build();
  }
}

class _$GHumanQueryVars extends GHumanQueryVars {
  @override
  final String id;

  factory _$GHumanQueryVars([void Function(GHumanQueryVarsBuilder)? updates]) =>
      (new GHumanQueryVarsBuilder()..update(updates))._build();

  _$GHumanQueryVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GHumanQueryVars', 'id');
  }

  @override
  GHumanQueryVars rebuild(void Function(GHumanQueryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanQueryVarsBuilder toBuilder() =>
      new GHumanQueryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanQueryVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanQueryVars')..add('id', id))
        .toString();
  }
}

class GHumanQueryVarsBuilder
    implements Builder<GHumanQueryVars, GHumanQueryVarsBuilder> {
  _$GHumanQueryVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GHumanQueryVarsBuilder();

  GHumanQueryVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanQueryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanQueryVars;
  }

  @override
  void update(void Function(GHumanQueryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanQueryVars build() => _build();

  _$GHumanQueryVars _build() {
    final _$result = _$v ??
        new _$GHumanQueryVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHumanQueryVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$GHumanFragVars extends GHumanFragVars {
  factory _$GHumanFragVars([void Function(GHumanFragVarsBuilder)? updates]) =>
      (new GHumanFragVarsBuilder()..update(updates))._build();

  _$GHumanFragVars._() : super._();

  @override
  GHumanFragVars rebuild(void Function(GHumanFragVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanFragVarsBuilder toBuilder() =>
      new GHumanFragVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanFragVars;
  }

  @override
  int get hashCode {
    return 709002141;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHumanFragVars').toString();
  }
}

class GHumanFragVarsBuilder
    implements Builder<GHumanFragVars, GHumanFragVarsBuilder> {
  _$GHumanFragVars? _$v;

  GHumanFragVarsBuilder();

  @override
  void replace(GHumanFragVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanFragVars;
  }

  @override
  void update(void Function(GHumanFragVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanFragVars build() => _build();

  _$GHumanFragVars _build() {
    final _$result = _$v ?? new _$GHumanFragVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
