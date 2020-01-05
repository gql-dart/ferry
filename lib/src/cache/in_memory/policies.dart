import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

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

  TypePolicy(
      {this.keyFields,
      this.queryType = false,
      this.mutationType = false,
      this.subscriptionType = false,
      this.fields});
}

class FieldFunctionOptions {
  Map<String, dynamic> args;
  Object parentObject;
  FieldNode field;
  Map<String, dynamic> variables;

  FieldFunctionOptions(
      {@required this.args,
      @required this.parentObject,
      @required this.field,
      this.variables});
}

typedef FieldReadFunction<TExisting> = TExisting Function(
    TExisting existing, FieldFunctionOptions options);

typedef FieldMergeFunction<TExisting> = TExisting Function(
    TExisting existing, Object incoming, FieldFunctionOptions options);

class FieldPolicy<TValue> {
  /// Defines which arguments passed to the field are "important" in the sense
  /// that their values (together with the enclosing entity object) determine
  /// the field's value.
  ///
  /// By default, it is assumed that all field arguments might be important.
  ///
  /// If an empty [List] is provided, all arguments will be ignored.
  List<String> keyArgs;

  /// Custom function to read existing field
  FieldReadFunction<TValue> read;

  /// Custom function to merge into existing field
  FieldMergeFunction merge;

  FieldPolicy({this.keyArgs, this.read, this.merge});
}
