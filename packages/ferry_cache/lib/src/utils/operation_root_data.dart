import 'package:normalize/policies.dart';
import 'package:normalize/utils.dart';
import 'package:normalize/normalize.dart';

import 'package:ferry_exec/ferry_exec.dart';

/// Returns a subset of the [data] with only the fields that this operation uses.
Map<String, dynamic> operationRootData<TData, TVars>(
  Map<String, dynamic>? data,
  OperationRequest<TData, TVars> request,
  Map<String, TypePolicy> typePolicies,
  Map<String, Set<String>> possibleTypes,
) {
  final fieldNames = operationFieldNames(
    request.operation.document,
    request.operation.operationName!,
    (request.vars as dynamic).toJson(),
    typePolicies,
    possibleTypes,
  );
  return {
    for (var fieldName in fieldNames)
      if (data != null && data.containsKey(fieldName))
        fieldName: data[fieldName]
  };
}
