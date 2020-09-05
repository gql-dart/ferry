import './field_policy.dart';

class TypePolicy {
  /// Allows defining the primary key fields for this type.
  ///
  /// If you don't wish to normalize this type, simply pass an empty list. In
  /// that case, we won't normalize this type and it will be reachable from its
  /// parent.
  ///
  /// Unlike the Apollo Client, nested keyFields are not currently allowed.
  List<String> keyFields;

  /// If your schema uses a custom __typename for any of the root Query,
  /// Mutation, and/or Subscription types (rare), set the corresponding
  /// field below to true to indicate that this type serves as that type.
  bool queryType;
  bool mutationType;
  bool subscriptionType;

  /// Allows defining [FieldPolicy]s for this type.
  Map<String, FieldPolicy> fields;

  TypePolicy({
    this.keyFields,
    this.queryType = false,
    this.mutationType = false,
    this.subscriptionType = false,
    this.fields = const {},
  });
}
