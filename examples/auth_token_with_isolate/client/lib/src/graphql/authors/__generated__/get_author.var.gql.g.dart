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
    return $jf($jc(0, id.hashCode));
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
