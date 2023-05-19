import './field_policy.dart';

class TypePolicy {
  /// Allows defining the primary key fields for this type.
  ///
  /// Pass a `true` value for any fields you wish to use as key fields. You can
  /// also use child fields.
  ///
  /// ```dart
  /// const bookTypePolicy = TypePolicy(
  ///   keyFields: {
  ///     'title': true,
  ///     'author': {
  ///       'name': true,
  ///     }
  ///   },
  /// );
  /// ```
  ///
  /// If you don't wish to normalize this type, simply pass an empty `Map`. In
  /// that case, we won't normalize this type and it will be reachable from its
  /// parent.
  final Map<String, dynamic>? keyFields;

  /// Set to `true` if this type is the root Query in your schema.
  final bool queryType;

  /// Set to `true` if this type is the root Mutation in your schema.
  final bool mutationType;

  /// Set to `true` if this type is the root Subscription in your schema.
  final bool subscriptionType;

  /// Allows defining [FieldPolicy]s for this type.
  final Map<String, FieldPolicy> fields;

  const TypePolicy({
    this.keyFields,
    this.queryType = false,
    this.mutationType = false,
    this.subscriptionType = false,
    this.fields = const {},
  });
}
