// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateReviewVars> _$gCreateReviewVarsSerializer =
    new _$GCreateReviewVarsSerializer();

class _$GCreateReviewVarsSerializer
    implements StructuredSerializer<GCreateReviewVars> {
  @override
  final Iterable<Type> types = const [GCreateReviewVars, _$GCreateReviewVars];
  @override
  final String wireName = 'GCreateReviewVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GCreateReviewVars object,
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
    return result;
  }

  @override
  GCreateReviewVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateReviewVarsBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GCreateReviewVars extends GCreateReviewVars {
  @override
  final _i1.GEpisode episode;
  @override
  final _i1.GReviewInput review;

  factory _$GCreateReviewVars(
          [void Function(GCreateReviewVarsBuilder) updates]) =>
      (new GCreateReviewVarsBuilder()..update(updates)).build();

  _$GCreateReviewVars._({this.episode, this.review}) : super._() {
    if (review == null) {
      throw new BuiltValueNullFieldError('GCreateReviewVars', 'review');
    }
  }

  @override
  GCreateReviewVars rebuild(void Function(GCreateReviewVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateReviewVarsBuilder toBuilder() =>
      new GCreateReviewVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateReviewVars &&
        episode == other.episode &&
        review == other.review;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, episode.hashCode), review.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateReviewVars')
          ..add('episode', episode)
          ..add('review', review))
        .toString();
  }
}

class GCreateReviewVarsBuilder
    implements Builder<GCreateReviewVars, GCreateReviewVarsBuilder> {
  _$GCreateReviewVars _$v;

  _i1.GEpisode _episode;
  _i1.GEpisode get episode => _$this._episode;
  set episode(_i1.GEpisode episode) => _$this._episode = episode;

  _i1.GReviewInputBuilder _review;
  _i1.GReviewInputBuilder get review =>
      _$this._review ??= new _i1.GReviewInputBuilder();
  set review(_i1.GReviewInputBuilder review) => _$this._review = review;

  GCreateReviewVarsBuilder();

  GCreateReviewVarsBuilder get _$this {
    if (_$v != null) {
      _episode = _$v.episode;
      _review = _$v.review?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateReviewVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GCreateReviewVars;
  }

  @override
  void update(void Function(GCreateReviewVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateReviewVars build() {
    _$GCreateReviewVars _$result;
    try {
      _$result = _$v ??
          new _$GCreateReviewVars._(episode: episode, review: review.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'review';
        review.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GCreateReviewVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
