// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/hero_with_interface_unnamed_fragments.ast.gql.dart'
    as _i6;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/hero_with_interface_unnamed_fragments.data.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/hero_with_interface_unnamed_fragments.var.gql.dart'
    as _i3;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;

class GHeroWithInterfaceUnnamedFragmentsReq
    implements
        _i1.OperationRequest<_i2.GHeroWithInterfaceUnnamedFragmentsData,
            _i3.GHeroWithInterfaceUnnamedFragmentsVars> {
  GHeroWithInterfaceUnnamedFragmentsReq({
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

  final _i3.GHeroWithInterfaceUnnamedFragmentsVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GHeroWithInterfaceUnnamedFragmentsData? Function(
    _i2.GHeroWithInterfaceUnnamedFragmentsData?,
    _i2.GHeroWithInterfaceUnnamedFragmentsData?,
  )? updateResult;

  final _i2.GHeroWithInterfaceUnnamedFragmentsData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document =
      _i5.DocumentNode(definitions: [_i6.HeroWithInterfaceUnnamedFragments]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'HeroWithInterfaceUnnamedFragments',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GHeroWithInterfaceUnnamedFragmentsData? parseData(
          Map<String, dynamic> json) =>
      _i2.GHeroWithInterfaceUnnamedFragmentsData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(
          _i2.GHeroWithInterfaceUnnamedFragmentsData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GHeroWithInterfaceUnnamedFragmentsData,
          _i3.GHeroWithInterfaceUnnamedFragmentsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GHeroWithInterfaceUnnamedFragmentsReq(
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

  GHeroWithInterfaceUnnamedFragmentsReq copyWith({
    _i3.GHeroWithInterfaceUnnamedFragmentsVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GHeroWithInterfaceUnnamedFragmentsData? Function(
      _i2.GHeroWithInterfaceUnnamedFragmentsData?,
      _i2.GHeroWithInterfaceUnnamedFragmentsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GHeroWithInterfaceUnnamedFragmentsData? optimisticResponse,
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
    return GHeroWithInterfaceUnnamedFragmentsReq(
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
        (other is GHeroWithInterfaceUnnamedFragmentsReq &&
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
    return 'GHeroWithInterfaceUnnamedFragmentsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
