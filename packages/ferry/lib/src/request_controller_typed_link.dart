import 'dart:async';

import 'package:ferry_exec/ferry_exec.dart';
import 'package:rxdart/rxdart.dart';

/// Allows multiple requests to be made by adding requests to the
/// [requestController].
///
/// To refetch an operation, simply add a new request of the same type and with
/// the same [OperationRequest.requestId].
///
/// To implement pagination, include an [OperationRequest.updateResult] callback.
///
/// If [OperationRequest.executeOnListen] == `true`, the operation will be
/// immediately executed when the stream returned by [request] is first
/// listened to.
class RequestControllerTypedLink extends TypedLink {
  late StreamController<OperationRequest> requestController;
  StreamController<OperationRequest>? _defaultRequestController;

  RequestControllerTypedLink([
    StreamController<OperationRequest>? controller,
  ]) {
    /// Set default request controller if none is provided
    requestController =
        controller ??= _defaultRequestController = StreamController.broadcast();
  }

  /// The cache of streams for each request.
  ///
  /// When [request] is called 2 times with the same request, the same stream
  /// will be returned to both callers. this ensures that the same request is
  /// not executed twice by the `FetchPolicyTypedLink`.
  final _cachedStreams = <OperationRequest, Stream<OperationResponse>>{};

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    request, [
    forward,
  ]) {
    // The cached request is the request that is used as the key in the
    // [_cachedStreams].
    final OperationRequest<TData, TVars> cachedRequest;
    if (request.requestId == null) {
      cachedRequest = request;
    } else {
      cachedRequest = _cachedStreams.keys
          .whereType<OperationRequest<TData, TVars>>()
          .firstWhere(
            (req) => req.requestId == request.requestId,
            orElse: () => request,
          );
    }
    var stream = _cachedStreams[cachedRequest]
        as Stream<OperationResponse<TData, TVars>>?;
    if (stream == null) {
      // If no stream has been cached for this request, create a new one.
      ValueStream<OperationResponse<TData, TVars>>? prev;
      var initial = true;
      stream = requestController.stream
          .whereType<OperationRequest<TData, TVars>>()
          .where(
            (req) => req.requestId == null
                ? req == request
                : req.requestId == request.requestId,
          )
          .doOnData(
        (_) {
          /// Temporarily add a listener so that [prev] doesn't shut down when
          /// switchMap is updating the stream.
          final sub = prev?.listen(null);
          scheduleMicrotask(() => sub?.cancel());
        },
      ).switchMap(
        (req) {
          final stream = req.updateResult == null
              ? forward!(req)
              : CombineLatestStream.combine2<
                  OperationResponse<TData, TVars>?,
                  OperationResponse<TData, TVars>,
                  OperationResponse<TData, TVars>>(
                  prev ?? Stream.value(null),
                  forward!(req),
                  (previous, response) => OperationResponse<TData, TVars>(
                    operationRequest: response.operationRequest,
                    data: response.operationRequest.updateResult!(
                      previous?.data,
                      response.data,
                    ),
                    dataSource: response.dataSource,
                    linkException: response.linkException,
                    graphqlErrors: response.graphqlErrors,
                  ),
                );
          return prev = stream.shareValue();
        },
      ).doOnListen(
        () {
          if (initial && request.executeOnListen) {
            scheduleMicrotask(() => requestController.add(request));
          }
          initial = false;
        },
      ).doOnCancel(() {
        // Once the stream is not listened to anymore, remove it from the cache.
        _cachedStreams.remove(request);
      });
      _cachedStreams[cachedRequest] = stream;
    } else {
      // Trigger a new request to update the already cached stream.
      requestController.add(request);
    }

    return stream;
  }

  @override
  Future<void> dispose() async {
    await _defaultRequestController?.close();
  }
}
