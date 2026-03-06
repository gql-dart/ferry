// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/hero_with_interface_subtyped_fragments.ast.gql.dart'
    as _i6;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/hero_with_interface_subtyped_fragments.var.gql.dart'
    as _i3;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;

class GHeroWithInterfaceSubTypedFragmentsReq
    implements
        _i1.OperationRequest<_i2.GHeroWithInterfaceSubTypedFragmentsData,
            _i3.GHeroWithInterfaceSubTypedFragmentsVars> {
  GHeroWithInterfaceSubTypedFragmentsReq({
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

  final _i3.GHeroWithInterfaceSubTypedFragmentsVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GHeroWithInterfaceSubTypedFragmentsData? Function(
    _i2.GHeroWithInterfaceSubTypedFragmentsData?,
    _i2.GHeroWithInterfaceSubTypedFragmentsData?,
  )? updateResult;

  final _i2.GHeroWithInterfaceSubTypedFragmentsData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.HeroWithInterfaceSubTypedFragments,
    _i6.heroFieldsFragment,
    _i6.humanFieldsFragment,
    _i6.droidFieldsFragment,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'HeroWithInterfaceSubTypedFragments',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GHeroWithInterfaceSubTypedFragmentsData? parseData(
          Map<String, dynamic> json) =>
      _i2.GHeroWithInterfaceSubTypedFragmentsData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(
          _i2.GHeroWithInterfaceSubTypedFragmentsData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GHeroWithInterfaceSubTypedFragmentsData,
          _i3.GHeroWithInterfaceSubTypedFragmentsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GHeroWithInterfaceSubTypedFragmentsReq(
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

  GHeroWithInterfaceSubTypedFragmentsReq copyWith({
    _i3.GHeroWithInterfaceSubTypedFragmentsVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GHeroWithInterfaceSubTypedFragmentsData? Function(
      _i2.GHeroWithInterfaceSubTypedFragmentsData?,
      _i2.GHeroWithInterfaceSubTypedFragmentsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GHeroWithInterfaceSubTypedFragmentsData? optimisticResponse,
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
    return GHeroWithInterfaceSubTypedFragmentsReq(
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
        (other is GHeroWithInterfaceSubTypedFragmentsReq &&
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
    return 'GHeroWithInterfaceSubTypedFragmentsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GheroFieldsFragmentReq
    implements _i1.FragmentRequest<_i2.GheroFieldsFragmentData, Null> {
  GheroFieldsFragmentReq({
    _i5.DocumentNode? document,
    this.fragmentName = 'heroFieldsFragment',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.heroFieldsFragment,
    _i6.humanFieldsFragment,
    _i6.droidFieldsFragment,
  ]);

  _i2.GheroFieldsFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GheroFieldsFragmentData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GheroFieldsFragmentData data) =>
      data.toJson();

  GheroFieldsFragmentReq copyWith({
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GheroFieldsFragmentReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GheroFieldsFragmentReq &&
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
    return 'GheroFieldsFragmentReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GhumanFieldsFragmentReq
    implements _i1.FragmentRequest<_i2.GhumanFieldsFragmentData, Null> {
  GhumanFieldsFragmentReq({
    _i5.DocumentNode? document,
    this.fragmentName = 'humanFieldsFragment',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.humanFieldsFragment,
    _i6.droidFieldsFragment,
  ]);

  _i2.GhumanFieldsFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GhumanFieldsFragmentData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GhumanFieldsFragmentData data) =>
      data.toJson();

  GhumanFieldsFragmentReq copyWith({
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GhumanFieldsFragmentReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GhumanFieldsFragmentReq &&
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
    return 'GhumanFieldsFragmentReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GdroidFieldsFragmentReq
    implements _i1.FragmentRequest<_i2.GdroidFieldsFragmentData, Null> {
  GdroidFieldsFragmentReq({
    _i5.DocumentNode? document,
    this.fragmentName = 'droidFieldsFragment',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document =
      _i5.DocumentNode(definitions: [_i6.droidFieldsFragment]);

  _i2.GdroidFieldsFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GdroidFieldsFragmentData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GdroidFieldsFragmentData data) =>
      data.toJson();

  GdroidFieldsFragmentReq copyWith({
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GdroidFieldsFragmentReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GdroidFieldsFragmentReq &&
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
    return 'GdroidFieldsFragmentReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
