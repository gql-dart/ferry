// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// Author interface.
abstract class GAuthorFragment {
  /// Display name for the author.
  String get displayName;
  String get G__typename;
}

abstract class GAuthorFragment__asPerson implements GAuthorFragment {
  String get firstName;
  String get lastName;
  String get G__typename;
}

abstract class GAuthorFragment__asCompany implements GAuthorFragment {
  String get name;
  String get G__typename;
}

/// Author interface.
sealed class GAuthorFragmentData implements GAuthorFragment {
  const GAuthorFragmentData({
    required this.displayName,
    required this.G__typename,
  });

  factory GAuthorFragmentData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Person':
        return GAuthorFragmentData__asPerson.fromJson(json);
      case 'Company':
        return GAuthorFragmentData__asCompany.fromJson(json);
      default:
        return GAuthorFragmentData__unknown.fromJson(json);
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

extension GAuthorFragmentDataWhenExtension on GAuthorFragmentData {
  _T when<_T>({
    required _T Function(GAuthorFragmentData__asPerson) person,
    required _T Function(GAuthorFragmentData__asCompany) company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(this as GAuthorFragmentData__asPerson);
      case 'Company':
        return company(this as GAuthorFragmentData__asCompany);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorFragmentData__asPerson)? person,
    _T Function(GAuthorFragmentData__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person == null
            ? orElse()
            : person(this as GAuthorFragmentData__asPerson);
      case 'Company':
        return company == null
            ? orElse()
            : company(this as GAuthorFragmentData__asCompany);
      default:
        return orElse();
    }
  }
}

class GAuthorFragmentData__asPerson extends GAuthorFragmentData
    implements GAuthorFragment, GAuthorFragment__asPerson {
  GAuthorFragmentData__asPerson({
    required String displayName,
    required String G__typename,
    required this.firstName,
    required this.lastName,
  }) : super(displayName: displayName, G__typename: G__typename);

  factory GAuthorFragmentData__asPerson.fromJson(Map<String, dynamic> json) {
    return GAuthorFragmentData__asPerson(
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

  GAuthorFragmentData__asPerson copyWith({
    String? displayName,
    String? G__typename,
    String? firstName,
    String? lastName,
  }) {
    return GAuthorFragmentData__asPerson(
      displayName: displayName ?? this.displayName,
      G__typename: G__typename ?? this.G__typename,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAuthorFragmentData__asPerson &&
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
    return 'GAuthorFragmentData__asPerson(displayName: $displayName, G__typename: $G__typename, firstName: $firstName, lastName: $lastName)';
  }
}

class GAuthorFragmentData__asCompany extends GAuthorFragmentData
    implements GAuthorFragment, GAuthorFragment__asCompany {
  GAuthorFragmentData__asCompany({
    required String displayName,
    required String G__typename,
    required this.name,
  }) : super(displayName: displayName, G__typename: G__typename);

  factory GAuthorFragmentData__asCompany.fromJson(Map<String, dynamic> json) {
    return GAuthorFragmentData__asCompany(
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

  GAuthorFragmentData__asCompany copyWith({
    String? displayName,
    String? G__typename,
    String? name,
  }) {
    return GAuthorFragmentData__asCompany(
      displayName: displayName ?? this.displayName,
      G__typename: G__typename ?? this.G__typename,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAuthorFragmentData__asCompany &&
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
    return 'GAuthorFragmentData__asCompany(displayName: $displayName, G__typename: $G__typename, name: $name)';
  }
}

/// Author interface.
class GAuthorFragmentData__unknown extends GAuthorFragmentData
    implements GAuthorFragment {
  GAuthorFragmentData__unknown({
    required String displayName,
    required String G__typename,
  }) : super(displayName: displayName, G__typename: G__typename);

  factory GAuthorFragmentData__unknown.fromJson(Map<String, dynamic> json) {
    return GAuthorFragmentData__unknown(
      displayName: (json['displayName'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GAuthorFragmentData__unknown copyWith({
    String? displayName,
    String? G__typename,
  }) {
    return GAuthorFragmentData__unknown(
      displayName: displayName ?? this.displayName,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAuthorFragmentData__unknown &&
            displayName == other.displayName &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, displayName, G__typename);
  }

  @override
  String toString() {
    return 'GAuthorFragmentData__unknown(displayName: $displayName, G__typename: $G__typename)';
  }
}

/// Book interface.
abstract class GBookFragment {
  GAuthorFragment get author;

  /// Book title.
  String get title;
  List<List<String>> get tagMatrix;
  List<List<String?>?>? get tagMatrixNullable;
  List<List<GBookFragment_relatedBooks>> get relatedBooks;
  String get G__typename;
}

/// Book interface.
abstract class GBookFragment_relatedBooks {
  /// Book title.
  String get title;
  GAuthorFragment get author;
  String get G__typename;
}

abstract class GBookFragment__asTextbook implements GBookFragment {
  List<String> get courses;
  String get G__typename;
}

abstract class GBookFragment__asColoringBook implements GBookFragment {
  List<String> get colors;
  String get G__typename;
}

/// Book interface.
sealed class GBookFragmentData implements GBookFragment {
  GBookFragmentData({
    required this.author,
    required this.title,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GBookFragmentData_relatedBooks>> relatedBooks,
    required this.G__typename,
  })  : tagMatrix = List.unmodifiable(tagMatrix),
        tagMatrixNullable = tagMatrixNullable == null
            ? null
            : List.unmodifiable(tagMatrixNullable),
        relatedBooks = List.unmodifiable(relatedBooks);

  factory GBookFragmentData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Textbook':
        return GBookFragmentData__asTextbook.fromJson(json);
      case 'ColoringBook':
        return GBookFragmentData__asColoringBook.fromJson(json);
      default:
        return GBookFragmentData__unknown.fromJson(json);
    }
  }

  final GAuthorFragmentData author;

  /// Book title.
  final String title;

  final List<List<String>> tagMatrix;

  final List<List<String?>?>? tagMatrixNullable;

  final List<List<GBookFragmentData_relatedBooks>> relatedBooks;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['author'] = this.author.toJson();
    _$result['title'] = this.title;
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

extension GBookFragmentDataWhenExtension on GBookFragmentData {
  _T when<_T>({
    required _T Function(GBookFragmentData__asTextbook) textbook,
    required _T Function(GBookFragmentData__asColoringBook) coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook(this as GBookFragmentData__asTextbook);
      case 'ColoringBook':
        return coloringBook(this as GBookFragmentData__asColoringBook);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__asTextbook)? textbook,
    _T Function(GBookFragmentData__asColoringBook)? coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook == null
            ? orElse()
            : textbook(this as GBookFragmentData__asTextbook);
      case 'ColoringBook':
        return coloringBook == null
            ? orElse()
            : coloringBook(this as GBookFragmentData__asColoringBook);
      default:
        return orElse();
    }
  }
}

/// Book interface.
class GBookFragmentData_relatedBooks implements GBookFragment_relatedBooks {
  const GBookFragmentData_relatedBooks({
    required this.title,
    required this.author,
    required this.G__typename,
  });

  factory GBookFragmentData_relatedBooks.fromJson(Map<String, dynamic> json) {
    return GBookFragmentData_relatedBooks(
      title: (json['title'] as String),
      author: GAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  /// Book title.
  final String title;

  final GAuthorFragmentData author;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['title'] = this.title;
    _$result['author'] = this.author.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GBookFragmentData_relatedBooks copyWith({
    String? title,
    GAuthorFragmentData? author,
    String? G__typename,
  }) {
    return GBookFragmentData_relatedBooks(
      title: title ?? this.title,
      author: author ?? this.author,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GBookFragmentData_relatedBooks &&
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
    return 'GBookFragmentData_relatedBooks(title: $title, author: $author, G__typename: $G__typename)';
  }
}

class GBookFragmentData__asTextbook extends GBookFragmentData
    implements GBookFragment, GBookFragment__asTextbook {
  GBookFragmentData__asTextbook({
    required GAuthorFragmentData author,
    required String title,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GBookFragmentData_relatedBooks>> relatedBooks,
    required String G__typename,
    required List<String> courses,
  })  : courses = List.unmodifiable(courses),
        super(
            author: author,
            title: title,
            tagMatrix: tagMatrix,
            tagMatrixNullable: tagMatrixNullable,
            relatedBooks: relatedBooks,
            G__typename: G__typename);

  factory GBookFragmentData__asTextbook.fromJson(Map<String, dynamic> json) {
    return GBookFragmentData__asTextbook(
      author: GAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      title: (json['title'] as String),
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
      relatedBooks: List<List<GBookFragmentData_relatedBooks>>.unmodifiable(
          (json['relatedBooks'] as List<dynamic>)
              .map((_$e) => List<GBookFragmentData_relatedBooks>.unmodifiable(
                  (_$e as List<dynamic>)
                      .map((_$e) => GBookFragmentData_relatedBooks.fromJson(
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

  GBookFragmentData__asTextbook copyWith({
    GAuthorFragmentData? author,
    String? title,
    List<List<String>>? tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    bool tagMatrixNullableIsSet = false,
    List<List<GBookFragmentData_relatedBooks>>? relatedBooks,
    String? G__typename,
    List<String>? courses,
  }) {
    return GBookFragmentData__asTextbook(
      author: author ?? this.author,
      title: title ?? this.title,
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
        (other is GBookFragmentData__asTextbook &&
            author == other.author &&
            title == other.title &&
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
        author,
        title,
        _gqlUtils.listHashDeep(tagMatrix),
        _gqlUtils.listHashDeep(tagMatrixNullable),
        _gqlUtils.listHashDeep(relatedBooks),
        G__typename,
        _gqlUtils.listHash(courses));
  }

  @override
  String toString() {
    return 'GBookFragmentData__asTextbook(author: $author, title: $title, tagMatrix: $tagMatrix, tagMatrixNullable: $tagMatrixNullable, relatedBooks: $relatedBooks, G__typename: $G__typename, courses: $courses)';
  }
}

class GBookFragmentData__asColoringBook extends GBookFragmentData
    implements GBookFragment, GBookFragment__asColoringBook {
  GBookFragmentData__asColoringBook({
    required GAuthorFragmentData author,
    required String title,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GBookFragmentData_relatedBooks>> relatedBooks,
    required String G__typename,
    required List<String> colors,
  })  : colors = List.unmodifiable(colors),
        super(
            author: author,
            title: title,
            tagMatrix: tagMatrix,
            tagMatrixNullable: tagMatrixNullable,
            relatedBooks: relatedBooks,
            G__typename: G__typename);

  factory GBookFragmentData__asColoringBook.fromJson(
      Map<String, dynamic> json) {
    return GBookFragmentData__asColoringBook(
      author: GAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      title: (json['title'] as String),
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
      relatedBooks: List<List<GBookFragmentData_relatedBooks>>.unmodifiable(
          (json['relatedBooks'] as List<dynamic>)
              .map((_$e) => List<GBookFragmentData_relatedBooks>.unmodifiable(
                  (_$e as List<dynamic>)
                      .map((_$e) => GBookFragmentData_relatedBooks.fromJson(
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

  GBookFragmentData__asColoringBook copyWith({
    GAuthorFragmentData? author,
    String? title,
    List<List<String>>? tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    bool tagMatrixNullableIsSet = false,
    List<List<GBookFragmentData_relatedBooks>>? relatedBooks,
    String? G__typename,
    List<String>? colors,
  }) {
    return GBookFragmentData__asColoringBook(
      author: author ?? this.author,
      title: title ?? this.title,
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
        (other is GBookFragmentData__asColoringBook &&
            author == other.author &&
            title == other.title &&
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
        author,
        title,
        _gqlUtils.listHashDeep(tagMatrix),
        _gqlUtils.listHashDeep(tagMatrixNullable),
        _gqlUtils.listHashDeep(relatedBooks),
        G__typename,
        _gqlUtils.listHash(colors));
  }

  @override
  String toString() {
    return 'GBookFragmentData__asColoringBook(author: $author, title: $title, tagMatrix: $tagMatrix, tagMatrixNullable: $tagMatrixNullable, relatedBooks: $relatedBooks, G__typename: $G__typename, colors: $colors)';
  }
}

/// Book interface.
class GBookFragmentData__unknown extends GBookFragmentData
    implements GBookFragment {
  GBookFragmentData__unknown({
    required GAuthorFragmentData author,
    required String title,
    required List<List<String>> tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    required List<List<GBookFragmentData_relatedBooks>> relatedBooks,
    required String G__typename,
  }) : super(
            author: author,
            title: title,
            tagMatrix: tagMatrix,
            tagMatrixNullable: tagMatrixNullable,
            relatedBooks: relatedBooks,
            G__typename: G__typename);

  factory GBookFragmentData__unknown.fromJson(Map<String, dynamic> json) {
    return GBookFragmentData__unknown(
      author: GAuthorFragmentData.fromJson(
          (json['author'] as Map<String, dynamic>)),
      title: (json['title'] as String),
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
      relatedBooks: List<List<GBookFragmentData_relatedBooks>>.unmodifiable(
          (json['relatedBooks'] as List<dynamic>)
              .map((_$e) => List<GBookFragmentData_relatedBooks>.unmodifiable(
                  (_$e as List<dynamic>)
                      .map((_$e) => GBookFragmentData_relatedBooks.fromJson(
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

  GBookFragmentData__unknown copyWith({
    GAuthorFragmentData? author,
    String? title,
    List<List<String>>? tagMatrix,
    List<List<String?>?>? tagMatrixNullable,
    bool tagMatrixNullableIsSet = false,
    List<List<GBookFragmentData_relatedBooks>>? relatedBooks,
    String? G__typename,
  }) {
    return GBookFragmentData__unknown(
      author: author ?? this.author,
      title: title ?? this.title,
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
        (other is GBookFragmentData__unknown &&
            author == other.author &&
            title == other.title &&
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
        author,
        title,
        _gqlUtils.listHashDeep(tagMatrix),
        _gqlUtils.listHashDeep(tagMatrixNullable),
        _gqlUtils.listHashDeep(relatedBooks),
        G__typename);
  }

  @override
  String toString() {
    return 'GBookFragmentData__unknown(author: $author, title: $title, tagMatrix: $tagMatrix, tagMatrixNullable: $tagMatrixNullable, relatedBooks: $relatedBooks, G__typename: $G__typename)';
  }
}

/// The query type for the schema.
class GGetBooksData {
  GGetBooksData({
    required List<GBookFragmentData> books,
    required this.G__typename,
  }) : books = List.unmodifiable(books);

  factory GGetBooksData.fromJson(Map<String, dynamic> json) {
    return GGetBooksData(
      books: List<GBookFragmentData>.unmodifiable(
          (json['books'] as List<dynamic>)
              .map((_$e) =>
                  GBookFragmentData.fromJson((_$e as Map<String, dynamic>)))
              .toList()),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GBookFragmentData> books;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['books'] = this.books.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetBooksData copyWith({
    List<GBookFragmentData>? books,
    String? G__typename,
  }) {
    return GGetBooksData(
      books: books ?? this.books,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetBooksData &&
            _gqlUtils.listEquals(books, other.books) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(books), G__typename);
  }

  @override
  String toString() {
    return 'GGetBooksData(books: $books, G__typename: $G__typename)';
  }
}
