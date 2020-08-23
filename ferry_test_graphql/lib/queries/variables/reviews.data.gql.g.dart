// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewsData> _$gReviewsDataSerializer =
    new _$GReviewsDataSerializer();
Serializer<GReviewsData_reviews> _$gReviewsDataReviewsSerializer =
    new _$GReviewsData_reviewsSerializer();

class _$GReviewsDataSerializer implements StructuredSerializer<GReviewsData> {
  @override
  final Iterable<Type> types = const [GReviewsData, _$GReviewsData];
  @override
  final String wireName = 'GReviewsData';

  @override
  Iterable<Object> serialize(Serializers serializers, GReviewsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.reviews != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(object.reviews,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GReviewsData_reviews)])));
    }
    return result;
  }

  @override
  GReviewsData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'reviews':
          result.reviews.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GReviewsData_reviews)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewsData_reviewsSerializer
    implements StructuredSerializer<GReviewsData_reviews> {
  @override
  final Iterable<Type> types = const [
    GReviewsData_reviews,
    _$GReviewsData_reviews
  ];
  @override
  final String wireName = 'GReviewsData_reviews';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GReviewsData_reviews object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
      'seenOn',
      serializers.serialize(object.seenOn,
          specifiedType:
              const FullType(BuiltList, const [const FullType(DateTime)])),
    ];
    if (object.episode != null) {
      result
        ..add('episode')
        ..add(serializers.serialize(object.episode,
            specifiedType: const FullType(_i2.GEpisode)));
    }
    if (object.commentary != null) {
      result
        ..add('commentary')
        ..add(serializers.serialize(object.commentary,
            specifiedType: const FullType(String)));
    }
    if (object.createdAt != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  GReviewsData_reviews deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsData_reviewsBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GEpisode)) as _i2.GEpisode;
          break;
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'commentary':
          result.commentary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$GReviewsData extends GReviewsData {
  @override
  final BuiltList<GReviewsData_reviews> reviews;

  factory _$GReviewsData([void Function(GReviewsDataBuilder) updates]) =>
      (new GReviewsDataBuilder()..update(updates)).build();

  _$GReviewsData._({this.reviews}) : super._();

  @override
  GReviewsData rebuild(void Function(GReviewsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsDataBuilder toBuilder() => new GReviewsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsData && reviews == other.reviews;
  }

  @override
  int get hashCode {
    return $jf($jc(0, reviews.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReviewsData')
          ..add('reviews', reviews))
        .toString();
  }
}

class GReviewsDataBuilder
    implements Builder<GReviewsData, GReviewsDataBuilder> {
  _$GReviewsData _$v;

  ListBuilder<GReviewsData_reviews> _reviews;
  ListBuilder<GReviewsData_reviews> get reviews =>
      _$this._reviews ??= new ListBuilder<GReviewsData_reviews>();
  set reviews(ListBuilder<GReviewsData_reviews> reviews) =>
      _$this._reviews = reviews;

  GReviewsDataBuilder();

  GReviewsDataBuilder get _$this {
    if (_$v != null) {
      _reviews = _$v.reviews?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReviewsData;
  }

  @override
  void update(void Function(GReviewsDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewsData build() {
    _$GReviewsData _$result;
    try {
      _$result = _$v ?? new _$GReviewsData._(reviews: _reviews?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'reviews';
        _reviews?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReviewsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReviewsData_reviews extends GReviewsData_reviews {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final _i2.GEpisode episode;
  @override
  final int stars;
  @override
  final String commentary;
  @override
  final DateTime createdAt;
  @override
  final BuiltList<DateTime> seenOn;

  factory _$GReviewsData_reviews(
          [void Function(GReviewsData_reviewsBuilder) updates]) =>
      (new GReviewsData_reviewsBuilder()..update(updates)).build();

  _$GReviewsData_reviews._(
      {this.G__typename,
      this.id,
      this.episode,
      this.stars,
      this.commentary,
      this.createdAt,
      this.seenOn})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GReviewsData_reviews', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GReviewsData_reviews', 'id');
    }
    if (stars == null) {
      throw new BuiltValueNullFieldError('GReviewsData_reviews', 'stars');
    }
    if (seenOn == null) {
      throw new BuiltValueNullFieldError('GReviewsData_reviews', 'seenOn');
    }
  }

  @override
  GReviewsData_reviews rebuild(
          void Function(GReviewsData_reviewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsData_reviewsBuilder toBuilder() =>
      new GReviewsData_reviewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsData_reviews &&
        G__typename == other.G__typename &&
        id == other.id &&
        episode == other.episode &&
        stars == other.stars &&
        commentary == other.commentary &&
        createdAt == other.createdAt &&
        seenOn == other.seenOn;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                        episode.hashCode),
                    stars.hashCode),
                commentary.hashCode),
            createdAt.hashCode),
        seenOn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReviewsData_reviews')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('episode', episode)
          ..add('stars', stars)
          ..add('commentary', commentary)
          ..add('createdAt', createdAt)
          ..add('seenOn', seenOn))
        .toString();
  }
}

class GReviewsData_reviewsBuilder
    implements Builder<GReviewsData_reviews, GReviewsData_reviewsBuilder> {
  _$GReviewsData_reviews _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  _i2.GEpisode _episode;
  _i2.GEpisode get episode => _$this._episode;
  set episode(_i2.GEpisode episode) => _$this._episode = episode;

  int _stars;
  int get stars => _$this._stars;
  set stars(int stars) => _$this._stars = stars;

  String _commentary;
  String get commentary => _$this._commentary;
  set commentary(String commentary) => _$this._commentary = commentary;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  ListBuilder<DateTime> _seenOn;
  ListBuilder<DateTime> get seenOn =>
      _$this._seenOn ??= new ListBuilder<DateTime>();
  set seenOn(ListBuilder<DateTime> seenOn) => _$this._seenOn = seenOn;

  GReviewsData_reviewsBuilder() {
    GReviewsData_reviews._initializeBuilder(this);
  }

  GReviewsData_reviewsBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _episode = _$v.episode;
      _stars = _$v.stars;
      _commentary = _$v.commentary;
      _createdAt = _$v.createdAt;
      _seenOn = _$v.seenOn?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsData_reviews other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReviewsData_reviews;
  }

  @override
  void update(void Function(GReviewsData_reviewsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewsData_reviews build() {
    _$GReviewsData_reviews _$result;
    try {
      _$result = _$v ??
          new _$GReviewsData_reviews._(
              G__typename: G__typename,
              id: id,
              episode: episode,
              stars: stars,
              commentary: commentary,
              createdAt: createdAt,
              seenOn: seenOn.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'seenOn';
        seenOn.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReviewsData_reviews', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
