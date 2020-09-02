import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ferry/src/operation_response.dart';
import 'package:ferry/src/cache.dart';
import 'package:ferry/src/plugins/plugin.dart';
import './cache_proxy.dart';

export './cache_proxy.dart';

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

/// Runs any specified [UpdateCacheHandler]s with a [CacheProxy] when
///   1. an optimistic response is received
///   2. the first time a non-optimistic response is received
class UpdateCachePlugin extends Plugin {
  final Cache cache;

  /// A Map of [UpdateCacheHandler]s that will be called on any
  /// [OperationResponse] whose [OperationRequest.updateCacheHandlerKey]
  /// matches the Map key.
  ///
  /// NOTE: function is untyped due to issues with deep casting
  /// See https://github.com/leafpetersen/cast/issues/1.
  final Map<String, Function> updateCacheHandlers;

  UpdateCachePlugin({
    @required this.cache,
    @required this.updateCacheHandlers,
  });

  @override
  StreamTransformer<OperationResponse<TData, TVars>,
          OperationResponse<TData, TVars>>
      buildResponseTransformer<TData, TVars>() =>
          StreamTransformer.fromBind(_updateCacheHandlersStream);

  Stream<OperationResponse<TData, TVars>>
      _updateCacheHandlersStream<TData, TVars>(
    Stream<OperationResponse<TData, TVars>> stream,
  ) {
    var runNonOptimistically = false;

    return stream.doOnData((res) {
      final key = res.operationRequest.updateCacheHandlerKey;
      if (key == null) return;

      final handler =
          updateCacheHandlers[key] as UpdateCacheHandler<TData, TVars>;
      if (handler == null) throw Exception('No handler defined for key $key');

      final proxy = CacheProxy(
        cache,
        res.dataSource == DataSource.Optimistic,
        res.operationRequest.requestId,
      );

      switch (res.dataSource) {
        case DataSource.Optimistic:
          {
            handler(proxy, res);
            runNonOptimistically = false;
            return;
          }
        case DataSource.Link:
        case DataSource.Cache:
          {
            if (runNonOptimistically == false) {
              handler(proxy, res);
              runNonOptimistically = true;
            }
            return;
          }
        case DataSource.None:
          return;
      }
    });
  }
}
