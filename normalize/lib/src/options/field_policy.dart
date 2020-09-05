import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src/utils/field_name_with_arguments.dart';

class FieldFunctionOptions {
  /// The data for the parent field.
  Map<String, dynamic> parentObject;

  /// The FieldNode object used to read this field.
  FieldNode field;

  /// Any variables passed to the query that read this field
  Map<String, dynamic> variables;

  /// The final argument values passed to the field, after applying variables.
  Map<String, dynamic> args;

  FieldFunctionOptions({
    @required this.parentObject,
    @required this.field,
    @required this.variables,
  }) : args = argsWithValues(variables, field.arguments);
}

typedef FieldReadFunction<TExisting> = TExisting Function(
  TExisting existing,
  FieldFunctionOptions options,
);

typedef FieldMergeFunction<TExisting> = TExisting Function(
  TExisting existing,
  Object incoming,
  FieldFunctionOptions options,
);

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
