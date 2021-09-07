// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewsData> _$gReviewsDataSerializer =
    new _$GReviewsDataSerializer();
Serializer<GReviewsData_reviewAdded> _$gReviewsDataReviewAddedSerializer =
    new _$GReviewsData_reviewAddedSerializer();

class _$GReviewsDataSerializer implements StructuredSerializer<GReviewsData> {
  @override
  final Iterable<Type> types = const [GReviewsData, _$GReviewsData];
  @override
  final String wireName = 'GReviewsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReviewsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reviewAdded;
    if (value != null) {
      result
        ..add('reviewAdded')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GReviewsData_reviewAdded)));
    }
    return result;
  }

  @override
  GReviewsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reviewAdded':
          result.reviewAdded.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GReviewsData_reviewAdded))!
              as GReviewsData_reviewAdded);
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewsData_reviewAddedSerializer
    implements StructuredSerializer<GReviewsData_reviewAdded> {
  @override
  final Iterable<Type> types = const [
    GReviewsData_reviewAdded,
    _$GReviewsData_reviewAdded
  ];
  @override
  final String wireName = 'GReviewsData_reviewAdded';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReviewsData_reviewAdded object,
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
  GReviewsData_reviewAdded deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsData_reviewAddedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
              specifiedType: const FullType(_i2.GEpisode)) as _i2.GEpisode?;
          break;
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$GReviewsData extends GReviewsData {
  @override
  final String G__typename;
  @override
  final GReviewsData_reviewAdded? reviewAdded;

  factory _$GReviewsData([void Function(GReviewsDataBuilder)? updates]) =>
      (new GReviewsDataBuilder()..update(updates)).build();

  _$GReviewsData._({required this.G__typename, this.reviewAdded}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GReviewsData', 'G__typename');
  }

  @override
  GReviewsData rebuild(void Function(GReviewsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsDataBuilder toBuilder() => new GReviewsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsData &&
        G__typename == other.G__typename &&
        reviewAdded == other.reviewAdded;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), reviewAdded.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReviewsData')
          ..add('G__typename', G__typename)
          ..add('reviewAdded', reviewAdded))
        .toString();
  }
}

class GReviewsDataBuilder
    implements Builder<GReviewsData, GReviewsDataBuilder> {
  _$GReviewsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GReviewsData_reviewAddedBuilder? _reviewAdded;
  GReviewsData_reviewAddedBuilder get reviewAdded =>
      _$this._reviewAdded ??= new GReviewsData_reviewAddedBuilder();
  set reviewAdded(GReviewsData_reviewAddedBuilder? reviewAdded) =>
      _$this._reviewAdded = reviewAdded;

  GReviewsDataBuilder() {
    GReviewsData._initializeBuilder(this);
  }

  GReviewsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reviewAdded = $v.reviewAdded?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsData;
  }

  @override
  void update(void Function(GReviewsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewsData build() {
    _$GReviewsData _$result;
    try {
      _$result = _$v ??
          new _$GReviewsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GReviewsData', 'G__typename'),
              reviewAdded: _reviewAdded?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reviewAdded';
        _reviewAdded?.build();
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

class _$GReviewsData_reviewAdded extends GReviewsData_reviewAdded {
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

  factory _$GReviewsData_reviewAdded(
          [void Function(GReviewsData_reviewAddedBuilder)? updates]) =>
      (new GReviewsData_reviewAddedBuilder()..update(updates)).build();

  _$GReviewsData_reviewAdded._(
      {required this.G__typename,
      required this.id,
      this.episode,
      required this.stars,
      this.commentary,
      this.createdAt,
      required this.seenOn})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GReviewsData_reviewAdded', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, 'GReviewsData_reviewAdded', 'id');
    BuiltValueNullFieldError.checkNotNull(
        stars, 'GReviewsData_reviewAdded', 'stars');
    BuiltValueNullFieldError.checkNotNull(
        seenOn, 'GReviewsData_reviewAdded', 'seenOn');
  }

  @override
  GReviewsData_reviewAdded rebuild(
          void Function(GReviewsData_reviewAddedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsData_reviewAddedBuilder toBuilder() =>
      new GReviewsData_reviewAddedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsData_reviewAdded &&
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
    return (newBuiltValueToStringHelper('GReviewsData_reviewAdded')
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

class GReviewsData_reviewAddedBuilder
    implements
        Builder<GReviewsData_reviewAdded, GReviewsData_reviewAddedBuilder> {
  _$GReviewsData_reviewAdded? _$v;

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

  GReviewsData_reviewAddedBuilder() {
    GReviewsData_reviewAdded._initializeBuilder(this);
  }

  GReviewsData_reviewAddedBuilder get _$this {
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
  void replace(GReviewsData_reviewAdded other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsData_reviewAdded;
  }

  @override
  void update(void Function(GReviewsData_reviewAddedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewsData_reviewAdded build() {
    _$GReviewsData_reviewAdded _$result;
    try {
      _$result = _$v ??
          new _$GReviewsData_reviewAdded._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GReviewsData_reviewAdded', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'GReviewsData_reviewAdded', 'id'),
              episode: episode,
              stars: BuiltValueNullFieldError.checkNotNull(
                  stars, 'GReviewsData_reviewAdded', 'stars'),
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
            'GReviewsData_reviewAdded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
