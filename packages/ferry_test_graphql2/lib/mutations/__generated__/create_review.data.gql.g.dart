// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateReviewData> _$gCreateReviewDataSerializer =
    new _$GCreateReviewDataSerializer();
Serializer<GCreateReviewData_createReview>
    _$gCreateReviewDataCreateReviewSerializer =
    new _$GCreateReviewData_createReviewSerializer();

class _$GCreateReviewDataSerializer
    implements StructuredSerializer<GCreateReviewData> {
  @override
  final Iterable<Type> types = const [GCreateReviewData, _$GCreateReviewData];
  @override
  final String wireName = 'GCreateReviewData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateReviewData object,
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
            specifiedType: const FullType(GCreateReviewData_createReview)));
    }
    return result;
  }

  @override
  GCreateReviewData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateReviewDataBuilder();

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
                      const FullType(GCreateReviewData_createReview))!
              as GCreateReviewData_createReview);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateReviewData_createReviewSerializer
    implements StructuredSerializer<GCreateReviewData_createReview> {
  @override
  final Iterable<Type> types = const [
    GCreateReviewData_createReview,
    _$GCreateReviewData_createReview
  ];
  @override
  final String wireName = 'GCreateReviewData_createReview';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateReviewData_createReview object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
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
    return result;
  }

  @override
  GCreateReviewData_createReview deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateReviewData_createReviewBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GCreateReviewData extends GCreateReviewData {
  @override
  final String G__typename;
  @override
  final GCreateReviewData_createReview? createReview;

  factory _$GCreateReviewData(
          [void Function(GCreateReviewDataBuilder)? updates]) =>
      (new GCreateReviewDataBuilder()..update(updates))._build();

  _$GCreateReviewData._({required this.G__typename, this.createReview})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateReviewData', 'G__typename');
  }

  @override
  GCreateReviewData rebuild(void Function(GCreateReviewDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateReviewDataBuilder toBuilder() =>
      new GCreateReviewDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateReviewData &&
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
    return (newBuiltValueToStringHelper(r'GCreateReviewData')
          ..add('G__typename', G__typename)
          ..add('createReview', createReview))
        .toString();
  }
}

class GCreateReviewDataBuilder
    implements Builder<GCreateReviewData, GCreateReviewDataBuilder> {
  _$GCreateReviewData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateReviewData_createReviewBuilder? _createReview;
  GCreateReviewData_createReviewBuilder get createReview =>
      _$this._createReview ??= new GCreateReviewData_createReviewBuilder();
  set createReview(GCreateReviewData_createReviewBuilder? createReview) =>
      _$this._createReview = createReview;

  GCreateReviewDataBuilder() {
    GCreateReviewData._initializeBuilder(this);
  }

  GCreateReviewDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createReview = $v.createReview?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateReviewData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateReviewData;
  }

  @override
  void update(void Function(GCreateReviewDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateReviewData build() => _build();

  _$GCreateReviewData _build() {
    _$GCreateReviewData _$result;
    try {
      _$result = _$v ??
          new _$GCreateReviewData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateReviewData', 'G__typename'),
            createReview: _createReview?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createReview';
        _createReview?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateReviewData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateReviewData_createReview extends GCreateReviewData_createReview {
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

  factory _$GCreateReviewData_createReview(
          [void Function(GCreateReviewData_createReviewBuilder)? updates]) =>
      (new GCreateReviewData_createReviewBuilder()..update(updates))._build();

  _$GCreateReviewData_createReview._(
      {required this.G__typename,
      required this.id,
      this.episode,
      required this.stars,
      this.commentary})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateReviewData_createReview', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateReviewData_createReview', 'id');
    BuiltValueNullFieldError.checkNotNull(
        stars, r'GCreateReviewData_createReview', 'stars');
  }

  @override
  GCreateReviewData_createReview rebuild(
          void Function(GCreateReviewData_createReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateReviewData_createReviewBuilder toBuilder() =>
      new GCreateReviewData_createReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateReviewData_createReview &&
        G__typename == other.G__typename &&
        id == other.id &&
        episode == other.episode &&
        stars == other.stars &&
        commentary == other.commentary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, stars.hashCode);
    _$hash = $jc(_$hash, commentary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateReviewData_createReview')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('episode', episode)
          ..add('stars', stars)
          ..add('commentary', commentary))
        .toString();
  }
}

class GCreateReviewData_createReviewBuilder
    implements
        Builder<GCreateReviewData_createReview,
            GCreateReviewData_createReviewBuilder> {
  _$GCreateReviewData_createReview? _$v;

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

  GCreateReviewData_createReviewBuilder() {
    GCreateReviewData_createReview._initializeBuilder(this);
  }

  GCreateReviewData_createReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _episode = $v.episode;
      _stars = $v.stars;
      _commentary = $v.commentary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateReviewData_createReview other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateReviewData_createReview;
  }

  @override
  void update(void Function(GCreateReviewData_createReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateReviewData_createReview build() => _build();

  _$GCreateReviewData_createReview _build() {
    final _$result = _$v ??
        new _$GCreateReviewData_createReview._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GCreateReviewData_createReview', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GCreateReviewData_createReview', 'id'),
          episode: episode,
          stars: BuiltValueNullFieldError.checkNotNull(
              stars, r'GCreateReviewData_createReview', 'stars'),
          commentary: commentary,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
