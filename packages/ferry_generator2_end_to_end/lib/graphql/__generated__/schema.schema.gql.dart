// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/custom/date.dart';
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

/// The episodes in the Star Wars trilogy.
enum GEpisode {
  /// Star Wars Episode IV: A New Hope, released in 1977.
  NEWHOPE,
  EMPIRE,
  JEDI,
  gUnknownEnumValue;

  static GEpisode fromJson(String value) {
    switch (value) {
      case r'NEWHOPE':
        return GEpisode.NEWHOPE;
      case r'EMPIRE':
        return GEpisode.EMPIRE;
      case r'JEDI':
        return GEpisode.JEDI;
      default:
        return GEpisode.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GEpisode.NEWHOPE:
        return r'NEWHOPE';
      case GEpisode.EMPIRE:
        return r'EMPIRE';
      case GEpisode.JEDI:
        return r'JEDI';
      case GEpisode.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

enum GLengthUnit {
  METER,
  FOOT,
  gUnknownEnumValue;

  static GLengthUnit fromJson(String value) {
    switch (value) {
      case r'METER':
        return GLengthUnit.METER;
      case r'FOOT':
        return GLengthUnit.FOOT;
      default:
        return GLengthUnit.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GLengthUnit.METER:
        return r'METER';
      case GLengthUnit.FOOT:
        return r'FOOT';
      case GLengthUnit.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

/// Input object sent when creating a new review.
class GReviewInput {
  const GReviewInput({
    required this.stars,
    this.commentary = const Value.absent(),
    this.favorite_color = const Value.absent(),
    this.seenOn = const Value.absent(),
  });

  factory GReviewInput.fromJson(Map<String, dynamic> json) {
    return GReviewInput(
      stars: (json['stars'] as int),
      commentary: json.containsKey('commentary')
          ? Value.present(json['commentary'] == null
              ? null
              : (json['commentary'] as String))
          : Value.absent(),
      favorite_color: json.containsKey('favorite_color')
          ? Value.present(json['favorite_color'] == null
              ? null
              : GColorInput.fromJson(
                  (json['favorite_color'] as Map<String, dynamic>)))
          : Value.absent(),
      seenOn: json.containsKey('seenOn')
          ? Value.present(json['seenOn'] == null
              ? null
              : List<CustomDate?>.unmodifiable((json['seenOn'] as List<dynamic>)
                  .map((_$e) => _$e == null ? null : customDateFromJson(_$e))
                  .toList()))
          : Value.absent(),
    );
  }

  /// 0-5 stars.
  final int stars;

  final Value<String> commentary;

  final Value<GColorInput> favorite_color;

  final Value<List<CustomDate?>> seenOn;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$starsValue = this.stars;
    _$result['stars'] = _$starsValue;
    final _$commentaryValue = this.commentary;
    if (_$commentaryValue.isPresent) {
      final _$commentaryRequired = _$commentaryValue.requireValue;
      _$result['commentary'] =
          _$commentaryRequired == null ? null : _$commentaryRequired;
    }
    final _$favorite_colorValue = this.favorite_color;
    if (_$favorite_colorValue.isPresent) {
      final _$favorite_colorRequired = _$favorite_colorValue.requireValue;
      _$result['favorite_color'] = _$favorite_colorRequired == null
          ? null
          : _$favorite_colorRequired.toJson();
    }
    final _$seenOnValue = this.seenOn;
    if (_$seenOnValue.isPresent) {
      final _$seenOnRequired = _$seenOnValue.requireValue;
      _$result['seenOn'] = _$seenOnRequired == null
          ? null
          : _$seenOnRequired
              .map((_$e) => _$e == null ? null : customDateToJson(_$e))
              .toList();
    }
    return _$result;
  }

  GReviewInput copyWith({
    int? stars,
    Value<String>? commentary,
    Value<GColorInput>? favorite_color,
    Value<List<CustomDate?>>? seenOn,
  }) {
    return GReviewInput(
      stars: stars ?? this.stars,
      commentary: commentary ?? this.commentary,
      favorite_color: favorite_color ?? this.favorite_color,
      seenOn: seenOn ?? this.seenOn,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GReviewInput(stars: $stars, commentary: $commentary, favorite_color: $favorite_color, seenOn: $seenOn)';
  }
}

/// OneOf input used to locate a review by exactly one criterion.
sealed class GReviewBy {
  const GReviewBy._();

  const factory GReviewBy.id({required String id}) = GReviewBy_id;

  const factory GReviewBy.createdAt({required CustomDate createdAt}) =
      GReviewBy_createdAt;

  factory GReviewBy.seenOn({required List<CustomDate?> seenOn}) =
      GReviewBy_seenOn;

  const factory GReviewBy.favorite_color(
      {required GColorInput favorite_color}) = GReviewBy_favorite_color;

  factory GReviewBy.fromJson(Map<String, dynamic> json) {
    if (json.length != 1) {
      throw ArgumentError.value(json, 'json',
          'Expected exactly one field for oneOf input object GReviewBy');
    }
    final _$entry = json.entries.single;
    final _$value = _$entry.value;
    switch (_$entry.key) {
      case r'id':
        if (_$value == null) {
          throw ArgumentError.notNull(r'id');
        }
        return GReviewBy.id(id: (_$value as String));
      case r'createdAt':
        if (_$value == null) {
          throw ArgumentError.notNull(r'createdAt');
        }
        return GReviewBy.createdAt(createdAt: customDateFromJson(_$value));
      case r'seenOn':
        if (_$value == null) {
          throw ArgumentError.notNull(r'seenOn');
        }
        return GReviewBy.seenOn(
            seenOn: List<CustomDate?>.unmodifiable((_$value as List<dynamic>)
                .map((_$e) => _$e == null ? null : customDateFromJson(_$e))
                .toList()));
      case r'favorite_color':
        if (_$value == null) {
          throw ArgumentError.notNull(r'favorite_color');
        }
        return GReviewBy.favorite_color(
            favorite_color:
                GColorInput.fromJson((_$value as Map<String, dynamic>)));
      default:
        throw ArgumentError.value(_$entry.key, 'json',
            'Unknown field for oneOf input object GReviewBy');
    }
  }

  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReviewBy && _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GReviewBy(${toJson()})';
  }
}

final class GReviewBy_id extends GReviewBy {
  const GReviewBy_id({required this.id}) : super._();

  final String id;

  @override
  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GReviewBy_id copyWith({String? id}) {
    return GReviewBy_id(id: id ?? this.id);
  }
}

final class GReviewBy_createdAt extends GReviewBy {
  const GReviewBy_createdAt({required this.createdAt}) : super._();

  final CustomDate createdAt;

  @override
  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$createdAtValue = this.createdAt;
    _$result['createdAt'] = customDateToJson(_$createdAtValue);
    return _$result;
  }

  GReviewBy_createdAt copyWith({CustomDate? createdAt}) {
    return GReviewBy_createdAt(createdAt: createdAt ?? this.createdAt);
  }
}

final class GReviewBy_seenOn extends GReviewBy {
  GReviewBy_seenOn({required List<CustomDate?> seenOn})
      : seenOn = List.unmodifiable(seenOn),
        super._();

  final List<CustomDate?> seenOn;

  @override
  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$seenOnValue = this.seenOn;
    _$result['seenOn'] = _$seenOnValue
        .map((_$e) => _$e == null ? null : customDateToJson(_$e))
        .toList();
    return _$result;
  }

  GReviewBy_seenOn copyWith({List<CustomDate?>? seenOn}) {
    return GReviewBy_seenOn(seenOn: seenOn ?? this.seenOn);
  }
}

final class GReviewBy_favorite_color extends GReviewBy {
  const GReviewBy_favorite_color({required this.favorite_color}) : super._();

  final GColorInput favorite_color;

  @override
  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$favorite_colorValue = this.favorite_color;
    _$result['favorite_color'] = _$favorite_colorValue.toJson();
    return _$result;
  }

  GReviewBy_favorite_color copyWith({GColorInput? favorite_color}) {
    return GReviewBy_favorite_color(
        favorite_color: favorite_color ?? this.favorite_color);
  }
}

class GCustomFieldInput {
  const GCustomFieldInput({
    required this.id,
    this.customField = const Value.absent(),
  });

  factory GCustomFieldInput.fromJson(Map<String, dynamic> json) {
    return GCustomFieldInput(
      id: (json['id'] as String),
      customField: json.containsKey('customField')
          ? Value.present(json['customField'] == null
              ? null
              : (json['customField'] as String))
          : Value.absent(),
    );
  }

  final String id;

  final Value<String> customField;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$customFieldValue = this.customField;
    if (_$customFieldValue.isPresent) {
      final _$customFieldRequired = _$customFieldValue.requireValue;
      _$result['customField'] =
          _$customFieldRequired == null ? null : _$customFieldRequired;
    }
    return _$result;
  }

  GCustomFieldInput copyWith({
    String? id,
    Value<String>? customField,
  }) {
    return GCustomFieldInput(
      id: id ?? this.id,
      customField: customField ?? this.customField,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCustomFieldInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCustomFieldInput(id: $id, customField: $customField)';
  }
}

class GColorInput {
  const GColorInput({
    required this.red,
    required this.green,
    required this.blue,
  });

  factory GColorInput.fromJson(Map<String, dynamic> json) {
    return GColorInput(
      red: (json['red'] as int),
      green: (json['green'] as int),
      blue: (json['blue'] as int),
    );
  }

  final int red;

  final int green;

  final int blue;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$redValue = this.red;
    _$result['red'] = _$redValue;
    final _$greenValue = this.green;
    _$result['green'] = _$greenValue;
    final _$blueValue = this.blue;
    _$result['blue'] = _$blueValue;
    return _$result;
  }

  GColorInput copyWith({
    int? red,
    int? green,
    int? blue,
  }) {
    return GColorInput(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GColorInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GColorInput(red: $red, green: $green, blue: $blue)';
  }
}

/// Repro input for duplicate null checks in generated schema toJson.
class GDuplicateNullChecksInput {
  const GDuplicateNullChecksInput({this.nullableText = const Value.absent()});

  factory GDuplicateNullChecksInput.fromJson(Map<String, dynamic> json) {
    return GDuplicateNullChecksInput(
        nullableText: json.containsKey('nullableText')
            ? Value.present(json['nullableText'] == null
                ? null
                : (json['nullableText'] as String))
            : Value.absent());
  }

  final Value<String> nullableText;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$nullableTextValue = this.nullableText;
    if (_$nullableTextValue.isPresent) {
      final _$nullableTextRequired = _$nullableTextValue.requireValue;
      _$result['nullableText'] =
          _$nullableTextRequired == null ? null : _$nullableTextRequired;
    }
    return _$result;
  }

  GDuplicateNullChecksInput copyWith({Value<String>? nullableText}) {
    return GDuplicateNullChecksInput(
        nullableText: nullableText ?? this.nullableText);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDuplicateNullChecksInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDuplicateNullChecksInput(nullableText: $nullableText)';
  }
}

class GPostLikesInput {
  const GPostLikesInput({required this.id});

  factory GPostLikesInput.fromJson(Map<String, dynamic> json) {
    return GPostLikesInput(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GPostLikesInput copyWith({String? id}) {
    return GPostLikesInput(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostLikesInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GPostLikesInput(id: $id)';
  }
}

class GPostFavoritesInput {
  const GPostFavoritesInput({required this.id});

  factory GPostFavoritesInput.fromJson(Map<String, dynamic> json) {
    return GPostFavoritesInput(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GPostFavoritesInput copyWith({String? id}) {
    return GPostFavoritesInput(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostFavoritesInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GPostFavoritesInput(id: $id)';
  }
}

const Map<String, Set<String>> possibleTypesMap = {
  'Character': {
    'Human',
    'Droid',
  },
  'Author': {
    'Person',
    'Company',
  },
  'Book': {
    'Textbook',
    'ColoringBook',
  },
  'B': {
    'Foo',
    'Bar',
  },
  'A': {
    'Foo',
    'Bar',
    'John',
  },
  'C': {'Other'},
  'D': {'Other'},
  'SearchResult': {
    'Human',
    'Droid',
    'Starship',
  },
};
