// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_friends_and_name.ast.gql.dart'
    as _i6;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_name_and_id.ast.gql.dart'
    as _i8;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragments_with_shared_transitive_fragments.ast.gql.dart'
    as _i5;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragments_with_shared_transitive_fragments.data.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/shared_fragment.ast.gql.dart'
    as _i7;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql/ast.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i3;

class GHeroWith2FragmentsWithSharedTransitiveFragmentsReq
    implements
        _i1.OperationRequest<
            _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData, Null> {
  GHeroWith2FragmentsWithSharedTransitiveFragmentsReq({
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

  final _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData? Function(
    _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData?,
    _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData?,
  )? updateResult;

  final _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData?
      optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i3.Context? context;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.HeroWith2FragmentsWithSharedTransitiveFragments,
    _i6.heroFriendsAndName,
    _i7.SharedFragment,
    _i8.heroNameAndId,
  ]);

  static const _i3.Operation _operation = _i3.Operation(
    document: _document,
    operationName: 'HeroWith2FragmentsWithSharedTransitiveFragments',
  );

  _i3.Request get execRequest => _i3.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i3.Context(),
      );

  _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData? parseData(
          Map<String, dynamic> json) =>
      _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(
          _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData,
          Null>
      transformOperation(_i3.Operation Function(_i3.Operation) transform) {
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsReq(
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

  GHeroWith2FragmentsWithSharedTransitiveFragmentsReq copyWith({
    _i3.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData? Function(
      _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData?,
      _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GHeroWith2FragmentsWithSharedTransitiveFragmentsData?
        optimisticResponse,
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
    return GHeroWith2FragmentsWithSharedTransitiveFragmentsReq(
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
        (other is GHeroWith2FragmentsWithSharedTransitiveFragmentsReq &&
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
    return 'GHeroWith2FragmentsWithSharedTransitiveFragmentsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
