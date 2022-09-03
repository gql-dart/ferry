import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/utils.dart';
import 'package:gql/ast.dart';
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

  late Cache cache;
  Cache? _defaultCache;

  late TypedLink _optimisticLinkTypedLink;
  late CacheTypedLink _cacheTypedLink;

  FetchPolicyTypedLink({
    required Link link,
    Cache? cache,
    Map<OperationType, FetchPolicy> defaultFetchPolicies = const {},
  }) : defaultFetchPolicies = {
          ..._defaultFetchPolicies,
          ...defaultFetchPolicies
        } {
    /// Set default cache if none is provided
    this.cache = cache ??= _defaultCache = Cache();

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

    final Stream<OperationResponse<TData, TVars>> stream;

    switch (fetchPolicy) {
      case FetchPolicy.NoCache:
        stream = _optimisticLinkTypedLink
            .request(operationRequest)
            .doOnData(_removeOptimisticPatch);
        break;
      case FetchPolicy.NetworkOnly:
        stream = _optimisticLinkTypedLink
            .request(operationRequest)
            .doOnData(_removeOptimisticPatch)
            .doOnData(_writeToCache);
        break;
      case FetchPolicy.CacheOnly:
        stream = _cacheTypedLink.request(operationRequest);
        break;
      case FetchPolicy.CacheFirst:
        stream = _cacheTypedLink.request(operationRequest).take(1).switchMap(
              (result) => result.data != null
                  ? _cacheTypedLink.request(operationRequest)
                  : _optimisticLinkTypedLink
                      .request(operationRequest)
                      .doOnData(_removeOptimisticPatch)
                      .doOnData(_writeToCache)
                      .switchMap(
                        (networkResponse) => ConcatStream([
                          Stream.value(networkResponse),
                          _cacheTypedLink.request(operationRequest).skip(1),
                        ]),
                      ),
            );
        break;
      case FetchPolicy.CacheAndNetwork:
        final sharedNetworkStream =
            _optimisticLinkTypedLink.request(operationRequest).shareValue();

        stream = _cacheTypedLink
            .request(operationRequest)
            .where((response) => response.data != null)
            .takeUntil(
          sharedNetworkStream.doOnData(
            (_) {
              /// Temporarily add a listener so that [sharedNetworkStream] doesn't shut down when
              /// switchMap is updating the stream.
              final sub = sharedNetworkStream.listen(null);
              Future.delayed(Duration.zero).then((_) => sub.cancel());
            },
          ),
        ).concatWith([
          sharedNetworkStream
              .doOnData(_removeOptimisticPatch)
              .doOnData(_writeToCache)
              .switchMap(
                (networkResponse) => ConcatStream([
                  Stream.value(networkResponse),
                  _cacheTypedLink.request(operationRequest).skip(1),
                ]),
              )
        ]);
        break;
      default:
        throw Exception('Unrecognized FetchPolicy');
    }
    return stream.doOnDone(() {
      cache.removeOptimisticPatch(operationRequest);
    }).doOnCancel(() {
      cache.removeOptimisticPatch(operationRequest);
    });
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
  Future<void> dispose() async {
    await _defaultCache?.dispose();
  }
}
