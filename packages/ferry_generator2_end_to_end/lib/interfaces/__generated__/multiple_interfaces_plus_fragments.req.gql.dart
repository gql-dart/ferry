// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:ferry_generator2_end_to_end/interfaces/__generated__/multiple_interfaces_plus_fragments.ast.gql.dart'
    as _i5;
import 'package:ferry_generator2_end_to_end/interfaces/__generated__/multiple_interfaces_plus_fragments.data.gql.dart'
    as _i2;
import 'package:gql/ast.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i3;

class GMultipleInterfacesReq
    implements _i1.OperationRequest<_i2.GMultipleInterfacesData, Null> {
  GMultipleInterfacesReq({
    _i3.Operation? operation,
    this.requestId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.updateCacheHandlerContext,
    this.fetchPolicy,
    this.executeOnListen = true,
    this.context,
  }) : operation = operation ?? _operation;

  final Null vars = null;

  final _i3.Operation operation;

  final String? requestId;

  final _i2.GMultipleInterfacesData? Function(
    _i2.GMultipleInterfacesData?,
    _i2.GMultipleInterfacesData?,
  )? updateResult;

  final _i2.GMultipleInterfacesData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i3.Context? context;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.MultipleInterfaces,
    _i5.CThingFragment,
    _i5.DThingFragment,
  ]);

  static const _i3.Operation _operation = _i3.Operation(
    document: _document,
    operationName: 'MultipleInterfaces',
  );

  _i3.Request get execRequest => _i3.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i3.Context(),
      );

  _i2.GMultipleInterfacesData? parseData(Map<String, dynamic> json) =>
      _i2.GMultipleInterfacesData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GMultipleInterfacesData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GMultipleInterfacesData, Null> transformOperation(
      _i3.Operation Function(_i3.Operation) transform) {
    return GMultipleInterfacesReq(
      operation: transform(operation),
      requestId: requestId,
      updateResult: updateResult,
      optimisticResponse: optimisticResponse,
      updateCacheHandlerKey: updateCacheHandlerKey,
      updateCacheHandlerContext: updateCacheHandlerContext,
      fetchPolicy: fetchPolicy,
      executeOnListen: executeOnListen,
      context: context,
    );
  }

  GMultipleInterfacesReq copyWith({
    _i3.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GMultipleInterfacesData? Function(
      _i2.GMultipleInterfacesData?,
      _i2.GMultipleInterfacesData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GMultipleInterfacesData? optimisticResponse,
    bool optimisticResponseIsSet = false,
    String? updateCacheHandlerKey,
    bool updateCacheHandlerKeyIsSet = false,
    Map<String, dynamic>? updateCacheHandlerContext,
    bool updateCacheHandlerContextIsSet = false,
    _i1.FetchPolicy? fetchPolicy,
    bool fetchPolicyIsSet = false,
    bool? executeOnListen,
    _i3.Context? context,
    bool contextIsSet = false,
  }) {
    return GMultipleInterfacesReq(
      operation: operation ?? this.operation,
      requestId: requestIdIsSet ? requestId : this.requestId,
      updateResult: updateResultIsSet ? updateResult : this.updateResult,
      optimisticResponse: optimisticResponseIsSet
          ? optimisticResponse
          : this.optimisticResponse,
      updateCacheHandlerKey: updateCacheHandlerKeyIsSet
          ? updateCacheHandlerKey
          : this.updateCacheHandlerKey,
      updateCacheHandlerContext: updateCacheHandlerContextIsSet
          ? updateCacheHandlerContext
          : this.updateCacheHandlerContext,
      fetchPolicy: fetchPolicyIsSet ? fetchPolicy : this.fetchPolicy,
      executeOnListen: executeOnListen ?? this.executeOnListen,
      context: contextIsSet ? context : this.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMultipleInterfacesReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
                updateCacheHandlerContext, other.updateCacheHandlerContext) &&
            fetchPolicy == other.fetchPolicy &&
            executeOnListen == other.executeOnListen &&
            context == other.context);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        _gqlUtils.deepHash(varsToJson()),
        operation,
        requestId,
        updateResult,
        optimisticResponse,
        updateCacheHandlerKey,
        _gqlUtils.deepHash(updateCacheHandlerContext),
        fetchPolicy,
        executeOnListen,
        context);
  }

  @override
  String toString() {
    return 'GMultipleInterfacesReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GCThingFragmentReq
    implements _i1.FragmentRequest<_i2.GCThingFragmentData, Null> {
  GCThingFragmentReq({
    _i4.DocumentNode? document,
    this.fragmentName = 'CThingFragment',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i4.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i4.DocumentNode _document =
      _i4.DocumentNode(definitions: [_i5.CThingFragment]);

  _i2.GCThingFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GCThingFragmentData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GCThingFragmentData data) =>
      data.toJson();

  GCThingFragmentReq copyWith({
    _i4.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GCThingFragmentReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCThingFragmentReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            document == other.document &&
            fragmentName == other.fragmentName &&
            _gqlUtils.deepEquals(idFields, other.idFields));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(varsToJson()), document,
        fragmentName, _gqlUtils.deepHash(idFields));
  }

  @override
  String toString() {
    return 'GCThingFragmentReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GDThingFragmentReq
    implements _i1.FragmentRequest<_i2.GDThingFragmentData, Null> {
  GDThingFragmentReq({
    _i4.DocumentNode? document,
    this.fragmentName = 'DThingFragment',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i4.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i4.DocumentNode _document =
      _i4.DocumentNode(definitions: [_i5.DThingFragment]);

  _i2.GDThingFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GDThingFragmentData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GDThingFragmentData data) =>
      data.toJson();

  GDThingFragmentReq copyWith({
    _i4.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GDThingFragmentReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDThingFragmentReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            document == other.document &&
            fragmentName == other.fragmentName &&
            _gqlUtils.deepEquals(idFields, other.idFields));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(varsToJson()), document,
        fragmentName, _gqlUtils.deepHash(idFields));
  }

  @override
  String toString() {
    return 'GDThingFragmentReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
