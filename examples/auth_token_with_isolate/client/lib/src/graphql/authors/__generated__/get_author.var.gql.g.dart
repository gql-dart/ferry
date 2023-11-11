// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_author.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAuthorByIdVars> _$gGetAuthorByIdVarsSerializer =
    new _$GGetAuthorByIdVarsSerializer();

class _$GGetAuthorByIdVarsSerializer
    implements StructuredSerializer<GGetAuthorByIdVars> {
  @override
  final Iterable<Type> types = const [GGetAuthorByIdVars, _$GGetAuthorByIdVars];
  @override
  final String wireName = 'GGetAuthorByIdVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorByIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetAuthorByIdVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorByIdVarsBuilder();

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

class _$GGetAuthorByIdVars extends GGetAuthorByIdVars {
  @override
  final String id;

  factory _$GGetAuthorByIdVars(
          [void Function(GGetAuthorByIdVarsBuilder)? updates]) =>
      (new GGetAuthorByIdVarsBuilder()..update(updates))._build();

  _$GGetAuthorByIdVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GGetAuthorByIdVars', 'id');
  }

  @override
  GGetAuthorByIdVars rebuild(
          void Function(GGetAuthorByIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorByIdVarsBuilder toBuilder() =>
      new GGetAuthorByIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorByIdVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGetAuthorByIdVars')..add('id', id))
        .toString();
  }
}

class GGetAuthorByIdVarsBuilder
    implements Builder<GGetAuthorByIdVars, GGetAuthorByIdVarsBuilder> {
  _$GGetAuthorByIdVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetAuthorByIdVarsBuilder();

  GGetAuthorByIdVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorByIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorByIdVars;
  }

  @override
  void update(void Function(GGetAuthorByIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorByIdVars build() => _build();

  _$GGetAuthorByIdVars _build() {
    final _$result = _$v ??
        new _$GGetAuthorByIdVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetAuthorByIdVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
