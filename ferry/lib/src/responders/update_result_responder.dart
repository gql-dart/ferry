import 'dart:async';

import 'package:ferry/src/operation_response.dart';
import 'package:ferry/src/responder.dart';

/// Update the result based on previous result.
///
/// Useful for features like pagination.
class UpdateResultPlugin extends Responder {
  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    request, [
    forward,
  ]) =>
      forward(request)
          .transform(StreamTransformer.fromBind(_updateResultStream));

  Stream<OperationResponse<TData, TVars>> _updateResultStream<TData, TVars>(
    Stream<OperationResponse<TData, TVars>> stream,
  ) {
    OperationResponse<TData, TVars> previous;
    return stream.map(
      (response) => previous = response.operationRequest.updateResult == null
          ? response
          : OperationResponse(
              operationRequest: response.operationRequest,
              data: response.operationRequest.updateResult(
                previous?.data,
                response.data,
              ),
              dataSource: response.dataSource,
              linkException: response.linkException,
              graphqlErrors: response.graphqlErrors,
            ),
    );
  }
}

// var prev = BehaviorSubject<OperationResponse<TData, TVars>>.seeded(null);

// /// Fetch [OperationResponse] from network (and optionally cache results)
// /// or fetch from cache, depending on the [FetchPolicy]. Switches to
// /// the latest stream for a given [requestId].
// .switchMap(
//   (req) => prev = req.updateResult == null
//       ? _requestResolverStream(req).shareValue()
//       : CombineLatestStream.combine2<
//           OperationResponse<TData, TVars>,
//           OperationResponse<TData, TVars>,
//           OperationResponse<TData, TVars>>(
//           prev,
//           _requestResolverStream(req).shareValue(),
//           (previous, response) => OperationResponse(
//             operationRequest: response.operationRequest,
//             data: response.operationRequest.updateResult(
//               previous?.data,
//               response.data,
//             ),
//             dataSource: response.dataSource,
//             linkException: response.linkException,
//             graphqlErrors: response.graphqlErrors,
//           ),
//         ).shareValue(),
// )
