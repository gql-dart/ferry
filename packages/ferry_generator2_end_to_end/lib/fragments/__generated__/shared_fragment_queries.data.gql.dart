// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// Author interface.
abstract class GSharedAuthorFragment {
  /// Display name for the author.
  String get displayName;
  String get G__typename;
}

abstract class GSharedAuthorFragment__asPerson
    implements GSharedAuthorFragment {
  String get firstName;
  String get lastName;
  String get G__typename;
}

abstract class GSharedAuthorFragment__asCompany
    implements GSharedAuthorFragment {
  String get name;
  String get G__typename;
}

/// Author interface.
sealed class GSharedAuthorFragmentData implements GSharedAuthorFragment {
  const GSharedAuthorFragmentData({
    required this.displayName,
    required this.G__typename,
  });

  factory GSharedAuthorFragmentData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Person':
        return GSharedAuthorFragmentData__asPerson.fromJson(json);
      case 'Company':
        return GSharedAuthorFragmentData__asCompany.fromJson(json);
      default:
        return GSharedAuthorFragmentData__unknown.fromJson(json);
    }
  }

  /// Display name for the author.
  final String displayName;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['displayName'] = this.displayName;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GSharedAuthorFragmentDataWhenExtension on GSharedAuthorFragmentData {
  _T when<_T>({
    required _T Function(GSharedAuthorFragmentData__asPerson) person,
    required _T Function(GSharedAuthorFragmentData__asCompany) company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(this as GSharedAuthorFragmentData__asPerson);
      case 'Company':
        return company(this as GSharedAuthorFragmentData__asCompany);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GSharedAuthorFragmentData__asPerson)? person,
    _T Function(GSharedAuthorFragmentData__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person == null
            ? orElse()
            : person(this as GSharedAuthorFragmentData__asPerson);
      case 'Company':
        return company == null
            ? orElse()
            : company(this as GSharedAuthorFragmentData__asCompany);
      default:
        return orElse();
    }
  }
}

class GSharedAuthorFragmentData__asPerson extends GSharedAuthorFragmentData
    implements GSharedAuthorFragment, GSharedAuthorFragment__asPerson {
  GSharedAuthorFragmentData__asPerson({
    required String displayName,
    required String G__typename,
    required this.firstName,
    required this.lastName,
  }) : super(displayName: displayName, G__typename: G__typename);

  factory GSharedAuthorFragmentData__asPerson.fromJson(
      Map<String, dynamic> json) {
    return GSharedAuthorFragmentData__asPerson(
      displayName: (json['displayName'] as String),
      G__typename: (json['__typename'] as String),
      firstName: (json['firstName'] as String),
      lastName: (json['lastName'] as String),
    );
  }

  final String firstName;

  final String lastName;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['firstName'] = this.firstName;
    _$result['lastName'] = this.lastName;
    return _$result;
  }

  GSharedAuthorFragmentData__asPerson copyWith({
    String? displayName,
    String? G__typename,
    String? firstName,
    String? lastName,
  }) {
    return GSharedAuthorFragmentData__asPerson(
      displayName: displayName ?? this.displayName,
      G__typename: G__typename ?? this.G__typename,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedAuthorFragmentData__asPerson &&
            displayName == other.displayName &&
            G__typename == other.G__typename &&
            firstName == other.firstName &&
            lastName == other.lastName);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, displayName, G__typename, firstName, lastName);
  }

  @override
  String toString() {
    return 'GSharedAuthorFragmentData__asPerson(displayName: $displayName, G__typename: $G__typename, firstName: $firstName, lastName: $lastName)';
  }
}

