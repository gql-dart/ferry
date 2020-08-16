import 'package:gql/ast.dart';

import './operation_response.dart';
import './fetch_policy.dart';

import './cache_proxy.dart';

const _defaultFetchPolicies = {
  OperationType.query: FetchPolicy.CacheFirst,
  OperationType.mutation: FetchPolicy.NetworkOnly,
  OperationType.subscription: FetchPolicy.CacheAndNetwork,
};

/// Updates the cache after receiving an [OperationResponse].
///
/// Useful when merging mutation results that add items to a list, etc.
///
/// Note: if a callback is provided, [updateCache] is also run immediately with
/// the [optimisticResponse].
typedef UpdateCacheHandler<TData, TVars> = void Function(
  CacheProxy proxy,
  OperationResponse<TData, TVars> response,
);

class ClientOptions {
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  // NOTE: function is untyped due to issues with deep casting
  // See https://github.com/leafpetersen/cast/issues/1.
  final Map<String, Function> updateCacheHandlers;
  final bool addTypename;

  ClientOptions({
    this.updateCacheHandlers = const {},
    this.addTypename = true,
    Map<OperationType, FetchPolicy> defaultFetchPolicies = const {},
  }) : defaultFetchPolicies = {
          ..._defaultFetchPolicies,
          ...defaultFetchPolicies,
        };
}
