import 'dart:async';

import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/operation_response.dart';

abstract class Plugin {
  T _identity<T>(T b) => b;

  StreamTransformer<OperationRequest<TData, TVars>,
          OperationRequest<TData, TVars>>
      buildRequestTransformer<TData, TVars>() =>
          StreamTransformer.fromBind(_identity);

  StreamTransformer<OperationResponse<TData, TVars>,
          OperationResponse<TData, TVars>>
      buildResponseTransformer<TData, TVars>() =>
          StreamTransformer.fromBind(_identity);

  void dispose() => null;
}
