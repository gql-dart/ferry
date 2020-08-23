// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_with_args.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanWithArgsData> _$gHumanWithArgsDataSerializer =
    new _$GHumanWithArgsDataSerializer();
Serializer<GHumanWithArgsData_human> _$gHumanWithArgsDataHumanSerializer =
    new _$GHumanWithArgsData_humanSerializer();

class _$GHumanWithArgsDataSerializer
    implements StructuredSerializer<GHumanWithArgsData> {
  @override
  final Iterable<Type> types = const [GHumanWithArgsData, _$GHumanWithArgsData];
  @override
  final String wireName = 'GHumanWithArgsData';

  @override
  Iterable<Object> serialize(Serializers serializers, GHumanWithArgsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.human != null) {
      result
        ..add('human')
        ..add(serializers.serialize(object.human,
            specifiedType: const FullType(GHumanWithArgsData_human)));
    }
    return result;
  }

  @override
  GHumanWithArgsData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'human':
          result.human.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GHumanWithArgsData_human))
              as GHumanWithArgsData_human);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsData_humanSerializer
    implements StructuredSerializer<GHumanWithArgsData_human> {
  @override
  final Iterable<Type> types = const [
    GHumanWithArgsData_human,
    _$GHumanWithArgsData_human
  ];
  @override
  final String wireName = 'GHumanWithArgsData_human';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GHumanWithArgsData_human object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.height != null) {
      result
        ..add('height')
        ..add(serializers.serialize(object.height,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GHumanWithArgsData_human deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsData_humanBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsData extends GHumanWithArgsData {
  @override
  final GHumanWithArgsData_human human;

  factory _$GHumanWithArgsData(
          [void Function(GHumanWithArgsDataBuilder) updates]) =>
      (new GHumanWithArgsDataBuilder()..update(updates)).build();

  _$GHumanWithArgsData._({this.human}) : super._();

  @override
  GHumanWithArgsData rebuild(
          void Function(GHumanWithArgsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsDataBuilder toBuilder() =>
      new GHumanWithArgsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData && human == other.human;
  }

  @override
  int get hashCode {
    return $jf($jc(0, human.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHumanWithArgsData')
          ..add('human', human))
        .toString();
  }
}

class GHumanWithArgsDataBuilder
    implements Builder<GHumanWithArgsData, GHumanWithArgsDataBuilder> {
  _$GHumanWithArgsData _$v;

  GHumanWithArgsData_humanBuilder _human;
  GHumanWithArgsData_humanBuilder get human =>
      _$this._human ??= new GHumanWithArgsData_humanBuilder();
  set human(GHumanWithArgsData_humanBuilder human) => _$this._human = human;

  GHumanWithArgsDataBuilder();

  GHumanWithArgsDataBuilder get _$this {
    if (_$v != null) {
      _human = _$v.human?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHumanWithArgsData;
  }

  @override
  void update(void Function(GHumanWithArgsDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHumanWithArgsData build() {
    _$GHumanWithArgsData _$result;
    try {
      _$result = _$v ?? new _$GHumanWithArgsData._(human: _human?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'human';
        _human?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHumanWithArgsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanWithArgsData_human extends GHumanWithArgsData_human {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final double height;

  factory _$GHumanWithArgsData_human(
          [void Function(GHumanWithArgsData_humanBuilder) updates]) =>
      (new GHumanWithArgsData_humanBuilder()..update(updates)).build();

  _$GHumanWithArgsData_human._({this.G__typename, this.name, this.height})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GHumanWithArgsData_human', 'G__typename');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GHumanWithArgsData_human', 'name');
    }
  }

  @override
  GHumanWithArgsData_human rebuild(
          void Function(GHumanWithArgsData_humanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsData_humanBuilder toBuilder() =>
      new GHumanWithArgsData_humanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData_human &&
        G__typename == other.G__typename &&
        name == other.name &&
        height == other.height;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), name.hashCode), height.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHumanWithArgsData_human')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('height', height))
        .toString();
  }
}

class GHumanWithArgsData_humanBuilder
    implements
        Builder<GHumanWithArgsData_human, GHumanWithArgsData_humanBuilder> {
  _$GHumanWithArgsData_human _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  double _height;
  double get height => _$this._height;
  set height(double height) => _$this._height = height;

  GHumanWithArgsData_humanBuilder() {
    GHumanWithArgsData_human._initializeBuilder(this);
  }

  GHumanWithArgsData_humanBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _name = _$v.name;
      _height = _$v.height;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsData_human other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GHumanWithArgsData_human;
  }

  @override
  void update(void Function(GHumanWithArgsData_humanBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHumanWithArgsData_human build() {
    final _$result = _$v ??
        new _$GHumanWithArgsData_human._(
            G__typename: G__typename, name: name, height: height);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
