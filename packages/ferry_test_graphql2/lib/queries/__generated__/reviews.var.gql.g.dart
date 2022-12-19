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
  Iterable<Object?> serialize(Serializers serializers, GReviewsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.episode;
    if (value != null) {
      result
        ..add('episode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GEpisode)));
    }
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.offset;
    if (value != null) {
      result
        ..add('offset')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GReviewsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode?;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReviewsVars extends GReviewsVars {
  @override
  final _i1.GEpisode? episode;
  @override
  final int? first;
  @override
  final int? offset;

  factory _$GReviewsVars([void Function(GReviewsVarsBuilder)? updates]) =>
      (new GReviewsVarsBuilder()..update(updates))._build();

  _$GReviewsVars._({this.episode, this.first, this.offset}) : super._();

  @override
  GReviewsVars rebuild(void Function(GReviewsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewsVarsBuilder toBuilder() => new GReviewsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewsVars &&
        episode == other.episode &&
        first == other.first &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, episode.hashCode), first.hashCode), offset.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewsVars')
          ..add('episode', episode)
          ..add('first', first)
          ..add('offset', offset))
        .toString();
  }
}

class GReviewsVarsBuilder
    implements Builder<GReviewsVars, GReviewsVarsBuilder> {
  _$GReviewsVars? _$v;

  _i1.GEpisode? _episode;
  _i1.GEpisode? get episode => _$this._episode;
  set episode(_i1.GEpisode? episode) => _$this._episode = episode;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  GReviewsVarsBuilder();

  GReviewsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _first = $v.first;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewsVars;
  }

  @override
  void update(void Function(GReviewsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewsVars build() => _build();

  _$GReviewsVars _build() {
    final _$result = _$v ??
        new _$GReviewsVars._(episode: episode, first: first, offset: offset);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
