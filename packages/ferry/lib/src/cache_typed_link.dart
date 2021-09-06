import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_cache/ferry_cache.dart';

export 'package:ferry_cache/ferry_cache.dart';

/// A terminating link that fetches the operation from the Cache, mapping the
/// result to an [OperationResponse].
class CacheTypedLink extends TypedLink {
  late Cache cache;
  Cache? _defaultCache;

  CacheTypedLink([
    Cache? cache,
  ]) {
    /// Set default cache if none is provided
    this.cache = cache ??= _defaultCache = Cache();
  }

  @override
  Future<void> dispose() async {
    await _defaultCache?.dispose();
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest, [
    forward,
  ]) =>
      cache.watchQuery(operationRequest).map(
            (data) => OperationResponse(
              operationRequest: operationRequest,
              data: data,
              dataSource: DataSource.Cache,
            ),
          );
}
