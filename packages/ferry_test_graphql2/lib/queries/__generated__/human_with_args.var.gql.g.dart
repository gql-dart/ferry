// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_with_args.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GHumanWithArgsVars extends GHumanWithArgsVars {
  @override
  final String id;
  @override
  final _i1.Value<String>? friendsAfter;

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

  _i1.Value<String>? _friendsAfter;
  _i1.Value<String>? get friendsAfter => _$this._friendsAfter;
  set friendsAfter(_i1.Value<String>? friendsAfter) =>
      _$this._friendsAfter = friendsAfter;

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
            friendsAfter: friendsAfter);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
