// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_by_id.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewsByIDData> _$gReviewsByIDDataSerializer =
    new _$GReviewsByIDDataSerializer();
Serializer<GReviewsByIDData_review> _$gReviewsByIDDataReviewSerializer =
    new _$GReviewsByIDData_reviewSerializer();

class _$GReviewsByIDDataSerializer
    implements StructuredSerializer<GReviewsByIDData> {
  @override
  final Iterable<Type> types = const [GReviewsByIDData, _$GReviewsByIDData];
  @override
  final String wireName = 'GReviewsByIDData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReviewsByIDData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GReviewsByIDData_review)));
    }
    return result;
  }

  @override
  GReviewsByIDData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsByIDDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'review':
          result.review.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GReviewsByIDData_review))!
              as GReviewsByIDData_review);
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewsByIDData_reviewSerializer
    implements StructuredSerializer<GReviewsByIDData_review> {
  @override
  final Iterable<Type> types = const [
    GReviewsByIDData_review,
    _$GReviewsByIDData_review
  ];
  @override
  final String wireName = 'GReviewsByIDData_review';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReviewsByIDData_review object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
    Object? value;
    value = object.episode;
    if (value != null) {
      result
        ..add('episode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GEpisode)));
    }
    value = object.commentary;
    if (value != null) {
      result
        ..add('commentary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  GReviewsByIDData_review deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsByIDData_reviewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GEpisode)) as _i2.GEpisode?;
          break;
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'commentary':
          result.commentary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'seenOn':
          result.seenOn.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewsByIDData extends GReviewsByIDData {
  @override
  final String G__typename;
  @override
  final GReviewsByIDData_review? review;

  factory _$GReviewsByIDData(
          [void Function(GReviewsByIDDataBuilder)? updates]) =>
      (new GReviewsByIDDataBuilder()..update(updates))._build();

  _$GReviewsByIDData._({required this.G__typename, this.review}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReviewsByIDData', 'G__typename');
  }

  @override
  GReviewsByIDData rebuild(void Function(GReviewsByIDDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsByIDDataBuilder toBuilder() =>
      new GReviewsByIDDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsByIDData &&
        G__typename == other.G__typename &&
        review == other.review;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), review.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewsByIDData')
          ..add('G__typename', G__typename)
          ..add('review', review))
        .toString();
  }
}

class GReviewsByIDDataBuilder
    implements Builder<GReviewsByIDData, GReviewsByIDDataBuilder> {
  _$GReviewsByIDData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GReviewsByIDData_reviewBuilder? _review;
  GReviewsByIDData_reviewBuilder get review =>
      _$this._review ??= new GReviewsByIDData_reviewBuilder();
  set review(GReviewsByIDData_reviewBuilder? review) => _$this._review = review;

  GReviewsByIDDataBuilder() {
    GReviewsByIDData._initializeBuilder(this);
  }

  GReviewsByIDDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _review = $v.review?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsByIDData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsByIDData;
  }

  @override
  void update(void Function(GReviewsByIDDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewsByIDData build() => _build();

  _$GReviewsByIDData _build() {
    _$GReviewsByIDData _$result;
    try {
      _$result = _$v ??
          new _$GReviewsByIDData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GReviewsByIDData', 'G__typename'),
              review: _review?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'review';
        _review?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewsByIDData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReviewsByIDData_review extends GReviewsByIDData_review {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final _i2.GEpisode? episode;
  @override
  final int stars;
  @override
  final String? commentary;
  @override
  final DateTime? createdAt;
  @override
  final BuiltList<DateTime> seenOn;

  factory _$GReviewsByIDData_review(
          [void Function(GReviewsByIDData_reviewBuilder)? updates]) =>
      (new GReviewsByIDData_reviewBuilder()..update(updates))._build();

  _$GReviewsByIDData_review._(
      {required this.G__typename,
      required this.id,
      this.episode,
      required this.stars,
      this.commentary,
      this.createdAt,
      required this.seenOn})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReviewsByIDData_review', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GReviewsByIDData_review', 'id');
    BuiltValueNullFieldError.checkNotNull(
        stars, r'GReviewsByIDData_review', 'stars');
    BuiltValueNullFieldError.checkNotNull(
        seenOn, r'GReviewsByIDData_review', 'seenOn');
  }

  @override
  GReviewsByIDData_review rebuild(
          void Function(GReviewsByIDData_reviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsByIDData_reviewBuilder toBuilder() =>
      new GReviewsByIDData_reviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsByIDData_review &&
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
    return (newBuiltValueToStringHelper(r'GReviewsByIDData_review')
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

class GReviewsByIDData_reviewBuilder
    implements
        Builder<GReviewsByIDData_review, GReviewsByIDData_reviewBuilder> {
  _$GReviewsByIDData_review? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  _i2.GEpisode? _episode;
  _i2.GEpisode? get episode => _$this._episode;
  set episode(_i2.GEpisode? episode) => _$this._episode = episode;

  int? _stars;
  int? get stars => _$this._stars;
  set stars(int? stars) => _$this._stars = stars;

  String? _commentary;
  String? get commentary => _$this._commentary;
  set commentary(String? commentary) => _$this._commentary = commentary;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<DateTime>? _seenOn;
  ListBuilder<DateTime> get seenOn =>
      _$this._seenOn ??= new ListBuilder<DateTime>();
  set seenOn(ListBuilder<DateTime>? seenOn) => _$this._seenOn = seenOn;

  GReviewsByIDData_reviewBuilder() {
    GReviewsByIDData_review._initializeBuilder(this);
  }

  GReviewsByIDData_reviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _episode = $v.episode;
      _stars = $v.stars;
      _commentary = $v.commentary;
      _createdAt = $v.createdAt;
      _seenOn = $v.seenOn.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsByIDData_review other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsByIDData_review;
  }

  @override
  void update(void Function(GReviewsByIDData_reviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewsByIDData_review build() => _build();

  _$GReviewsByIDData_review _build() {
    _$GReviewsByIDData_review _$result;
    try {
      _$result = _$v ??
          new _$GReviewsByIDData_review._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GReviewsByIDData_review', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GReviewsByIDData_review', 'id'),
              episode: episode,
              stars: BuiltValueNullFieldError.checkNotNull(
                  stars, r'GReviewsByIDData_review', 'stars'),
              commentary: commentary,
              createdAt: createdAt,
              seenOn: seenOn.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'seenOn';
        seenOn.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewsByIDData_review', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
