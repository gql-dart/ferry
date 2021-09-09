import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_cache/ferry_cache.dart';

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

  TData? readQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool? optimistic,
  }) =>
      _cache.readQuery(
        request,
        optimistic: optimistic ?? _optimistic,
      );

  TData? readFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request, {
    bool? optimistic,
  }) =>
      _cache.readFragment(
        request,
        optimistic: optimistic ?? _optimistic,
      );

  void writeQuery<TData, TVars>(
    OperationRequest<TData, TVars> request,
    TData data,
  ) =>
      _cache.writeQuery(
        request,
        data,
        optimisticRequest: _optimisticRequest,
      );

  void writeFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request,
    TData data,
  ) =>
      _cache.writeFragment(
        request,
        data,
        optimisticRequest: _optimisticRequest,
      );

  String? identify<TData>(TData data) => _cache.identify(data);

  void evict(
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

  Set<String> gc() => _cache.gc();

  void clear() => _cache.clear();
}

/// Updates the cache after receiving an [OperationResponse].
///
/// Useful when merging mutation results that add items to a list, etc.
typedef UpdateCacheHandler<TData, TVars> = void Function(
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

  void _updateCache<TData, TVars>(OperationResponse<TData, TVars> res) {
    final key = res.operationRequest.updateCacheHandlerKey;
    if (key == null) return;

    final handler =
        updateCacheHandlers[key] as UpdateCacheHandler<TData, TVars>?;
    if (handler == null) throw Exception('No handler defined for key $key');

    switch (res.dataSource) {
      case DataSource.Optimistic:
        {
          final proxy = CacheProxy(cache, res.operationRequest);
          handler(proxy, res);
          break;
        }
      case DataSource.Link:
        {
          final proxy = CacheProxy(cache);
          handler(proxy, res);
          break;
        }
      default:
        break;
    }
  }
}
