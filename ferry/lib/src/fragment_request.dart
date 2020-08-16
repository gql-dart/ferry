import "package:gql/ast.dart";

abstract class FragmentRequest<TData, TVars> {
  TVars get vars;

  DocumentNode get document;

  String get fragmentName;

  /// A map of id fields, based on [TypePolicy.keyFields] for the given type,
  /// and their respective values. By default, `id` or `_id` are used.
  ///
  /// To return a record with `id`: `1234`, pass the following map:
  /// ```
  /// {
  ///   "id": "1234"
  /// }
  /// ```
  Map<String, dynamic> get idFields;

  /// This is a simple wrapper on the static fromJson method on the generated class.
  TData parseData(Map<String, dynamic> json);
}
