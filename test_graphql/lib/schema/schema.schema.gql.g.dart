// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GEpisode _$gEpisodeNEWHOPE = const GEpisode._('NEWHOPE');
const GEpisode _$gEpisodeEMPIRE = const GEpisode._('EMPIRE');
const GEpisode _$gEpisodeJEDI = const GEpisode._('JEDI');

GEpisode _$gEpisodeValueOf(String name) {
  switch (name) {
    case 'NEWHOPE':
      return _$gEpisodeNEWHOPE;
    case 'EMPIRE':
      return _$gEpisodeEMPIRE;
    case 'JEDI':
      return _$gEpisodeJEDI;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GEpisode> _$gEpisodeValues =
    new BuiltSet<GEpisode>(const <GEpisode>[
  _$gEpisodeNEWHOPE,
  _$gEpisodeEMPIRE,
  _$gEpisodeJEDI,
]);

const GLengthUnit _$gLengthUnitMETER = const GLengthUnit._('METER');
const GLengthUnit _$gLengthUnitFOOT = const GLengthUnit._('FOOT');

GLengthUnit _$gLengthUnitValueOf(String name) {
  switch (name) {
    case 'METER':
      return _$gLengthUnitMETER;
    case 'FOOT':
      return _$gLengthUnitFOOT;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GLengthUnit> _$gLengthUnitValues =
    new BuiltSet<GLengthUnit>(const <GLengthUnit>[
  _$gLengthUnitMETER,
  _$gLengthUnitFOOT,
]);

Serializer<GEpisode> _$gEpisodeSerializer = new _$GEpisodeSerializer();
Serializer<GLengthUnit> _$gLengthUnitSerializer = new _$GLengthUnitSerializer();
Serializer<GReviewInput> _$gReviewInputSerializer =
    new _$GReviewInputSerializer();
Serializer<GColorInput> _$gColorInputSerializer = new _$GColorInputSerializer();

class _$GEpisodeSerializer implements PrimitiveSerializer<GEpisode> {
  @override
  final Iterable<Type> types = const <Type>[GEpisode];
  @override
  final String wireName = 'GEpisode';

  @override
  Object serialize(Serializers serializers, GEpisode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GEpisode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GEpisode.valueOf(serialized as String);
}

class _$GLengthUnitSerializer implements PrimitiveSerializer<GLengthUnit> {
  @override
  final Iterable<Type> types = const <Type>[GLengthUnit];
  @override
  final String wireName = 'GLengthUnit';

  @override
  Object serialize(Serializers serializers, GLengthUnit object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GLengthUnit deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GLengthUnit.valueOf(serialized as String);
}

class _$GReviewInputSerializer implements StructuredSerializer<GReviewInput> {
  @override
  final Iterable<Type> types = const [GReviewInput, _$GReviewInput];
  @override
  final String wireName = 'GReviewInput';

  @override
  Iterable<Object> serialize(Serializers serializers, GReviewInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
    ];
    if (object.commentary != null) {
      result
        ..add('commentary')
        ..add(serializers.serialize(object.commentary,
            specifiedType: const FullType(String)));
    }
    if (object.favorite_color != null) {
      result
        ..add('favorite_color')
        ..add(serializers.serialize(object.favorite_color,
            specifiedType: const FullType(GColorInput)));
    }
    if (object.seenOn != null) {
      result
        ..add('seenOn')
        ..add(serializers.serialize(object.seenOn,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    return result;
  }

  @override
  GReviewInput deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'commentary':
          result.commentary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'favorite_color':
          result.favorite_color.replace(serializers.deserialize(value,
              specifiedType: const FullType(GColorInput)) as GColorInput);
          break;
        case 'seenOn':
          result.seenOn.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GColorInputSerializer implements StructuredSerializer<GColorInput> {
  @override
  final Iterable<Type> types = const [GColorInput, _$GColorInput];
  @override
  final String wireName = 'GColorInput';

  @override
  Iterable<Object> serialize(Serializers serializers, GColorInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'red',
      serializers.serialize(object.red, specifiedType: const FullType(int)),
      'green',
      serializers.serialize(object.green, specifiedType: const FullType(int)),
      'blue',
      serializers.serialize(object.blue, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GColorInput deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GColorInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'red':
          result.red = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'green':
          result.green = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'blue':
          result.blue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewInput extends GReviewInput {
  @override
  final int stars;
  @override
  final String commentary;
  @override
  final GColorInput favorite_color;
  @override
  final BuiltList<DateTime> seenOn;

  factory _$GReviewInput([void Function(GReviewInputBuilder) updates]) =>
      (new GReviewInputBuilder()..update(updates)).build();

  _$GReviewInput._(
      {this.stars, this.commentary, this.favorite_color, this.seenOn})
      : super._() {
    if (stars == null) {
      throw new BuiltValueNullFieldError('GReviewInput', 'stars');
    }
  }

  @override
  GReviewInput rebuild(void Function(GReviewInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewInputBuilder toBuilder() => new GReviewInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewInput &&
        stars == other.stars &&
        commentary == other.commentary &&
        favorite_color == other.favorite_color &&
        seenOn == other.seenOn;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, stars.hashCode), commentary.hashCode),
            favorite_color.hashCode),
        seenOn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReviewInput')
          ..add('stars', stars)
          ..add('commentary', commentary)
          ..add('favorite_color', favorite_color)
          ..add('seenOn', seenOn))
        .toString();
  }
}

class GReviewInputBuilder
    implements Builder<GReviewInput, GReviewInputBuilder> {
  _$GReviewInput _$v;

  int _stars;
  int get stars => _$this._stars;
  set stars(int stars) => _$this._stars = stars;

  String _commentary;
  String get commentary => _$this._commentary;
  set commentary(String commentary) => _$this._commentary = commentary;

  GColorInputBuilder _favorite_color;
  GColorInputBuilder get favorite_color =>
      _$this._favorite_color ??= new GColorInputBuilder();
  set favorite_color(GColorInputBuilder favorite_color) =>
      _$this._favorite_color = favorite_color;

  ListBuilder<DateTime> _seenOn;
  ListBuilder<DateTime> get seenOn =>
      _$this._seenOn ??= new ListBuilder<DateTime>();
  set seenOn(ListBuilder<DateTime> seenOn) => _$this._seenOn = seenOn;

  GReviewInputBuilder();

  GReviewInputBuilder get _$this {
    if (_$v != null) {
      _stars = _$v.stars;
      _commentary = _$v.commentary;
      _favorite_color = _$v.favorite_color?.toBuilder();
      _seenOn = _$v.seenOn?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReviewInput;
  }

  @override
  void update(void Function(GReviewInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewInput build() {
    _$GReviewInput _$result;
    try {
      _$result = _$v ??
          new _$GReviewInput._(
              stars: stars,
              commentary: commentary,
              favorite_color: _favorite_color?.build(),
              seenOn: _seenOn?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favorite_color';
        _favorite_color?.build();
        _$failedField = 'seenOn';
        _seenOn?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReviewInput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GColorInput extends GColorInput {
  @override
  final int red;
  @override
  final int green;
  @override
  final int blue;

  factory _$GColorInput([void Function(GColorInputBuilder) updates]) =>
      (new GColorInputBuilder()..update(updates)).build();

  _$GColorInput._({this.red, this.green, this.blue}) : super._() {
    if (red == null) {
      throw new BuiltValueNullFieldError('GColorInput', 'red');
    }
    if (green == null) {
      throw new BuiltValueNullFieldError('GColorInput', 'green');
    }
    if (blue == null) {
      throw new BuiltValueNullFieldError('GColorInput', 'blue');
    }
  }

  @override
  GColorInput rebuild(void Function(GColorInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GColorInputBuilder toBuilder() => new GColorInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GColorInput &&
        red == other.red &&
        green == other.green &&
        blue == other.blue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, red.hashCode), green.hashCode), blue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GColorInput')
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class GColorInputBuilder implements Builder<GColorInput, GColorInputBuilder> {
  _$GColorInput _$v;

  int _red;
  int get red => _$this._red;
  set red(int red) => _$this._red = red;

  int _green;
  int get green => _$this._green;
  set green(int green) => _$this._green = green;

  int _blue;
  int get blue => _$this._blue;
  set blue(int blue) => _$this._blue = blue;

  GColorInputBuilder();

  GColorInputBuilder get _$this {
    if (_$v != null) {
      _red = _$v.red;
      _green = _$v.green;
      _blue = _$v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GColorInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GColorInput;
  }

  @override
  void update(void Function(GColorInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GColorInput build() {
    final _$result =
        _$v ?? new _$GColorInput._(red: red, green: green, blue: blue);
    replace(_$result);
    return _$result;
  }
}

class _$GISODate extends GISODate {
  @override
  final String value;

  factory _$GISODate([void Function(GISODateBuilder) updates]) =>
      (new GISODateBuilder()..update(updates)).build();

  _$GISODate._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('GISODate', 'value');
    }
  }

  @override
  GISODate rebuild(void Function(GISODateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GISODateBuilder toBuilder() => new GISODateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GISODate && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GISODate')..add('value', value))
        .toString();
  }
}

class GISODateBuilder implements Builder<GISODate, GISODateBuilder> {
  _$GISODate _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  GISODateBuilder();

  GISODateBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GISODate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GISODate;
  }

  @override
  void update(void Function(GISODateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GISODate build() {
    final _$result = _$v ?? new _$GISODate._(value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
