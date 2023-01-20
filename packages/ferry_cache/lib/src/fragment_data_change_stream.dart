import 'dart:async';

import 'package:collection/collection.dart';
import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart';
import 'package:rxdart/rxdart.dart';

import './utils/data_for_id_stream.dart';

/// Emits when the data for this fragment changes, returning a `Set` of changed IDs.
Stream<Set<String>> fragmentDataChangeStream<TData, TVars>(
  FragmentRequest<TData, TVars> request,
  bool optimistic,
  Stream<Map<OperationRequest, Map<String, Map<String, dynamic>?>>?>
      optimisticPatchesStream,
  Map<String, dynamic>? Function(String dataId) optimisticReader,
  Store store,
  Map<String, TypePolicy> typePolicies,
  bool addTypename,
  DataIdResolver? dataIdFromObject,
  Map<String, Set<String>> possibleTypes,
  JsonEquals jsonEquals,
) {
  final dataIdStreamController = StreamController<void>();
  final result = dataIdStreamController.stream
      .map((_) {
        final dataIds = <String>{};

        denormalizeFragment(
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

        return dataIds;
      })
      .distinct((prev, next) => const SetEquality<String>().equals(prev, next))
      .switchMap((dataIds) {
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

          return stream.distinct(
            (prev, next) {
              final areEqual = jsonEquals(prev, next);
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
