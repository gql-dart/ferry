import 'dart:async';
import 'package:meta/meta.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql/ast.dart';

import 'package:ferry/src/add_typename_typed_link.dart';
import 'package:ferry/src/fetch_policy_typed_link.dart';
import 'package:ferry/src/request_controller_typed_link.dart';
import 'package:ferry/src/update_cache_typed_link.dart';

export 'package:ferry_cache/ferry_cache.dart';
export 'package:gql_link/gql_link.dart';
export 'package:normalize/policies.dart';
export 'package:ferry/src/update_cache_typed_link.dart' show UpdateCacheHandler;
export 'package:ferry_exec/ferry_exec.dart';
export 'package:gql/ast.dart' show OperationType;

class Client extends TypedLink {
  final Link link;
  final Cache cache;
  final StreamController<OperationRequest> requestController;
  final Map<String, TypePolicy> typePolicies;
  final Map<String, Function> updateCacheHandlers;
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  final bool addTypename;

  TypedLink _link;

  Client({
    @required this.link,
    Cache cache,
    StreamController<OperationRequest> requestController,
    this.typePolicies = const {},
    this.updateCacheHandlers = const {},
    this.defaultFetchPolicies = const {},
    this.addTypename = true,
  })  : cache = cache ?? Cache(),
        requestController = requestController ?? StreamController.broadcast() {
    _link = TypedLink.from([
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
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    forward,
  ]) =>
      _link.request(request, forward);
}
