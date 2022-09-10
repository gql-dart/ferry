import 'dart:async';

import 'package:collection/collection.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart';
import 'package:rxdart/rxdart.dart';

import './utils/data_for_id_stream.dart';
import './utils/operation_root_data.dart';

/// Emits when the data for this request changes, returning a `Set` of changed IDs.
Stream<Set<String>> operationDataChangeStream<TData, TVars>(
  OperationRequest<TData, TVars> request,
  bool optimistic,
  Stream<Map<OperationRequest, Map<String, Map<String, dynamic>?>>?>
      optimisticPatchesStream,
  Map<String, dynamic>? Function(String dataId) optimisticReader,
  Store store,
  Map<String, TypePolicy> typePolicies,
  bool addTypename,
  DataIdResolver? dataIdFromObject,
  Map<String, Set<String>> possibleTypes,
) {
  final operationDefinition = getOperationDefinition(
    request.operation.document,
    request.operation.operationName,
  );
  final rootTypename = resolveRootTypename(
    operationDefinition,
    typePolicies,
  );

  final dataIdStreamController = StreamController<void>();
  final result = dataIdStreamController.stream
      .map((_) {
        final dataIds = <String>{};

        denormalizeOperation(
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
          possibleTypes: possibleTypes,
        );

        return dataIds;
      })
      .distinct()
      .switchMap((dataIds) {
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

          return stream.distinct(
            (prev, next) {
              final areEqual = const MapEquality().equals(prev, next);
              if (!areEqual) {
                // Maybe a new element was added to an array,
                // we need to recompute the dataIds
                dataIdStreamController.add(null);
              }
              return areEqual;
            },
          ).doOnData((_) => changed.add(dataId));
        });

        return CombineLatestStream<Map<String, dynamic>?, Set<String>>(
          streams,
          (_) {
            final result = {...changed};
            changed.clear();
            return result;
          },
        ).doOnDone(() {
          dataIdStreamController.close();
        })

            /// Skip the first result since this returns the existing data
            .skip(1);
      });
  dataIdStreamController.add(null);
  return result;
}
