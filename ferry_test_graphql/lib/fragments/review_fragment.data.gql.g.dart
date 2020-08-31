// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewFragmentData> _$gReviewFragmentDataSerializer =
    new _$GReviewFragmentDataSerializer();

class _$GReviewFragmentDataSerializer
    implements StructuredSerializer<GReviewFragmentData> {
  @override
  final Iterable<Type> types = const [
    GReviewFragmentData,
    _$GReviewFragmentData
  ];
  @override
  final String wireName = 'GReviewFragmentData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GReviewFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
    ];
    if (object.commentary != null) {
      result
        ..add('commentary')
        ..add(serializers.serialize(object.commentary,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GReviewFragmentData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewFragmentDataBuilder();

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
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'commentary':
          result.commentary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewFragmentData extends GReviewFragmentData {
  @override
  final String G__typename;
  @override
  final int stars;
  @override
  final String commentary;

  factory _$GReviewFragmentData(
          [void Function(GReviewFragmentDataBuilder) updates]) =>
      (new GReviewFragmentDataBuilder()..update(updates)).build();

  _$GReviewFragmentData._({this.G__typename, this.stars, this.commentary})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GReviewFragmentData', 'G__typename');
    }
    if (stars == null) {
      throw new BuiltValueNullFieldError('GReviewFragmentData', 'stars');
    }
  }

  @override
  GReviewFragmentData rebuild(
          void Function(GReviewFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewFragmentDataBuilder toBuilder() =>
      new GReviewFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewFragmentData &&
        G__typename == other.G__typename &&
        stars == other.stars &&
        commentary == other.commentary;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), stars.hashCode),
        commentary.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReviewFragmentData')
          ..add('G__typename', G__typename)
          ..add('stars', stars)
          ..add('commentary', commentary))
        .toString();
  }
}

class GReviewFragmentDataBuilder
    implements Builder<GReviewFragmentData, GReviewFragmentDataBuilder> {
  _$GReviewFragmentData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _stars;
  int get stars => _$this._stars;
  set stars(int stars) => _$this._stars = stars;

  String _commentary;
  String get commentary => _$this._commentary;
  set commentary(String commentary) => _$this._commentary = commentary;

  GReviewFragmentDataBuilder() {
    GReviewFragmentData._initializeBuilder(this);
  }

  GReviewFragmentDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _stars = _$v.stars;
      _commentary = _$v.commentary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewFragmentData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReviewFragmentData;
  }

  @override
  void update(void Function(GReviewFragmentDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewFragmentData build() {
    final _$result = _$v ??
        new _$GReviewFragmentData._(
            G__typename: G__typename, stars: stars, commentary: commentary);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
