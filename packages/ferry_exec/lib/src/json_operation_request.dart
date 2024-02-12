import 'package:collection/collection.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_exec/gql_exec.dart';

/// A [OperationRequest] that parses the response into a [Map<String, dynamic>]
/// this is useful for when you don't have a generated class for the operation
/// or as an escape hatch for when you want to parse the response yourself.
class JsonOperationRequest
    implements OperationRequest<Map<String, dynamic>, Map<String, dynamic>> {
  @override
  final FetchPolicy fetchPolicy;

  @override
  final String? requestId;

  @override
  final String? updateCacheHandlerKey;

  @override
  final Map<String, dynamic>? updateCacheHandlerContext;

  @override
  final bool executeOnListen;

  @override
  final Map<String, dynamic> vars;

  @override
  final Map<String, dynamic>? Function(
      Map<String, dynamic>?, Map<String, dynamic>?)? updateResult;

  @override
  final Operation operation;

  @override
  Request get execRequest => Request(
      operation: operation,
      variables: vars,
      context: context ?? const Context());

  @override
  final Context? context;

  JsonOperationRequest(
      {required this.operation,
      required this.fetchPolicy,
      this.requestId,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.executeOnListen = true,
      required this.vars,
      this.updateResult,
      this.optimisticResponse,
      this.context});

  @override
  Map<String, dynamic> parseData(Map<String, dynamic> json) => json;

  @override
  final Map<String, dynamic>? optimisticResponse;

  @override
  Map<String, dynamic> varsToJson() => vars;

  @override
  Map<String, dynamic> dataToJson(Map<String, dynamic> data) => data;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is JsonOperationRequest &&
        o.operation == operation &&
        o.fetchPolicy == fetchPolicy &&
        o.requestId == requestId &&
        o.updateCacheHandlerKey == updateCacheHandlerKey &&
        const DeepCollectionEquality().equals(
                    updateCacheHandlerContext, o.updateCacheHandlerContext) &
                o.executeOnListen ==
            executeOnListen &&
        const DeepCollectionEquality().equals(vars, o.vars) &&
        o.updateResult == updateResult &&
        o.optimisticResponse == optimisticResponse;
  }

  @override
  int get hashCode {
    return operation.hashCode ^
        fetchPolicy.hashCode ^
        requestId.hashCode ^
        updateCacheHandlerKey.hashCode ^
        const DeepCollectionEquality().hash(updateCacheHandlerContext) ^
        executeOnListen.hashCode ^
        const DeepCollectionEquality().hash(vars) ^
        updateResult.hashCode ^
        optimisticResponse.hashCode;
  }

  @override
  JsonOperationRequest transformOperation(
      Operation Function(Operation) transform) {
    return JsonOperationRequest(
        operation: transform(operation),
        fetchPolicy: fetchPolicy,
        vars: vars,
        requestId: requestId,
        updateCacheHandlerKey: updateCacheHandlerKey,
        updateCacheHandlerContext: updateCacheHandlerContext,
        executeOnListen: executeOnListen,
        updateResult: updateResult,
        optimisticResponse: optimisticResponse,
        context: context);
  }
}
