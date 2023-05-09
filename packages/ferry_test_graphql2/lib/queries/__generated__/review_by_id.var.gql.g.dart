// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_by_id.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GReviewsByIDVars extends GReviewsByIDVars {
  @override
  final String id;

  factory _$GReviewsByIDVars(
          [void Function(GReviewsByIDVarsBuilder)? updates]) =>
      (new GReviewsByIDVarsBuilder()..update(updates))._build();

  _$GReviewsByIDVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GReviewsByIDVars', 'id');
  }

  @override
  GReviewsByIDVars rebuild(void Function(GReviewsByIDVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsByIDVarsBuilder toBuilder() =>
      new GReviewsByIDVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsByIDVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GReviewsByIDVars')..add('id', id))
        .toString();
  }
}

class GReviewsByIDVarsBuilder
    implements Builder<GReviewsByIDVars, GReviewsByIDVarsBuilder> {
  _$GReviewsByIDVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GReviewsByIDVarsBuilder();

  GReviewsByIDVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsByIDVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsByIDVars;
  }

  @override
  void update(void Function(GReviewsByIDVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewsByIDVars build() => _build();

  _$GReviewsByIDVars _build() {
    final _$result = _$v ??
        new _$GReviewsByIDVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GReviewsByIDVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
