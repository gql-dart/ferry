import 'package:ferry_store/ferry_store.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ferry_exec/ferry_exec.dart';

/// Returns the normalized data for the given [dataId], optionally merging optimistic data.
Stream<Map<String, dynamic>?> dataForIdStream(
  String dataId,
  Store store,
  bool optimistic,
  Stream<Map<OperationRequest, Map<String, Map<String, dynamic>?>>?>
      optimisticPatchesStream,
  Map<String, dynamic>? Function(String dataId) optimisticReader,
) =>
    optimistic
        ? CombineLatestStream.combine2<
            Map<String, dynamic>?,
            Map<OperationRequest<dynamic, dynamic>,
                Map<String, Map<String, dynamic>?>>?,
            Map<String, dynamic>?>(
            store.watch(dataId),
            optimisticPatchesStream,
            (_, __) => optimisticReader(dataId),
          )
        : store.watch(dataId);