class GSharedAuthorFragmentData__asCompany extends GSharedAuthorFragmentData
    implements GSharedAuthorFragment, GSharedAuthorFragment__asCompany {
  GSharedAuthorFragmentData__asCompany({
    required String displayName,
    required String G__typename,
    required this.name,
  }) : super(displayName: displayName, G__typename: G__typename);

  factory GSharedAuthorFragmentData__asCompany.fromJson(
      Map<String, dynamic> json) {
    return GSharedAuthorFragmentData__asCompany(
      displayName: (json['displayName'] as String),
      G__typename: (json['__typename'] as String),
      name: (json['name'] as String),
    );
  }

  final String name;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['name'] = this.name;
    return _$result;
  }

  GSharedAuthorFragmentData__asCompany copyWith({
    String? displayName,
    String? G__typename,
    String? name,
  }) {
    return GSharedAuthorFragmentData__asCompany(
      displayName: displayName ?? this.displayName,
      G__typename: G__typename ?? this.G__typename,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedAuthorFragmentData__asCompany &&
            displayName == other.displayName &&
            G__typename == other.G__typename &&
            name == other.name);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, displayName, G__typename, name);
  }

  @override
  String toString() {
    return 'GSharedAuthorFragmentData__asCompany(displayName: $displayName, G__typename: $G__typename, name: $name)';
  }
}

