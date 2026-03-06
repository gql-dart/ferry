// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_generator2_end_to_end/aliases/__generated__/alias_var_fragment.ast.gql.dart'
    as _i6;
import 'package:ferry_generator2_end_to_end/aliases/__generated__/alias_var_fragment.data.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/aliases/__generated__/alias_var_fragment.var.gql.dart'
    as _i3;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;

class GPostsReq
    implements _i1.OperationRequest<_i2.GPostsData, _i3.GPostsVars> {
  GPostsReq({
    required this.vars,
    _i4.Operation? operation,
    this.requestId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.updateCacheHandlerContext,
    this.fetchPolicy,
    this.executeOnListen = true,
    this.context,
  }) : operation = operation ?? _operation;

  final _i3.GPostsVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GPostsData? Function(
    _i2.GPostsData?,
    _i2.GPostsData?,
  )? updateResult;

  final _i2.GPostsData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.PostFragment,
    _i6.Posts,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'Posts',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GPostsData? parseData(Map<String, dynamic> json) =>
      _i2.GPostsData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GPostsData data) => data.toJson();

  _i1.OperationRequest<_i2.GPostsData, _i3.GPostsVars> transformOperation(
      _i4.Operation Function(_i4.Operation) transform) {
    return GPostsReq(
      vars: vars,
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

  GPostsReq copyWith({
    _i3.GPostsVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GPostsData? Function(
      _i2.GPostsData?,
      _i2.GPostsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GPostsData? optimisticResponse,
    bool optimisticResponseIsSet = false,
    String? updateCacheHandlerKey,
    bool updateCacheHandlerKeyIsSet = false,
    Map<String, dynamic>? updateCacheHandlerContext,
    bool updateCacheHandlerContextIsSet = false,
    _i1.FetchPolicy? fetchPolicy,
    bool fetchPolicyIsSet = false,
    bool? executeOnListen,
    _i4.Context? context,
    bool contextIsSet = false,
  }) {
    return GPostsReq(
      vars: vars ?? this.vars,
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
        (other is GPostsReq &&
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
    return 'GPostsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GPostFragmentReq
    implements
        _i1.FragmentRequest<_i2.GPostFragmentData, _i3.GPostFragmentVars> {
  GPostFragmentReq({
    required this.vars,
    _i5.DocumentNode? document,
    this.fragmentName = 'PostFragment',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final _i3.GPostFragmentVars vars;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document =
      _i5.DocumentNode(definitions: [_i6.PostFragment]);

  _i2.GPostFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GPostFragmentData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GPostFragmentData data) => data.toJson();

  GPostFragmentReq copyWith({
    _i3.GPostFragmentVars? vars,
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GPostFragmentReq(
      vars: vars ?? this.vars,
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPostFragmentReq &&
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
    return 'GPostFragmentReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
