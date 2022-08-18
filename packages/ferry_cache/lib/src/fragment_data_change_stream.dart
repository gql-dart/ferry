import 'package:collection/collection.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart';
import 'package:rxdart/rxdart.dart';

import './utils/data_for_id_stream.dart';

/// Emits when the data for this fragment changes, returning a `Set` of changed IDs.
Future<Stream<Set<String>>> fragmentDataChangeStream<TData, TVars>(
  FragmentRequest<TData, TVars> request,
  bool optimistic,
  Stream<Map<OperationRequest, Map<String, Map<String, dynamic>?>>?>
      optimisticPatchesStream,
  Future<Map<String, dynamic>?> Function(String dataId) optimisticReader,
  Store store,
  Map<String, TypePolicy> typePolicies,
  bool addTypename,
  DataIdResolver? dataIdFromObject,
  Map<String, Set<String>> possibleTypes,
) async {
  final dataIds = <String>{};

  await denormalizeFragment(
    read: (dataId) {
      dataIds.add(dataId);
      return optimistic ? optimisticReader(dataId) : store.get(dataId);
    },
    idFields: request.idFields,
    fragmentName: request.fragmentName,
    document: request.document,
    // TODO: don't cast to dynamic
    variables: (request.vars as dynamic)?.toJson(),
    typePolicies: typePolicies,
    addTypename: addTypename,
    returnPartialData: true,
    dataIdFromObject: dataIdFromObject,
    possibleTypes: possibleTypes,
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

  return CombineLatestStream<Map<String, dynamic>?, Set<String>>(
    streams,
    (_) {
      final result = {...changed};
      changed.clear();
      return result;
    },
  )

      /// Skip the first result since this returns the existing data
      .skip(1);
}
