import 'package:ferry/src/responder.dart';
import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/operation_response.dart';
import 'package:ferry/src/cache.dart';

/// Fetches the operation from the cache, mapping the result to a
/// [OperationResponse].
class CacheResponder extends Responder {
  final Cache cache;

  CacheResponder(Cache cache) : cache = cache ?? Cache();

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
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
