import 'dart:async';
import 'package:meta/meta.dart';

import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/utils.dart';
import 'package:gql/ast.dart';

import 'package:ferry/src/fetch_policy.dart';
import 'package:ferry/src/responder.dart';
import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/operation_response.dart';
import 'package:ferry/src/cache.dart';
import 'package:ferry/src/responders/cache_responder.dart';
import 'package:ferry/src/responders/optimistic_link_responder.dart';

const _defaultFetchPolicies = {
  OperationType.query: FetchPolicy.CacheFirst,
  OperationType.mutation: FetchPolicy.NetworkOnly,
  OperationType.subscription: FetchPolicy.CacheAndNetwork,
};

/// Determines how to resolve an operation based on the [FetchPolicy] and caches
/// responses from the network if required by the policy.
class LinkAndCacheResponder extends Responder {
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  final Cache cache;

  OptimisticLinkResponder _optimisticLinkResponder;
  CacheResponder _cacheResponder;

  LinkAndCacheResponder({
    @required Link link,
    Cache cache,
    Map<OperationType, FetchPolicy> defaultFetchPolicies = const {},
  })  : cache = cache ?? Cache(),
        defaultFetchPolicies = {
          ..._defaultFetchPolicies,
          ...defaultFetchPolicies
        } {
    _optimisticLinkResponder = OptimisticLinkResponder(link, this.cache);
    _cacheResponder = CacheResponder(this.cache);
  }

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
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
        return _optimisticLinkResponder.responseStream(operationRequest);
      case FetchPolicy.NetworkOnly:
        return _optimisticLinkResponder
            .responseStream(operationRequest)
            .doOnData(_writeToCache);
      case FetchPolicy.CacheOnly:
        return _cacheResponder.responseStream(operationRequest);
      case FetchPolicy.CacheFirst:
        return _cacheResponder
            .responseStream(operationRequest)
            .take(1)
            .switchMap(
              (result) => result.data != null
                  ? _cacheResponder.responseStream(operationRequest)
                  : _optimisticLinkResponder
                      .responseStream(operationRequest)
                      .doOnData(_writeToCache)
                      .take(1)
                      .concatWith([
                      _cacheResponder.responseStream(operationRequest).skip(1)
                    ]),
            );
      case FetchPolicy.CacheAndNetwork:
        {
          final responseStreamFromNetwork =
              _optimisticLinkResponder.responseStream(operationRequest);

          final controller =
              StreamController<OperationResponse<TData, TVars>>();
          final networkStreamSubscription = responseStreamFromNetwork
              .listen(controller.add, onError: controller.addError);

          final sharedNetworkStream = controller.stream.shareValue();

          return _cacheResponder
              .responseStream(operationRequest)
              .where((response) => response.data != null)
              .takeUntil(sharedNetworkStream)
              .concatWith([
            sharedNetworkStream
                .doOnData(_writeToCache)
                .switchMap((networkResponse) => ConcatStream([
                      Stream.value(networkResponse),
                      _cacheResponder.responseStream(operationRequest).skip(1),
                    ]))
          ]).doOnCancel(() {
            networkStreamSubscription.cancel();
          });
        }
    }
    return null;
  }

  /// Writes data from [OperationResponse] to the cache
  void _writeToCache<TData, TVars>(
    OperationResponse<TData, TVars> response,
  ) {
    if (response.data != null) {
      cache.writeQuery(
        response.operationRequest,
        response.data,
        optimistic: response.dataSource == DataSource.Optimistic,
        requestId: response.operationRequest.requestId,
      );
    }
  }

  @override
  Future<void> dispose() => cache.dispose();
}
