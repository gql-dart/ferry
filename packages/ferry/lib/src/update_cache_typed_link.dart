import 'dart:async';

import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:rxdart/rxdart.dart';

export 'package:ferry_cache/ferry_cache.dart';

/// Provides an interface for interacting with the [Cache] from within
/// [UpdateCacheHandler]s.
///
/// Sets the [_optimisticRequest] property based on the originating request.
class CacheProxy {
  final Cache _cache;
  final OperationRequest? _optimisticRequest;

  bool get _optimistic => _optimisticRequest != null;

  CacheProxy(
    Cache cache, [
    OperationRequest? optimisticRequest,
  ])  : _cache = cache,
        _optimisticRequest = optimisticRequest;

  Future<TData?> readQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool? optimistic,
  }) =>
      _cache.readQuery(
        request,
        optimistic: optimistic ?? _optimistic,
      );

  Future<TData?> readFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request, {
    bool? optimistic,
  }) =>
      _cache.readFragment(
        request,
        optimistic: optimistic ?? _optimistic,
      );

  Future<void> writeQuery<TData, TVars>(
    OperationRequest<TData, TVars> request,
    TData data,
  ) =>
      _cache.writeQuery(
        request,
        data,
        optimisticRequest: _optimisticRequest,
      );

  Future<void> writeFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request,
    TData data,
  ) =>
      _cache.writeFragment(
        request,
        data,
        optimisticRequest: _optimisticRequest,
      );

  String? identify<TData>(TData data) => _cache.identify(data);

  Future<void> evict(
    String entityId, {
    String? fieldName,
    Map<String, dynamic> args = const {},
  }) =>
      _cache.evict(
        entityId,
        fieldName: fieldName,
        args: args,
        optimisticRequest: _optimisticRequest,
      );

  void retain(String entityId) => _cache.retain(entityId);

  void release(String entityId) => _cache.release(entityId);

  Future<Set<String>> gc() => _cache.gc();

  void clear() => _cache.clear();
}

/// Updates the cache after receiving an [OperationResponse].
///
/// Useful when merging mutation results that add items to a list, etc.
typedef UpdateCacheHandler<TData, TVars> = Future<void> Function(
  CacheProxy proxy,
  OperationResponse<TData, TVars> response,
);

/// Runs any specified [UpdateCacheHandler]s with a [CacheProxy] when a
/// response is received from [DataSource.Link] or [DataSource.Optimistic].
class UpdateCacheTypedLink extends TypedLink {
  final Cache cache;

  /// A Map of [UpdateCacheHandler]s that will be called on any
  /// [OperationResponse] whose [OperationRequest.updateCacheHandlerKey]
  /// matches the Map key.
  ///
  /// NOTE: function is untyped due to issues with deep casting
  /// See https://github.com/leafpetersen/cast/issues/1.
  final Map<String, Function> updateCacheHandlers;

  const UpdateCacheTypedLink({
    required this.cache,
    required this.updateCacheHandlers,
  });

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> req, [
    forward,
  ]) =>
      forward!(req).doOnData(_updateCache);

  Future<void> _updateCache<TData, TVars>(OperationResponse<TData, TVars> res) async {
    final key = res.operationRequest.updateCacheHandlerKey;
    if (key == null) return;

    final handler =
        updateCacheHandlers[key] as UpdateCacheHandler<TData, TVars>?;
    if (handler == null) throw Exception('No handler defined for key $key');

    switch (res.dataSource) {
      case DataSource.Optimistic:
        {
          final proxy = CacheProxy(cache, res.operationRequest);
          await handler(proxy, res);
          break;
        }
      case DataSource.Link:
        {
          final proxy = CacheProxy(cache);
          await handler(proxy, res);
          break;
        }
      default:
        break;
    }
  }
}
