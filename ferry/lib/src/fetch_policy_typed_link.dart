import 'dart:async';
import 'package:meta/meta.dart';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/utils.dart';
import 'package:gql/ast.dart';
import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_exec/ferry_exec.dart';

import 'package:ferry/src/optimistic_typed_link.dart';
import 'package:ferry/src/gql_typed_link.dart';
import 'package:ferry/src/cache_typed_link.dart';

export 'package:ferry_cache/ferry_cache.dart';
export 'package:gql_link/gql_link.dart';
export 'package:ferry_exec/ferry_exec.dart';

const _defaultFetchPolicies = {
  OperationType.query: FetchPolicy.CacheFirst,
  OperationType.mutation: FetchPolicy.NetworkOnly,
  OperationType.subscription: FetchPolicy.CacheAndNetwork,
};

/// A terminating link that resolves an operation from the [link] or the
/// [cache] based on the [OperationRequest.fetchPolicy], possibly caching the
/// response
class FetchPolicyTypedLink extends TypedLink {
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  final Cache cache;

  TypedLink _optimisticLinkTypedLink;
  CacheTypedLink _cacheTypedLink;

  FetchPolicyTypedLink({
    @required Link link,
    Cache cache,
    Map<OperationType, FetchPolicy> defaultFetchPolicies = const {},
  })  : cache = cache ?? Cache(),
        defaultFetchPolicies = {
          ..._defaultFetchPolicies,
          ...defaultFetchPolicies
        } {
    _optimisticLinkTypedLink = TypedLink.from([
      const OptimisticTypedLink(),
      GqlTypedLink(link),
    ]);
    _cacheTypedLink = CacheTypedLink(this.cache);
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest, [
    forward,
  ]) {
    final operationType = getOperationDefinition(
      operationRequest.operation.document,
      operationRequest.operation.operationName,
    ).type;

    final fetchPolicy =
        operationRequest.fetchPolicy ?? defaultFetchPolicies[operationType];

    switch (fetchPolicy) {
      case FetchPolicy.NoCache:
        return _optimisticLinkTypedLink
            .request(operationRequest)
            .doOnData(_removeOptimisticPatch);
      case FetchPolicy.NetworkOnly:
        return _optimisticLinkTypedLink
            .request(operationRequest)
            .doOnData(_removeOptimisticPatch)
            .doOnData(_writeToCache);
      case FetchPolicy.CacheOnly:
        return _cacheTypedLink.request(operationRequest);
      case FetchPolicy.CacheFirst:
        return _cacheTypedLink.request(operationRequest).take(1).switchMap(
              (result) => result.data != null
                  ? _cacheTypedLink.request(operationRequest)
                  : _optimisticLinkTypedLink
                      .request(operationRequest)
                      .doOnData(_removeOptimisticPatch)
                      .doOnData(_writeToCache)
                      .take(1)
                      .concatWith(
                          [_cacheTypedLink.request(operationRequest).skip(1)]),
            );
      case FetchPolicy.CacheAndNetwork:
        final sharedNetworkStream =
            _optimisticLinkTypedLink.request(operationRequest).shareValue();

        return _cacheTypedLink
            .request(operationRequest)
            .where((response) => response.data != null)
            .takeUntil(sharedNetworkStream)
            .concatWith([
          sharedNetworkStream
              .doOnData(_removeOptimisticPatch)
              .doOnData(_writeToCache)
              .switchMap((networkResponse) => ConcatStream([
                    Stream.value(networkResponse),
                    _cacheTypedLink.request(operationRequest).skip(1),
                  ]))
        ]);
    }
    return null;
  }

  /// Removes any previous optimistic patch for the request.
  void _removeOptimisticPatch<TData, TVars>(
    OperationResponse<TData, TVars> response,
  ) {
    if (response.dataSource != DataSource.Optimistic) {
      cache.removeOptimisticPatch(
        response.operationRequest,
      );
    }
  }

  /// Writes data from [OperationResponse] to the cache.
  void _writeToCache<TData, TVars>(
    OperationResponse<TData, TVars> response,
  ) {
    if (response.data != null) {
      cache.writeQuery(
        response.operationRequest,
        response.data,
        optimisticRequest: response.dataSource == DataSource.Optimistic
            ? response.operationRequest
            : null,
      );
    }
  }

  @override
  Future<void> dispose() => cache.dispose();
}
