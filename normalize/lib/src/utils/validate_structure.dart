import 'package:gql/ast.dart';
import 'package:normalize/src/denormalize_fragment.dart';
import 'package:normalize/src/denormalize_operation.dart';
import 'package:normalize/src/utils/exceptions.dart';

/// Validates the structure of [data] against the operation [operationName] in [document].
///
/// Throws a [PartialDataException] if the data is invalid,
/// unless `handleException=true`, in which case it returns `false`.
///
/// Treats `null` data as invalid, thus distinguishing between _valid_ data,
/// and data which is simply _not present_ as defined by the [spec].
///
/// Calls [denormalizeOperation] internally.
///
/// [spec]: https://spec.graphql.org/June2018/#sec-Data
bool validateOperationDataStructure({
  required DocumentNode document,
  required Map<String, dynamic>? data,
  String? operationName,
  Map<String, dynamic> variables = const {},
  bool addTypename = false,
  bool handleException = false,
}) {
  if (data == null) {
    if (handleException) {
      return false;
    }
    throw PartialDataException(path: []);
  }
  return denormalizeOperation(
        // get data at top level
        read: (_) => data,
        // "disable" normalization
        dataIdFromObject: (_) => null,
        document: document,
        operationName: operationName,
        variables: variables,
        addTypename: addTypename,
        handleException: handleException,
      ) !=
      null;
}

/// Validates the structure of [data] against the fragment [fragmentName] in [document].
///
/// Throws a [PartialDataException] if the data is invalid,
/// unless `handleException=true`, in which case it returns `false`.
///
/// **NOTE:** while `null` data is a theoretically acceptable value for any fragment in isolation,
/// we treat it as invalid here, maintaining consistency with [denormalizeOperation].
///
/// Calls [denormalizeFragment] internally.
bool validateFragmentDataStructure({
  required DocumentNode document,
  required Map<String, dynamic>? data,
  String? fragmentName,
  Map<String, dynamic> variables = const {},
  bool addTypename = false,
  bool handleException = false,
}) {
  if (data == null) {
    if (handleException) {
      return false;
    }
    throw PartialDataException(path: []);
  }

  return denormalizeFragment(
        // get data at top level
        read: (_) => data,
        // "disable" normalization
        dataIdFromObject: (_) => null,
        // idFields unnecessary without normalization
        idFields: <String, dynamic>{},
        document: document,
        fragmentName: fragmentName,
        variables: variables,
        addTypename: addTypename,
        handleException: handleException,
      ) !=
      null;
}
