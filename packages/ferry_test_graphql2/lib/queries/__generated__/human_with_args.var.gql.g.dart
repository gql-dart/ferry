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
  Iterable<Object?> serialize(
      Serializers serializers, GHumanWithArgsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.friendsAfter;
    if (value != null) {
      result
        ..add('friendsAfter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GHumanWithArgsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsVarsBuilder();

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
        case 'friendsAfter':
          result.friendsAfter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  final String? friendsAfter;

  factory _$GHumanWithArgsVars(
          [void Function(GHumanWithArgsVarsBuilder)? updates]) =>
      (new GHumanWithArgsVarsBuilder()..update(updates))._build();

  _$GHumanWithArgsVars._({required this.id, this.friendsAfter}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GHumanWithArgsVars', 'id');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, friendsAfter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanWithArgsVars')
          ..add('id', id)
          ..add('friendsAfter', friendsAfter))
        .toString();
  }
}

class GHumanWithArgsVarsBuilder
    implements Builder<GHumanWithArgsVars, GHumanWithArgsVarsBuilder> {
  _$GHumanWithArgsVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _friendsAfter;
  String? get friendsAfter => _$this._friendsAfter;
  set friendsAfter(String? friendsAfter) => _$this._friendsAfter = friendsAfter;

  GHumanWithArgsVarsBuilder();

  GHumanWithArgsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _friendsAfter = $v.friendsAfter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgsVars;
  }

  @override
  void update(void Function(GHumanWithArgsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanWithArgsVars build() => _build();

  _$GHumanWithArgsVars _build() {
    final _$result = _$v ??
        new _$GHumanWithArgsVars._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GHumanWithArgsVars', 'id'),
          friendsAfter: friendsAfter,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
