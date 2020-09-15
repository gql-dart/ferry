import 'dart:async';

/// Returns a [StreamTransformer] which applies a list of [StreamTransformer]s in order
StreamTransformer<T, T> applyTransformers<T>(
  Iterable<StreamTransformer<T, T>> transformers,
) =>
    StreamTransformer.fromBind(
      (stream) => transformers.fold(
        stream,
        (previousValue, transformer) => previousValue.transform(transformer),
      ),
    );
