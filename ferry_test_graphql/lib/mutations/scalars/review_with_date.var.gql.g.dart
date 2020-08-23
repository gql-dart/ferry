// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_with_date.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewWithDateVars> _$gReviewWithDateVarsSerializer =
    new _$GReviewWithDateVarsSerializer();

class _$GReviewWithDateVarsSerializer
    implements StructuredSerializer<GReviewWithDateVars> {
  @override
  final Iterable<Type> types = const [
    GReviewWithDateVars,
    _$GReviewWithDateVars
  ];
  @override
  final String wireName = 'GReviewWithDateVars';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GReviewWithDateVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'review',
      serializers.serialize(object.review,
          specifiedType: const FullType(_i1.GReviewInput)),
    ];
    if (object.episode != null) {
      result
        ..add('episode')
        ..add(serializers.serialize(object.episode,
            specifiedType: const FullType(_i1.GEpisode)));
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
  GReviewWithDateVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewWithDateVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode;
          break;
        case 'review':
          result.review.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReviewInput))
              as _i1.GReviewInput);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewWithDateVars extends GReviewWithDateVars {
  @override
  final _i1.GEpisode episode;
  @override
  final _i1.GReviewInput review;
  @override
  final DateTime createdAt;

  factory _$GReviewWithDateVars(
          [void Function(GReviewWithDateVarsBuilder) updates]) =>
      (new GReviewWithDateVarsBuilder()..update(updates)).build();

  _$GReviewWithDateVars._({this.episode, this.review, this.createdAt})
      : super._() {
    if (review == null) {
      throw new BuiltValueNullFieldError('GReviewWithDateVars', 'review');
    }
  }

  @override
  GReviewWithDateVars rebuild(
          void Function(GReviewWithDateVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewWithDateVarsBuilder toBuilder() =>
      new GReviewWithDateVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewWithDateVars &&
        episode == other.episode &&
        review == other.review &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, episode.hashCode), review.hashCode), createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReviewWithDateVars')
          ..add('episode', episode)
          ..add('review', review)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GReviewWithDateVarsBuilder
    implements Builder<GReviewWithDateVars, GReviewWithDateVarsBuilder> {
  _$GReviewWithDateVars _$v;

  _i1.GEpisode _episode;
  _i1.GEpisode get episode => _$this._episode;
  set episode(_i1.GEpisode episode) => _$this._episode = episode;

  _i1.GReviewInputBuilder _review;
  _i1.GReviewInputBuilder get review =>
      _$this._review ??= new _i1.GReviewInputBuilder();
  set review(_i1.GReviewInputBuilder review) => _$this._review = review;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  GReviewWithDateVarsBuilder();

  GReviewWithDateVarsBuilder get _$this {
    if (_$v != null) {
      _episode = _$v.episode;
      _review = _$v.review?.toBuilder();
      _createdAt = _$v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewWithDateVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReviewWithDateVars;
  }

  @override
  void update(void Function(GReviewWithDateVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewWithDateVars build() {
    _$GReviewWithDateVars _$result;
    try {
      _$result = _$v ??
          new _$GReviewWithDateVars._(
              episode: episode, review: review.build(), createdAt: createdAt);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'review';
        review.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReviewWithDateVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
