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

class _$GReviewInput extends GReviewInput {
  @override
  final int stars;
  @override
  final _i1.Value<String>? commentary;
  @override
  final _i1.Value<GColorInput>? favorite_color;
  @override
  final _i1.Value<BuiltList<DateTime?>>? seenOn;

  factory _$GReviewInput([void Function(GReviewInputBuilder)? updates]) =>
      (new GReviewInputBuilder()..update(updates))._build();

  _$GReviewInput._(
      {required this.stars, this.commentary, this.favorite_color, this.seenOn})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(stars, r'GReviewInput', 'stars');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, stars.hashCode);
    _$hash = $jc(_$hash, commentary.hashCode);
    _$hash = $jc(_$hash, favorite_color.hashCode);
    _$hash = $jc(_$hash, seenOn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewInput')
          ..add('stars', stars)
          ..add('commentary', commentary)
          ..add('favorite_color', favorite_color)
          ..add('seenOn', seenOn))
        .toString();
  }
}

class GReviewInputBuilder
    implements Builder<GReviewInput, GReviewInputBuilder> {
  _$GReviewInput? _$v;

  int? _stars;
  int? get stars => _$this._stars;
  set stars(int? stars) => _$this._stars = stars;

  _i1.Value<String>? _commentary;
  _i1.Value<String>? get commentary => _$this._commentary;
  set commentary(_i1.Value<String>? commentary) =>
      _$this._commentary = commentary;

  _i1.Value<GColorInput>? _favorite_color;
  _i1.Value<GColorInput>? get favorite_color => _$this._favorite_color;
  set favorite_color(_i1.Value<GColorInput>? favorite_color) =>
      _$this._favorite_color = favorite_color;

  _i1.Value<BuiltList<DateTime?>>? _seenOn;
  _i1.Value<BuiltList<DateTime?>>? get seenOn => _$this._seenOn;
  set seenOn(_i1.Value<BuiltList<DateTime?>>? seenOn) =>
      _$this._seenOn = seenOn;

  GReviewInputBuilder();

  GReviewInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stars = $v.stars;
      _commentary = $v.commentary;
      _favorite_color = $v.favorite_color;
      _seenOn = $v.seenOn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewInput;
  }

  @override
  void update(void Function(GReviewInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewInput build() => _build();

  _$GReviewInput _build() {
    final _$result = _$v ??
        new _$GReviewInput._(
            stars: BuiltValueNullFieldError.checkNotNull(
                stars, r'GReviewInput', 'stars'),
            commentary: commentary,
            favorite_color: favorite_color,
            seenOn: seenOn);
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

  factory _$GColorInput([void Function(GColorInputBuilder)? updates]) =>
      (new GColorInputBuilder()..update(updates))._build();

  _$GColorInput._({required this.red, required this.green, required this.blue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(red, r'GColorInput', 'red');
    BuiltValueNullFieldError.checkNotNull(green, r'GColorInput', 'green');
    BuiltValueNullFieldError.checkNotNull(blue, r'GColorInput', 'blue');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, red.hashCode);
    _$hash = $jc(_$hash, green.hashCode);
    _$hash = $jc(_$hash, blue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GColorInput')
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class GColorInputBuilder implements Builder<GColorInput, GColorInputBuilder> {
  _$GColorInput? _$v;

  int? _red;
  int? get red => _$this._red;
  set red(int? red) => _$this._red = red;

  int? _green;
  int? get green => _$this._green;
  set green(int? green) => _$this._green = green;

  int? _blue;
  int? get blue => _$this._blue;
  set blue(int? blue) => _$this._blue = blue;

  GColorInputBuilder();

  GColorInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _red = $v.red;
      _green = $v.green;
      _blue = $v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GColorInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GColorInput;
  }

  @override
  void update(void Function(GColorInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GColorInput build() => _build();

  _$GColorInput _build() {
    final _$result = _$v ??
        new _$GColorInput._(
            red: BuiltValueNullFieldError.checkNotNull(
                red, r'GColorInput', 'red'),
            green: BuiltValueNullFieldError.checkNotNull(
                green, r'GColorInput', 'green'),
            blue: BuiltValueNullFieldError.checkNotNull(
                blue, r'GColorInput', 'blue'));
    replace(_$result);
    return _$result;
  }
}

class _$GISODate extends GISODate {
  @override
  final String value;

  factory _$GISODate([void Function(GISODateBuilder)? updates]) =>
      (new GISODateBuilder()..update(updates))._build();

  _$GISODate._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GISODate', 'value');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GISODate')..add('value', value))
        .toString();
  }
}

class GISODateBuilder implements Builder<GISODate, GISODateBuilder> {
  _$GISODate? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GISODateBuilder();

  GISODateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GISODate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GISODate;
  }

  @override
  void update(void Function(GISODateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GISODate build() => _build();

  _$GISODate _build() {
    final _$result = _$v ??
        new _$GISODate._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GISODate', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
