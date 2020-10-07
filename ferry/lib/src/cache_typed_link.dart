import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_cache/ferry_cache.dart';

export 'package:ferry_cache/ferry_cache.dart';

/// Fetches the operation from the cache, mapping the result to an
/// [OperationResponse].
class CacheTypedLink extends TypedLink {
  final Cache cache;

  CacheTypedLink(Cache cache) : cache = cache ?? Cache();

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
