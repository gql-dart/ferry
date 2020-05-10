import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

class FieldFunctionOptions {
  Map<String, dynamic> args;
  Object parentObject;
  FieldNode field;
  Map<String, dynamic> variables;

  FieldFunctionOptions({
    @required this.args,
    @required this.parentObject,
    @required this.field,
    this.variables,
  });
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
