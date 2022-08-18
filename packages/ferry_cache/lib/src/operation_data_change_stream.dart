import 'package:collection/collection.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart';
import 'package:rxdart/rxdart.dart';

import './utils/data_for_id_stream.dart';
import './utils/operation_root_data.dart';

/// Emits when the data for this request changes, returning a `Set` of changed IDs.
Future<Stream<Set<String>>> operationDataChangeStream<TData, TVars>(
  OperationRequest<TData, TVars> request,
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
  final operationDefinition = getOperationDefinition(
    request.operation.document,
    request.operation.operationName,
  );
  final rootTypename = resolveRootTypename(
    operationDefinition,
    typePolicies,
  );

  final dataIds = <String>{};

  await denormalizeOperation(
      read: (dataId) {
        dataIds.add(dataId);
        return optimistic ? optimisticReader(dataId) : store.get(dataId);
      },
      document: request.operation.document,
      operationName: request.operation.operationName,
      // TODO: don't cast to dynamic
      variables: (request.vars as dynamic)?.toJson(),
      typePolicies: typePolicies,
      addTypename: addTypename,
      returnPartialData: true,
      dataIdFromObject: dataIdFromObject,
      possibleTypes: possibleTypes);

  /// IDs that have changed
  final changed = <String>{};

  /// Streams for each dataId referenced in data, including the [rootTypename]
  final streams = dataIds.map((dataId) {
    var stream = dataForIdStream(
      dataId,
      store,
      optimistic,
      optimisticPatchesStream,
      optimisticReader,
    );

    /// we only want to subscribe to changes on the operation fields, not the entire operation type)
    if (dataId == rootTypename) {
      stream = stream.map(
        (data) => operationRootData(
          data,
          request,
          typePolicies,
          possibleTypes,
        ),
      );
    }

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
