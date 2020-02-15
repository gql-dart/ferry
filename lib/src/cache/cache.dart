import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';

import '../store/memory_store.dart';
import '../helpers/deep_merge.dart';
import './options.dart';
import '../store/store.dart';

class GQLCache {
  final Map<String, TypePolicy> typePolicies;
  final bool addTypename;
  final Store _dataStore;

  final BehaviorSubject<Map<String, Map<String, Map<String, dynamic>>>>
      _optimisticPatchesStream;
  final _optimisticDataStream =
      BehaviorSubject<Map<String, Map<String, dynamic>>>();

  GQLCache({
    Store dataStore,
    this.typePolicies = const {},
    this.addTypename = true,
    Map<String, Map<String, Map<String, dynamic>>> seedOptimisticPatches,
  })  : _dataStore = dataStore ?? MemoryStore(),
        _optimisticPatchesStream = BehaviorSubject.seeded(
          seedOptimisticPatches ?? {},
        ) {
    // TODO: can this be done without listening in the constructor?
    CombineLatestStream.combine2<
        Map<String, Map<String, dynamic>>,
        Map<String, Map<String, Map<String, dynamic>>>,
        Map<String, Map<String, dynamic>>>(
      _dataStore.watch(),
      _optimisticPatchesStream,
      (data, optimisticPatches) {
        return optimisticPatches.values
            .fold(data, (a, b) => Map.from(deepMerge(a, b)));
      },
    ).listen((data) => _optimisticDataStream.add(data));
  }

  Stream<Map<String, dynamic>> watchQuery(
    ReadQueryOptions options,
  ) =>
      ((options.optimistic ?? true)
              ? _optimisticDataStream
              : _dataStore.watch())
          .map(
        (data) => denormalize(
          reader: (dataId) => data[dataId],
          query: options.document,
          addTypename: addTypename,
          operationName: options.operationName,
          variables: options.variables,
          typePolicies: typePolicies,
        ),
      );

  Map<String, dynamic> readQuery(
    ReadQueryOptions options,
  ) =>
      denormalize(
        reader: (dataId) => (options.optimistic ?? true)
            ? _optimisticDataStream.value[dataId]
            : _dataStore.get(dataId),
        query: options.document,
        operationName: options.operationName,
        variables: options.variables,
        typePolicies: typePolicies,
        addTypename: addTypename,
      );

  Map<String, dynamic> readFragment(
    ReadFragmentOptions options,
  ) =>
      denormalizeFragment(
        reader: (dataId) => (options.optimistic ?? true)
            ? _optimisticDataStream.value[dataId]
            : _dataStore.get(dataId),
        fragment: options.fragment,
        idFields: options.idFields,
        fragmentName: options.fragmentName,
        variables: options.variables,
        typePolicies: typePolicies,
        addTypename: addTypename,
      );

  void writeQuery(
    WriteQueryOptions options, [
    bool optimistic = false,
    String queryId,
  ]) {
    final Map<String, Map<String, dynamic>> normalizedResult = {};
    normalize(
      writer: (dataId, value) => normalizedResult[dataId] = value,
      query: options.document,
      operationName: options.operationName,
      variables: options.variables,
      data: options.data,
      typePolicies: typePolicies,
    );
    _writeData(normalizedResult, optimistic, queryId);
  }

  void writeFragment(
    WriteFragmentOptions options, [
    bool optimistic = false,
    String queryId,
  ]) {
    final Map<String, Map<String, dynamic>> normalizedResult = {};
    normalizeFragment(
      writer: (dataId, value) => normalizedResult[dataId] = value,
      fragment: options.fragment,
      idFields: options.idFields,
      data: options.data,
      fragmentName: options.fragmentName,
      variables: options.variables,
      typePolicies: typePolicies,
    );
    _writeData(normalizedResult, optimistic, queryId);
  }

  void _writeData(
    Map<String, Map<String, dynamic>> data,
    bool optimistic,
    String queryId,
  ) =>
      optimistic
          ? _optimisticPatchesStream.add(
              {
                ..._optimisticPatchesStream.value,
                queryId: Map.from(
                  deepMerge(
                    _optimisticPatchesStream.value[queryId] ?? {},
                    data,
                  ),
                ),
              },
            )
          : _dataStore.putAll(Map.fromEntries(
              data.entries.map(
                (entry) => MapEntry(
                  entry.key,
                  Map.from(
                    deepMerge(
                      _dataStore.get(entry.key) ?? {},
                      entry.value,
                    ),
                  ),
                ),
              ),
            ));

  void removeOptimisticPatch(String id) {
    final patches = _optimisticPatchesStream.value;
    if (patches.containsKey(id)) {
      patches.remove(id);
      _optimisticPatchesStream.add(patches);
    }
  }
}
