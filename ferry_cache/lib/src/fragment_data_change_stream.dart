import 'package:normalize/policies.dart';
import 'package:normalize/utils.dart';
import 'package:normalize/normalize.dart';
import 'package:collection/collection.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ferry_exec/ferry_exec.dart';
import './utils/data_for_id_stream.dart';
import './utils/fragment_data_id.dart';

/// Emits when the data for this fragment changes, returning a `Set` of changed IDs.
Stream<Set<String>> fragmentDataChangeStream<TData, TVars>(
  FragmentRequest<TData, TVars> request,
  bool optimistic,
  Stream<Map<OperationRequest, Map<String, Map<String, dynamic>>>>
      optimisticPatchesStream,
  Map<String, dynamic> Function(String dataId) optimisticReader,
  Store store,
  Map<String, TypePolicy> typePolicies,
  bool addTypename,
) {
  final dataIds = reachableIdsFromDataId(
    fragmentDataId(request, typePolicies),
    optimistic ? optimisticReader : (dataId) => store.get(dataId),
  );

  /// IDs that have changed
  final changed = <String>{};

  /// Streams for each dataId referenced in data
  final streams = dataIds.map((dataId) {
    var stream = dataForIdStream(
      dataId,
      store,
      optimistic,
      optimisticPatchesStream,
      optimisticReader,
    );

    return stream
        .distinct(
          (prev, next) => const DeepCollectionEquality().equals(
            prev,
            next,
          ),
        )
        .doOnData((_) => changed.add(dataId));
  });

  return CombineLatestStream<Map<String, dynamic>, Set<String>>(
    streams,
    (_) {
      final result = {...changed};
      changed.clear();
      return result;
    },
  )

      /// Skip the first result since this returns the existsing data
      .skip(1);
}
