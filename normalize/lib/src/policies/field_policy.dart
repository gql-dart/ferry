import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src/utils/field_name_with_arguments.dart';
import 'package:normalize/src/utils/resolve_data_id.dart';
import 'package:normalize/src/config/base_config.dart';

class FieldFunctionOptions {
  final BaseConfig _config;

  /// The FieldNode object used to read this field.
  final FieldNode field;

  /// Any variables passed to the query that read this field
  final Map<String, dynamic> variables;

  /// The final argument values passed to the field, after applying variables.
  final Map<String, dynamic> args;

  FieldFunctionOptions({
    @required this.field,
    @required BaseConfig config,
  })  : _config = config,
        variables = config.variables,
        args = argsWithValues(config.variables, field.arguments);

  /// Returns whether or not this object is a reference to a normalized object.
  bool isReference(Map<String, dynamic> object) =>
      object.containsKey(_config.referenceKey);

  /// Returns a reference for the given object
  Map<String, dynamic> toReference(Map<String, dynamic> object) => {
        _config.referenceKey: resolveDataId(
          data: object,
          typePolicies: _config.typePolicies,
          dataIdFromObject: _config.dataIdFromObject,
        )
      };

  /// Returns the normalized object for the given reference.
  Map<String, dynamic> resolveReference(Map<String, dynamic> reference) =>
      _config.read(reference[_config.referenceKey]);
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
