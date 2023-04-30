import 'package:normalize/utils.dart';

/// Exception occurring when structurally valid data cannot be resolved
/// for an expected field.
class PartialDataException implements Exception {
  const PartialDataException({required this.path});

  /// Path to the first unfound subfield.
  ///
  /// Is a list of field names stringified with [FieldKey]
  final List<String> path;

  /// Returns a copy of this exception with the given [fieldName] added to the
  /// path.
  PartialDataException copyWith({required String fieldName}) {
    return PartialDataException(path: [fieldName, ...path]);
  }

  @override
  String toString() => 'PartialDataException(path: ${path.join(".")})';
}

class MissingKeyFieldException implements Exception {
  const MissingKeyFieldException();
}

class DanglingReferenceException extends PartialDataException {
  const DanglingReferenceException({required List<String> path})
      : super(path: path);

  /// Returns a copy of this exception with the given [fieldName] added to the
  /// path.
  @override
  DanglingReferenceException copyWith({required String fieldName}) {
    return DanglingReferenceException(path: [fieldName, ...path]);
  }

  @override
  String toString() => 'DanglingReferenceException(path: ${path.join(".")})';
}
