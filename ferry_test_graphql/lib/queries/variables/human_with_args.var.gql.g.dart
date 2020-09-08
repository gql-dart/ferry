// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_with_args.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanWithArgsVars> _$gHumanWithArgsVarsSerializer =
    new _$GHumanWithArgsVarsSerializer();

class _$GHumanWithArgsVarsSerializer
    implements StructuredSerializer<GHumanWithArgsVars> {
  @override
  final Iterable<Type> types = const [GHumanWithArgsVars, _$GHumanWithArgsVars];
  @override
  final String wireName = 'GHumanWithArgsVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GHumanWithArgsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.friendsAfter != null) {
      result
        ..add('friendsAfter')
        ..add(serializers.serialize(object.friendsAfter,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GHumanWithArgsVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsVarsBuilder();

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
        case 'friendsAfter':
          result.friendsAfter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsVars extends GHumanWithArgsVars {
  @override
  final String id;
  @override
  final String friendsAfter;

  factory _$GHumanWithArgsVars(
          [void Function(GHumanWithArgsVarsBuilder) updates]) =>
      (new GHumanWithArgsVarsBuilder()..update(updates)).build();

  _$GHumanWithArgsVars._({this.id, this.friendsAfter}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('GHumanWithArgsVars', 'id');
    }
  }

  @override
  GHumanWithArgsVars rebuild(
          void Function(GHumanWithArgsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsVarsBuilder toBuilder() =>
      new GHumanWithArgsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsVars &&
        id == other.id &&
        friendsAfter == other.friendsAfter;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), friendsAfter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHumanWithArgsVars')
          ..add('id', id)
          ..add('friendsAfter', friendsAfter))
        .toString();
  }
}

class GHumanWithArgsVarsBuilder
    implements Builder<GHumanWithArgsVars, GHumanWithArgsVarsBuilder> {
  _$GHumanWithArgsVars _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _friendsAfter;
  String get friendsAfter => _$this._friendsAfter;
  set friendsAfter(String friendsAfter) => _$this._friendsAfter = friendsAfter;

  GHumanWithArgsVarsBuilder();

  GHumanWithArgsVarsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _friendsAfter = _$v.friendsAfter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHumanWithArgsVars;
  }

  @override
  void update(void Function(GHumanWithArgsVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHumanWithArgsVars build() {
    final _$result =
        _$v ?? new _$GHumanWithArgsVars._(id: id, friendsAfter: friendsAfter);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
