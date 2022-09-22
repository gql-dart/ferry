import 'dart:async';
import 'package:gql/ast.dart';

import 'package:ferry/src/add_typename_typed_link.dart';
import 'package:ferry/src/fetch_policy_typed_link.dart';
import 'package:ferry/src/request_controller_typed_link.dart';
import 'package:ferry/src/update_cache_typed_link.dart';
import 'package:ferry/src/error_typed_link.dart';

export 'package:ferry_cache/ferry_cache.dart';
export 'package:gql_link/gql_link.dart';
export 'package:normalize/policies.dart';
export 'package:ferry/src/update_cache_typed_link.dart' show UpdateCacheHandler;
export 'package:ferry_exec/ferry_exec.dart';
export 'package:gql/ast.dart' show OperationType;

abstract class TypedLinkWithCacheAndRequestController extends TypedLink {
  Cache get cache;

  StreamController<OperationRequest> get requestController;
}

class Client extends TypedLinkWithCacheAndRequestController {
  final Link link;
  final Map<String, TypePolicy> typePolicies;
  final Map<String, Function> updateCacheHandlers;
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  final bool addTypename;

  @override
  late Cache cache;
  Cache? _defaultCache;

  @override
  late StreamController<OperationRequest> requestController;
  StreamController<OperationRequest>? _defaultRequestController;

  late TypedLink _typedLink;

  Client({
    required this.link,
    Cache? cache,
    StreamController<OperationRequest>? requestController,
    this.typePolicies = const {},
    this.updateCacheHandlers = const {},
    this.defaultFetchPolicies = const {},
    this.addTypename = true,
  }) {
    this.cache = cache ??= _defaultCache = Cache();
    this.requestController = requestController ??=
        _defaultRequestController = StreamController.broadcast();
    _typedLink = TypedLink.from([
      ErrorTypedLink(),
      RequestControllerTypedLink(this.requestController),
      if (addTypename) AddTypenameTypedLink(),
      if (updateCacheHandlers.isNotEmpty)
        UpdateCacheTypedLink(
          cache: this.cache,
          updateCacheHandlers: updateCacheHandlers,
        ),
      FetchPolicyTypedLink(
        link: link,
        cache: this.cache,
        defaultFetchPolicies: defaultFetchPolicies,
      )
    ]);
  }

  @override
  Future<void> dispose() async {
    await _defaultCache?.dispose();
    await _defaultRequestController?.close();
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    forward,
  ]) =>
      _typedLink.request(request, forward);
}
