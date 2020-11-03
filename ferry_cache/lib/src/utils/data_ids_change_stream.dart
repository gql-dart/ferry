import 'package:normalize/policies.dart';
import 'package:normalize/utils.dart';
import 'package:normalize/normalize.dart';
import 'package:collection/collection.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ferry_exec/ferry_exec.dart';

/// Emits when the data for this request changes, returning a `Set` of changed IDs.
Stream<Set<String>> dataIdsChangeStream<TData, TVars>(
  OperationRequest<TData, TVars> request,
  TData existingData,
  bool optimistic,
  Stream<Map<OperationRequest, Map<String, Map<String, dynamic>>>>
      optimisticPatchesStream,
  Map<String, dynamic> Function(String dataId) optimisticReader,
  Store store,
  Map<String, TypePolicy> typePolicies,
  bool addTypename,
) {
  /// Get a set of all references used by the existing cached response
  final dataIds = <String>{};
  normalizeOperation(
    read: optimistic ? optimisticReader : (dataId) => store.get(dataId),
    write: (dataId, value) => dataIds.add(dataId),
    document: request.operation.document,
    operationName: request.operation.operationName,
    // TODO: don't cast to dynamic
    variables: (request.vars as dynamic)?.toJson(),
    data: (existingData as dynamic)?.toJson(),
    typePolicies: typePolicies,
    addTypename: addTypename,
  );

  final operationDefinition = getOperationDefinition(
    request.operation.document,
    request.operation.operationName,
  );
  final rootTypename = resolveRootTypename(
    operationDefinition,
    typePolicies,
  );

  /// IDs that have changed
  final changed = <String>{};

  /// Streams for each dataId referenced in [existingData], including the [rootTypename]
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

/// Returns the normalized data for the given [dataId], optionally merging optimistic data.
Stream<Map<String, dynamic>> dataForIdStream(
  String dataId,
  Store store,
  bool optimistic,
  Stream<Map<OperationRequest, Map<String, Map<String, dynamic>>>>
      optimisticPatchesStream,
  Map<String, dynamic> Function(String dataId) optimisticReader,
) =>
    optimistic
        ? CombineLatestStream.combine2(
            store.watch(dataId),
            optimisticPatchesStream,
            (_, __) => optimisticReader(dataId),
          )
        : store.watch(dataId);

/// Returns a subset of the [data] with only the fields that this operation uses.
Map<String, dynamic> operationRootData<TData, TVars>(
  Map<String, dynamic> data,
  OperationRequest<TData, TVars> request,
  Map<String, TypePolicy> typePolicies,
) {
  final fieldNames = operationFieldNames(
    request.operation.document,
    request.operation.operationName,
    (request.vars as dynamic).toJson(),
    typePolicies,
  );
  return {
    for (var fieldName in fieldNames)
      if (data != null && data.containsKey(fieldName))
        fieldName: data[fieldName]
  };
}
