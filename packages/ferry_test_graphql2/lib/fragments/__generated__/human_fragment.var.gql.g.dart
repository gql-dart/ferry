// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanFragmentVars> _$gHumanFragmentVarsSerializer =
    new _$GHumanFragmentVarsSerializer();

class _$GHumanFragmentVarsSerializer
    implements StructuredSerializer<GHumanFragmentVars> {
  @override
  final Iterable<Type> types = const [GHumanFragmentVars, _$GHumanFragmentVars];
  @override
  final String wireName = 'GHumanFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.after;
    if (value != null) {
      result
        ..add('after')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GHumanFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanFragmentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanFragmentVars extends GHumanFragmentVars {
  @override
  final String? after;

  factory _$GHumanFragmentVars(
          [void Function(GHumanFragmentVarsBuilder)? updates]) =>
      (new GHumanFragmentVarsBuilder()..update(updates))._build();

  _$GHumanFragmentVars._({this.after}) : super._();

  @override
  GHumanFragmentVars rebuild(
          void Function(GHumanFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanFragmentVarsBuilder toBuilder() =>
      new GHumanFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanFragmentVars && after == other.after;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, after.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanFragmentVars')
          ..add('after', after))
        .toString();
  }
}

class GHumanFragmentVarsBuilder
    implements Builder<GHumanFragmentVars, GHumanFragmentVarsBuilder> {
  _$GHumanFragmentVars? _$v;

  String? _after;
  String? get after => _$this._after;
  set after(String? after) => _$this._after = after;

  GHumanFragmentVarsBuilder();

  GHumanFragmentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _after = $v.after;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanFragmentVars;
  }

  @override
  void update(void Function(GHumanFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanFragmentVars build() => _build();

  _$GHumanFragmentVars _build() {
    final _$result = _$v ?? new _$GHumanFragmentVars._(after: after);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