/// Author interface.
class GSharedAuthorFragmentData__unknown extends GSharedAuthorFragmentData
    implements GSharedAuthorFragment {
  GSharedAuthorFragmentData__unknown({
    required String displayName,
    required String G__typename,
  }) : super(displayName: displayName, G__typename: G__typename);

  factory GSharedAuthorFragmentData__unknown.fromJson(
      Map<String, dynamic> json) {
    return GSharedAuthorFragmentData__unknown(
      displayName: (json['displayName'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GSharedAuthorFragmentData__unknown copyWith({
    String? displayName,
    String? G__typename,
  }) {
    return GSharedAuthorFragmentData__unknown(
      displayName: displayName ?? this.displayName,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedAuthorFragmentData__unknown &&
            displayName == other.displayName &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, displayName, G__typename);
  }

  @override
  String toString() {
    return 'GSharedAuthorFragmentData__unknown(displayName: $displayName, G__typename: $G__typename)';
  }
}

/// Book interface.
abstract class GSharedBookFragment {
  /// Book title.
  String get title;
  GSharedAuthorFragment get author;
  List<List<String>> get tagMatrix;
  List<List<String?>?>? get tagMatrixNullable;
  List<List<GSharedBookFragment_relatedBooks>> get relatedBooks;
  String get G__typename;
}

/// Book interface.
abstract class GSharedBookFragment_relatedBooks {
  /// Book title.
  String get title;
  GSharedAuthorFragment get author;
  String get G__typename;
}

abstract class GSharedBookFragment__asTextbook implements GSharedBookFragment {
  List<String> get courses;
  String get G__typename;
}

abstract class GSharedBookFragment__asColoringBook
    implements GSharedBookFragment {
  List<String> get colors;
  String get G__typename;
}

/// Book interface.
sealed class GSharedBookFragmentData implements GSharedBookFragment {
  GSharedBookFragmentData({
    required this.title,
    required this.author,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GSharedBookFragmentData_relatedBooks>> relatedBooks,
    required this.G__typename,
  })  : tagMatrix = List.unmodifiable(tagMatrix),
        tagMatrixNullable = tagMatrixNullable == null
            ? null
            : List.unmodifiable(tagMatrixNullable),
        relatedBooks = List.unmodifiable(relatedBooks);

  factory GSharedBookFragmentData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Textbook':
        return GSharedBookFragmentData__asTextbook.fromJson(json);
      case 'ColoringBook':
        return GSharedBookFragmentData__asColoringBook.fromJson(json);
      default:
        return GSharedBookFragmentData__unknown.fromJson(json);
    }
  }

  /// Book title.
  final String title;

  final GSharedAuthorFragmentData author;

  final List<List<String>> tagMatrix;

  final List<List<String?>?>? tagMatrixNullable;

  final List<List<GSharedBookFragmentData_relatedBooks>> relatedBooks;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['title'] = this.title;
    _$result['author'] = this.author.toJson();
    _$result['tagMatrix'] =
        this.tagMatrix.map((_$e) => _$e.map((_$e) => _$e).toList()).toList();
    final _$tagMatrixNullableValue = this.tagMatrixNullable;
    _$result['tagMatrixNullable'] = _$tagMatrixNullableValue == null
        ? null
        : _$tagMatrixNullableValue
            .map((_$e) => _$e == null
                ? null
                : _$e.map((_$e) => _$e == null ? null : _$e).toList())
            .toList();
    _$result['relatedBooks'] = this
        .relatedBooks
        .map((_$e) => _$e.map((_$e) => _$e.toJson()).toList())
        .toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GSharedBookFragmentDataWhenExtension on GSharedBookFragmentData {
  _T when<_T>({
    required _T Function(GSharedBookFragmentData__asTextbook) textbook,
    required _T Function(GSharedBookFragmentData__asColoringBook) coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook(this as GSharedBookFragmentData__asTextbook);
      case 'ColoringBook':
        return coloringBook(this as GSharedBookFragmentData__asColoringBook);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GSharedBookFragmentData__asTextbook)? textbook,
    _T Function(GSharedBookFragmentData__asColoringBook)? coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook == null
            ? orElse()
            : textbook(this as GSharedBookFragmentData__asTextbook);
      case 'ColoringBook':
        return coloringBook == null
            ? orElse()
            : coloringBook(this as GSharedBookFragmentData__asColoringBook);
      default:
        return orElse();
    }
  }
}

/// Book interface.
class GSharedBookFragmentData_relatedBooks
    implements GSharedBookFragment_relatedBooks {
  const GSharedBookFragmentData_relatedBooks({
    required this.title,
    required this.author,
    required this.G__typename,
  });

  factory GSharedBookFragmentData_relatedBooks.fromJson(
      Map<String, dynamic> json) {
    return GSharedBookFragmentData_relatedBooks(
      title: (json['title'] as String),
      author: GSharedAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Book title.
  final String title;

  final GSharedAuthorFragmentData author;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['title'] = this.title;
    _$result['author'] = this.author.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSharedBookFragmentData_relatedBooks copyWith({
    String? title,
    GSharedAuthorFragmentData? author,
    String? G__typename,
  }) {
    return GSharedBookFragmentData_relatedBooks(
      title: title ?? this.title,
      author: author ?? this.author,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedBookFragmentData_relatedBooks &&
            title == other.title &&
            author == other.author &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, title, author, G__typename);
  }

  @override
  String toString() {
    return 'GSharedBookFragmentData_relatedBooks(title: $title, author: $author, G__typename: $G__typename)';
  }
}

class GSharedBookFragmentData__asTextbook extends GSharedBookFragmentData
    implements GSharedBookFragment, GSharedBookFragment__asTextbook {
  GSharedBookFragmentData__asTextbook({
    required String title,
    required GSharedAuthorFragmentData author,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GSharedBookFragmentData_relatedBooks>> relatedBooks,
    required String G__typename,
    required List<String> courses,
  })  : courses = List.unmodifiable(courses),
        super(
            title: title,
            author: author,
            tagMatrix: tagMatrix,
            tagMatrixNullable: tagMatrixNullable,
            relatedBooks: relatedBooks,
            G__typename: G__typename);

  factory GSharedBookFragmentData__asTextbook.fromJson(
      Map<String, dynamic> json) {
    return GSharedBookFragmentData__asTextbook(
      title: (json['title'] as String),
      author: GSharedAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      tagMatrix: List<List<String>>.unmodifiable(
          (json['tagMatrix'] as List<dynamic>)
              .map((_$e) => List<String>.unmodifiable(
                  List<String>.from((_$e as List<dynamic>))))
              .toList()),
      tagMatrixNullable: json['tagMatrixNullable'] == null
          ? null
          : List<List<String?>?>.unmodifiable(
              (json['tagMatrixNullable'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : List<String?>.unmodifiable(
                          List<String?>.from((_$e as List<dynamic>))))
                  .toList()),
      relatedBooks:
          List<List<GSharedBookFragmentData_relatedBooks>>.unmodifiable(
              (json['relatedBooks'] as List<dynamic>)
                  .map((_$e) =>
                      List<GSharedBookFragmentData_relatedBooks>.unmodifiable(
                          (_$e as List<dynamic>)
                              .map((_$e) =>
                                  GSharedBookFragmentData_relatedBooks.fromJson(
                                      (_$e as Map<String, dynamic>)))
                              .toList()))
                  .toList()),
      G__typename: (json['__typename'] as String),
      courses: List<String>.unmodifiable(
          List<String>.from((json['courses'] as List<dynamic>))),
    );
  }

  final List<String> courses;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['courses'] = this.courses.map((_$e) => _$e).toList();
    return _$result;
  }

  GSharedBookFragmentData__asTextbook copyWith({
    String? title,
    GSharedAuthorFragmentData? author,
    List<List<String>>? tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    bool tagMatrixNullableIsSet = false,
    List<List<GSharedBookFragmentData_relatedBooks>>? relatedBooks,
    String? G__typename,
    List<String>? courses,
  }) {
    return GSharedBookFragmentData__asTextbook(
      title: title ?? this.title,
      author: author ?? this.author,
      tagMatrix: tagMatrix ?? this.tagMatrix,
      tagMatrixNullable:
          tagMatrixNullableIsSet ? tagMatrixNullable : this.tagMatrixNullable,
      relatedBooks: relatedBooks ?? this.relatedBooks,
      G__typename: G__typename ?? this.G__typename,
      courses: courses ?? this.courses,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedBookFragmentData__asTextbook &&
            title == other.title &&
            author == other.author &&
            _gqlUtils.listEqualsDeep(tagMatrix, other.tagMatrix) &&
            _gqlUtils.listEqualsDeep(
                tagMatrixNullable, other.tagMatrixNullable) &&
            _gqlUtils.listEqualsDeep(relatedBooks, other.relatedBooks) &&
            G__typename == other.G__typename &&
            _gqlUtils.listEquals(courses, other.courses));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        title,
        author,
        _gqlUtils.listHashDeep(tagMatrix),
        _gqlUtils.listHashDeep(tagMatrixNullable),
        _gqlUtils.listHashDeep(relatedBooks),
        G__typename,
        _gqlUtils.listHash(courses));
  }

  @override
  String toString() {
    return 'GSharedBookFragmentData__asTextbook(title: $title, author: $author, tagMatrix: $tagMatrix, tagMatrixNullable: $tagMatrixNullable, relatedBooks: $relatedBooks, G__typename: $G__typename, courses: $courses)';
  }
}

class GSharedBookFragmentData__asColoringBook extends GSharedBookFragmentData
    implements GSharedBookFragment, GSharedBookFragment__asColoringBook {
  GSharedBookFragmentData__asColoringBook({
    required String title,
    required GSharedAuthorFragmentData author,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GSharedBookFragmentData_relatedBooks>> relatedBooks,
    required String G__typename,
    required List<String> colors,
  })  : colors = List.unmodifiable(colors),
        super(
            title: title,
            author: author,
            tagMatrix: tagMatrix,
            tagMatrixNullable: tagMatrixNullable,
            relatedBooks: relatedBooks,
            G__typename: G__typename);

  factory GSharedBookFragmentData__asColoringBook.fromJson(
      Map<String, dynamic> json) {
    return GSharedBookFragmentData__asColoringBook(
      title: (json['title'] as String),
      author: GSharedAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      tagMatrix: List<List<String>>.unmodifiable(
          (json['tagMatrix'] as List<dynamic>)
              .map((_$e) => List<String>.unmodifiable(
                  List<String>.from((_$e as List<dynamic>))))
              .toList()),
      tagMatrixNullable: json['tagMatrixNullable'] == null
          ? null
          : List<List<String?>?>.unmodifiable(
              (json['tagMatrixNullable'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : List<String?>.unmodifiable(
                          List<String?>.from((_$e as List<dynamic>))))
                  .toList()),
      relatedBooks:
          List<List<GSharedBookFragmentData_relatedBooks>>.unmodifiable(
              (json['relatedBooks'] as List<dynamic>)
                  .map((_$e) =>
                      List<GSharedBookFragmentData_relatedBooks>.unmodifiable(
                          (_$e as List<dynamic>)
                              .map((_$e) =>
                                  GSharedBookFragmentData_relatedBooks.fromJson(
                                      (_$e as Map<String, dynamic>)))
                              .toList()))
                  .toList()),
      G__typename: (json['__typename'] as String),
      colors: List<String>.unmodifiable(
          List<String>.from((json['colors'] as List<dynamic>))),
    );
  }

  final List<String> colors;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['colors'] = this.colors.map((_$e) => _$e).toList();
    return _$result;
  }

  GSharedBookFragmentData__asColoringBook copyWith({
    String? title,
    GSharedAuthorFragmentData? author,
    List<List<String>>? tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    bool tagMatrixNullableIsSet = false,
    List<List<GSharedBookFragmentData_relatedBooks>>? relatedBooks,
    String? G__typename,
    List<String>? colors,
  }) {
    return GSharedBookFragmentData__asColoringBook(
      title: title ?? this.title,
      author: author ?? this.author,
      tagMatrix: tagMatrix ?? this.tagMatrix,
      tagMatrixNullable:
          tagMatrixNullableIsSet ? tagMatrixNullable : this.tagMatrixNullable,
      relatedBooks: relatedBooks ?? this.relatedBooks,
      G__typename: G__typename ?? this.G__typename,
      colors: colors ?? this.colors,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedBookFragmentData__asColoringBook &&
            title == other.title &&
            author == other.author &&
            _gqlUtils.listEqualsDeep(tagMatrix, other.tagMatrix) &&
            _gqlUtils.listEqualsDeep(
                tagMatrixNullable, other.tagMatrixNullable) &&
            _gqlUtils.listEqualsDeep(relatedBooks, other.relatedBooks) &&
            G__typename == other.G__typename &&
            _gqlUtils.listEquals(colors, other.colors));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        title,
        author,
        _gqlUtils.listHashDeep(tagMatrix),
        _gqlUtils.listHashDeep(tagMatrixNullable),
        _gqlUtils.listHashDeep(relatedBooks),
        G__typename,
        _gqlUtils.listHash(colors));
  }

  @override
  String toString() {
    return 'GSharedBookFragmentData__asColoringBook(title: $title, author: $author, tagMatrix: $tagMatrix, tagMatrixNullable: $tagMatrixNullable, relatedBooks: $relatedBooks, G__typename: $G__typename, colors: $colors)';
  }
}

/// Book interface.
class GSharedBookFragmentData__unknown extends GSharedBookFragmentData
    implements GSharedBookFragment {
  GSharedBookFragmentData__unknown({
    required String title,
    required GSharedAuthorFragmentData author,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GSharedBookFragmentData_relatedBooks>> relatedBooks,
    required String G__typename,
  }) : super(
            title: title,
            author: author,
            tagMatrix: tagMatrix,
            tagMatrixNullable: tagMatrixNullable,
            relatedBooks: relatedBooks,
            G__typename: G__typename);

  factory GSharedBookFragmentData__unknown.fromJson(Map<String, dynamic> json) {
    return GSharedBookFragmentData__unknown(
      title: (json['title'] as String),
      author: GSharedAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      tagMatrix: List<List<String>>.unmodifiable(
          (json['tagMatrix'] as List<dynamic>)
              .map((_$e) => List<String>.unmodifiable(
                  List<String>.from((_$e as List<dynamic>))))
              .toList()),
      tagMatrixNullable: json['tagMatrixNullable'] == null
          ? null
          : List<List<String?>?>.unmodifiable(
              (json['tagMatrixNullable'] as List<dynamic>)
                  .map((_$e) => _$e == null
                      ? null
                      : List<String?>.unmodifiable(
                          List<String?>.from((_$e as List<dynamic>))))
                  .toList()),
      relatedBooks:
          List<List<GSharedBookFragmentData_relatedBooks>>.unmodifiable(
              (json['relatedBooks'] as List<dynamic>)
                  .map((_$e) =>
                      List<GSharedBookFragmentData_relatedBooks>.unmodifiable(
                          (_$e as List<dynamic>)
                              .map((_$e) =>
                                  GSharedBookFragmentData_relatedBooks.fromJson(
                                      (_$e as Map<String, dynamic>)))
                              .toList()))
                  .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GSharedBookFragmentData__unknown copyWith({
    String? title,
    GSharedAuthorFragmentData? author,
    List<List<String>>? tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    bool tagMatrixNullableIsSet = false,
    List<List<GSharedBookFragmentData_relatedBooks>>? relatedBooks,
    String? G__typename,
  }) {
    return GSharedBookFragmentData__unknown(
      title: title ?? this.title,
      author: author ?? this.author,
      tagMatrix: tagMatrix ?? this.tagMatrix,
      tagMatrixNullable:
          tagMatrixNullableIsSet ? tagMatrixNullable : this.tagMatrixNullable,
      relatedBooks: relatedBooks ?? this.relatedBooks,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedBookFragmentData__unknown &&
            title == other.title &&
            author == other.author &&
            _gqlUtils.listEqualsDeep(tagMatrix, other.tagMatrix) &&
            _gqlUtils.listEqualsDeep(
                tagMatrixNullable, other.tagMatrixNullable) &&
            _gqlUtils.listEqualsDeep(relatedBooks, other.relatedBooks) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        title,
        author,
        _gqlUtils.listHashDeep(tagMatrix),
        _gqlUtils.listHashDeep(tagMatrixNullable),
        _gqlUtils.listHashDeep(relatedBooks),
        G__typename);
  }

  @override
  String toString() {
    return 'GSharedBookFragmentData__unknown(title: $title, author: $author, tagMatrix: $tagMatrix, tagMatrixNullable: $tagMatrixNullable, relatedBooks: $relatedBooks, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GSharedBooksAData {
  GSharedBooksAData({
    required List<GSharedBookFragmentData> books,
    required this.G__typename,
  }) : books = List.unmodifiable(books);

  factory GSharedBooksAData.fromJson(Map<String, dynamic> json) {
    return GSharedBooksAData(
      books: List<GSharedBookFragmentData>.unmodifiable((json['books']
              as List<dynamic>)
          .map((_$e) =>
              GSharedBookFragmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GSharedBookFragmentData> books;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['books'] = this.books.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSharedBooksAData copyWith({
    List<GSharedBookFragmentData>? books,
    String? G__typename,
  }) {
    return GSharedBooksAData(
      books: books ?? this.books,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedBooksAData &&
            _gqlUtils.listEquals(books, other.books) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(books), G__typename);
  }

  @override
  String toString() {
    return 'GSharedBooksAData(books: $books, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GSharedBooksBData {
  GSharedBooksBData({
    required List<GSharedBookFragmentData> books,
    required this.G__typename,
  }) : books = List.unmodifiable(books);

  factory GSharedBooksBData.fromJson(Map<String, dynamic> json) {
    return GSharedBooksBData(
      books: List<GSharedBookFragmentData>.unmodifiable((json['books']
              as List<dynamic>)
          .map((_$e) =>
              GSharedBookFragmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GSharedBookFragmentData> books;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['books'] = this.books.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSharedBooksBData copyWith({
    List<GSharedBookFragmentData>? books,
    String? G__typename,
  }) {
    return GSharedBooksBData(
      books: books ?? this.books,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSharedBooksBData &&
            _gqlUtils.listEquals(books, other.books) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(books), G__typename);
  }

  @override
  String toString() {
    return 'GSharedBooksBData(books: $books, G__typename: $G__typename)';
  }
}
