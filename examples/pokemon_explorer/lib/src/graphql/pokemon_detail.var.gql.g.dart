// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetailVars> _$gPokemonDetailVarsSerializer =
    new _$GPokemonDetailVarsSerializer();

class _$GPokemonDetailVarsSerializer
    implements StructuredSerializer<GPokemonDetailVars> {
  @override
  final Iterable<Type> types = const [GPokemonDetailVars, _$GPokemonDetailVars];
  @override
  final String wireName = 'GPokemonDetailVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GPokemonDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPokemonDetailVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailVars extends GPokemonDetailVars {
  @override
  final String id;

  factory _$GPokemonDetailVars(
          [void Function(GPokemonDetailVarsBuilder) updates]) =>
      (new GPokemonDetailVarsBuilder()..update(updates)).build();

  _$GPokemonDetailVars._({this.id}) : super._();

  @override
  GPokemonDetailVars rebuild(
          void Function(GPokemonDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailVarsBuilder toBuilder() =>
      new GPokemonDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailVars && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPokemonDetailVars')..add('id', id))
        .toString();
  }
}

class GPokemonDetailVarsBuilder
    implements Builder<GPokemonDetailVars, GPokemonDetailVarsBuilder> {
  _$GPokemonDetailVars _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  GPokemonDetailVarsBuilder();

  GPokemonDetailVarsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPokemonDetailVars;
  }

  @override
  void update(void Function(GPokemonDetailVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPokemonDetailVars build() {
    final _$result = _$v ?? new _$GPokemonDetailVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
