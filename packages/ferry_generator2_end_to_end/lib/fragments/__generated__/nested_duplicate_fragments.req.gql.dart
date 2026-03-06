// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/nested_duplicate_fragments.ast.gql.dart'
    as _i5;
import 'package:ferry_generator2_end_to_end/fragments/__generated__/nested_duplicate_fragments.data.gql.dart'
    as _i2;
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql/ast.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i3;

class GSearchResultsQueryReq
    implements _i1.OperationRequest<_i2.GSearchResultsQueryData, Null> {
  GSearchResultsQueryReq({
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

  final _i2.GSearchResultsQueryData? Function(
    _i2.GSearchResultsQueryData?,
    _i2.GSearchResultsQueryData?,
  )? updateResult;

  final _i2.GSearchResultsQueryData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i3.Context? context;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.SearchResultsQuery,
    _i5.CharacterDetails,
    _i5.FriendInfo,
    _i5.CharacterBasic,
  ]);

  static const _i3.Operation _operation = _i3.Operation(
    document: _document,
    operationName: 'SearchResultsQuery',
  );

  _i3.Request get execRequest => _i3.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i3.Context(),
      );

  _i2.GSearchResultsQueryData? parseData(Map<String, dynamic> json) =>
      _i2.GSearchResultsQueryData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GSearchResultsQueryData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GSearchResultsQueryData, Null> transformOperation(
      _i3.Operation Function(_i3.Operation) transform) {
    return GSearchResultsQueryReq(
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

  GSearchResultsQueryReq copyWith({
    _i3.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GSearchResultsQueryData? Function(
      _i2.GSearchResultsQueryData?,
      _i2.GSearchResultsQueryData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GSearchResultsQueryData? optimisticResponse,
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
    return GSearchResultsQueryReq(
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
        (other is GSearchResultsQueryReq &&
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
    return 'GSearchResultsQueryReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GCharacterDetailsReq
    implements _i1.FragmentRequest<_i2.GCharacterDetailsData, Null> {
  GCharacterDetailsReq({
    _i4.DocumentNode? document,
    this.fragmentName = 'CharacterDetails',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i4.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.CharacterDetails,
    _i5.FriendInfo,
    _i5.CharacterBasic,
  ]);

  _i2.GCharacterDetailsData? parseData(Map<String, dynamic> json) =>
      _i2.GCharacterDetailsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GCharacterDetailsData data) =>
      data.toJson();

  GCharacterDetailsReq copyWith({
    _i4.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GCharacterDetailsReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCharacterDetailsReq &&
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
    return 'GCharacterDetailsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GFriendInfoReq implements _i1.FragmentRequest<_i2.GFriendInfoData, Null> {
  GFriendInfoReq({
    _i4.DocumentNode? document,
    this.fragmentName = 'FriendInfo',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i4.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.FriendInfo,
    _i5.CharacterBasic,
  ]);

  _i2.GFriendInfoData? parseData(Map<String, dynamic> json) =>
      _i2.GFriendInfoData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GFriendInfoData data) => data.toJson();

  GFriendInfoReq copyWith({
    _i4.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GFriendInfoReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFriendInfoReq &&
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
    return 'GFriendInfoReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GCharacterBasicReq
    implements _i1.FragmentRequest<_i2.GCharacterBasicData, Null> {
  GCharacterBasicReq({
    _i4.DocumentNode? document,
    this.fragmentName = 'CharacterBasic',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i4.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i4.DocumentNode _document =
      _i4.DocumentNode(definitions: [_i5.CharacterBasic]);

  _i2.GCharacterBasicData? parseData(Map<String, dynamic> json) =>
      _i2.GCharacterBasicData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GCharacterBasicData data) =>
      data.toJson();

  GCharacterBasicReq copyWith({
    _i4.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GCharacterBasicReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCharacterBasicReq &&
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
    return 'GCharacterBasicReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
