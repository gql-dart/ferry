import './operation_request.dart';
import './fragment_request.dart';
import './cache.dart';

/// Provides an interface for interacting with the [Cache] from within
/// [UpdateCacheHandler]s.
///
/// Set's the [_optimistic] and [_requestId] properties based on the originating request.
class CacheProxy {
  final Cache _cache;
  final bool _optimistic;
  final String _requestId;

  CacheProxy(
    Cache cache,
    bool optimistic,
    String requestId,
  )   : _cache = cache,
        _optimistic = optimistic,
        _requestId = requestId;

  TData readQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic,
  }) =>
      _cache.readQuery(
        request,
        optimistic: optimistic ?? _optimistic,
      );

  TData readFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request, {
    bool optimistic,
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
        optimistic: _optimistic,
        requestId: _requestId,
      );

  void writeFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request,
    TData data,
  ) =>
      _cache.writeFragment(
        request,
        data,
        optimistic: _optimistic,
        requestId: _requestId,
      );
}
