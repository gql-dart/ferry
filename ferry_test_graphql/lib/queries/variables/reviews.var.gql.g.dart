// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewsVars> _$gReviewsVarsSerializer =
    new _$GReviewsVarsSerializer();

class _$GReviewsVarsSerializer implements StructuredSerializer<GReviewsVars> {
  @override
  final Iterable<Type> types = const [GReviewsVars, _$GReviewsVars];
  @override
  final String wireName = 'GReviewsVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GReviewsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.episode != null) {
      result
        ..add('episode')
        ..add(serializers.serialize(object.episode,
            specifiedType: const FullType(_i1.GEpisode)));
    }
    return result;
  }

  @override
  GReviewsVars deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsVarsBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GReviewsVars extends GReviewsVars {
  @override
  final _i1.GEpisode episode;

  factory _$GReviewsVars([void Function(GReviewsVarsBuilder) updates]) =>
      (new GReviewsVarsBuilder()..update(updates)).build();

  _$GReviewsVars._({this.episode}) : super._();

  @override
  GReviewsVars rebuild(void Function(GReviewsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsVarsBuilder toBuilder() => new GReviewsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsVars && episode == other.episode;
  }

  @override
  int get hashCode {
    return $jf($jc(0, episode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReviewsVars')
          ..add('episode', episode))
        .toString();
  }
}

class GReviewsVarsBuilder
    implements Builder<GReviewsVars, GReviewsVarsBuilder> {
  _$GReviewsVars _$v;

  _i1.GEpisode _episode;
  _i1.GEpisode get episode => _$this._episode;
  set episode(_i1.GEpisode episode) => _$this._episode = episode;

  GReviewsVarsBuilder();

  GReviewsVarsBuilder get _$this {
    if (_$v != null) {
      _episode = _$v.episode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReviewsVars;
  }

  @override
  void update(void Function(GReviewsVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReviewsVars build() {
    final _$result = _$v ?? new _$GReviewsVars._(episode: episode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
