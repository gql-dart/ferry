// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_with_date_scalar.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewWithDateData> _$gReviewWithDateDataSerializer =
    new _$GReviewWithDateDataSerializer();
Serializer<GReviewWithDateData_createReview>
    _$gReviewWithDateDataCreateReviewSerializer =
    new _$GReviewWithDateData_createReviewSerializer();

class _$GReviewWithDateDataSerializer
    implements StructuredSerializer<GReviewWithDateData> {
  @override
  final Iterable<Type> types = const [
    GReviewWithDateData,
    _$GReviewWithDateData
  ];
  @override
  final String wireName = 'GReviewWithDateData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReviewWithDateData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createReview;
    if (value != null) {
      result
        ..add('createReview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GReviewWithDateData_createReview)));
    }
    return result;
  }

  @override
  GReviewWithDateData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewWithDateDataBuilder();

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
        case 'createReview':
          result.createReview.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GReviewWithDateData_createReview))!
              as GReviewWithDateData_createReview);
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewWithDateData_createReviewSerializer
    implements StructuredSerializer<GReviewWithDateData_createReview> {
  @override
  final Iterable<Type> types = const [
    GReviewWithDateData_createReview,
    _$GReviewWithDateData_createReview
  ];
  @override
  final String wireName = 'GReviewWithDateData_createReview';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReviewWithDateData_createReview object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
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
  GReviewWithDateData_createReview deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewWithDateData_createReviewBuilder();

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

class _$GReviewWithDateData extends GReviewWithDateData {
  @override
  final String G__typename;
  @override
  final GReviewWithDateData_createReview? createReview;

  factory _$GReviewWithDateData(
          [void Function(GReviewWithDateDataBuilder)? updates]) =>
      (new GReviewWithDateDataBuilder()..update(updates))._build();

  _$GReviewWithDateData._({required this.G__typename, this.createReview})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReviewWithDateData', 'G__typename');
  }

  @override
  GReviewWithDateData rebuild(
          void Function(GReviewWithDateDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewWithDateDataBuilder toBuilder() =>
      new GReviewWithDateDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewWithDateData &&
        G__typename == other.G__typename &&
        createReview == other.createReview;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createReview.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewWithDateData')
          ..add('G__typename', G__typename)
          ..add('createReview', createReview))
        .toString();
  }
}

class GReviewWithDateDataBuilder
    implements Builder<GReviewWithDateData, GReviewWithDateDataBuilder> {
  _$GReviewWithDateData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GReviewWithDateData_createReviewBuilder? _createReview;
  GReviewWithDateData_createReviewBuilder get createReview =>
      _$this._createReview ??= new GReviewWithDateData_createReviewBuilder();
  set createReview(GReviewWithDateData_createReviewBuilder? createReview) =>
      _$this._createReview = createReview;

  GReviewWithDateDataBuilder() {
    GReviewWithDateData._initializeBuilder(this);
  }

  GReviewWithDateDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createReview = $v.createReview?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewWithDateData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewWithDateData;
  }

  @override
  void update(void Function(GReviewWithDateDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewWithDateData build() => _build();

  _$GReviewWithDateData _build() {
    _$GReviewWithDateData _$result;
    try {
      _$result = _$v ??
          new _$GReviewWithDateData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReviewWithDateData', 'G__typename'),
            createReview: _createReview?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createReview';
        _createReview?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewWithDateData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReviewWithDateData_createReview
    extends GReviewWithDateData_createReview {
  @override
  final String G__typename;
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

  factory _$GReviewWithDateData_createReview(
          [void Function(GReviewWithDateData_createReviewBuilder)? updates]) =>
      (new GReviewWithDateData_createReviewBuilder()..update(updates))._build();

  _$GReviewWithDateData_createReview._(
      {required this.G__typename,
      this.episode,
      required this.stars,
      this.commentary,
      this.createdAt,
      required this.seenOn})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReviewWithDateData_createReview', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stars, r'GReviewWithDateData_createReview', 'stars');
    BuiltValueNullFieldError.checkNotNull(
        seenOn, r'GReviewWithDateData_createReview', 'seenOn');
  }

  @override
  GReviewWithDateData_createReview rebuild(
          void Function(GReviewWithDateData_createReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewWithDateData_createReviewBuilder toBuilder() =>
      new GReviewWithDateData_createReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewWithDateData_createReview &&
        G__typename == other.G__typename &&
        episode == other.episode &&
        stars == other.stars &&
        commentary == other.commentary &&
        createdAt == other.createdAt &&
        seenOn == other.seenOn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, stars.hashCode);
    _$hash = $jc(_$hash, commentary.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, seenOn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewWithDateData_createReview')
          ..add('G__typename', G__typename)
          ..add('episode', episode)
          ..add('stars', stars)
          ..add('commentary', commentary)
          ..add('createdAt', createdAt)
          ..add('seenOn', seenOn))
        .toString();
  }
}

class GReviewWithDateData_createReviewBuilder
    implements
        Builder<GReviewWithDateData_createReview,
            GReviewWithDateData_createReviewBuilder> {
  _$GReviewWithDateData_createReview? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  GReviewWithDateData_createReviewBuilder() {
    GReviewWithDateData_createReview._initializeBuilder(this);
  }

  GReviewWithDateData_createReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
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
  void replace(GReviewWithDateData_createReview other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewWithDateData_createReview;
  }

  @override
  void update(void Function(GReviewWithDateData_createReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewWithDateData_createReview build() => _build();

  _$GReviewWithDateData_createReview _build() {
    _$GReviewWithDateData_createReview _$result;
    try {
      _$result = _$v ??
          new _$GReviewWithDateData_createReview._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GReviewWithDateData_createReview', 'G__typename'),
            episode: episode,
            stars: BuiltValueNullFieldError.checkNotNull(
                stars, r'GReviewWithDateData_createReview', 'stars'),
            commentary: commentary,
            createdAt: createdAt,
            seenOn: seenOn.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'seenOn';
        seenOn.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewWithDateData_createReview', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
