import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql/ast.dart';
import 'package:meta/meta.dart';
import 'package:ferry_store/ferry_store.dart';

import './helpers/deep_merge.dart';

class Cache {
  final Map<String, TypePolicy> typePolicies;
  final bool addTypename;
  final Store _store;

  final BehaviorSubject<Map<String, Map<String, Map<String, dynamic>>>>
      _optimisticPatchesStream;
  final _optimisticDataStream =
      BehaviorSubject<Map<String, Map<String, dynamic>>>();

  Cache({
    Store store,
    this.typePolicies = const {},
    this.addTypename = true,
    Map<String, Map<String, Map<String, dynamic>>> seedOptimisticPatches,
  })  : _store = store ?? MemoryStore(),
        _optimisticPatchesStream = BehaviorSubject.seeded(
          seedOptimisticPatches ?? {},
          // sync is necessary to ensure that _optimisticDataStream is update synchronously when a
          // new event is added to _optimisticPatchesStream.
          // TODO: it is discouraged to use sync - ensure that there are no unintended side effects
          sync: true,
        ) {
    // TODO: can this be done without listening in the constructor?
    CombineLatestStream.combine2<
        Map<String, Map<String, dynamic>>,
        Map<String, Map<String, Map<String, dynamic>>>,
        Map<String, Map<String, dynamic>>>(
      _store.watch(),
      _optimisticPatchesStream,
      (data, optimisticPatches) {
        return optimisticPatches.values
            .fold(data, (a, b) => Map.from(deepMerge(a, b)));
      },
    ).listen((data) => _optimisticDataStream.add(data));
  }

  Stream<Map<String, dynamic>> watchQuery(
    Request request, {
    bool optimistic = true,
  }) =>
      (optimistic ? _optimisticDataStream : _store.watch()).map(
        (data) => denormalize(
          reader: (dataId) => data[dataId],
          query: request.operation.document,
          addTypename: addTypename,
          operationName: request.operation.operationName,
          variables: request.variables,
          typePolicies: typePolicies,
        ),
      );

  Map<String, dynamic> readQuery(
    Request request, {
    bool optimistic = true,
  }) =>
      denormalize(
        reader: (dataId) => optimistic
            ? _optimisticDataStream.value[dataId]
            : _store.get(dataId),
        query: request.operation.document,
        operationName: request.operation.operationName,
        variables: request.variables,
        typePolicies: typePolicies,
        addTypename: addTypename,
      );

  Map<String, dynamic> readFragment({
    @required DocumentNode document,
    @required Map<String, dynamic> idFields,
    String fragmentName,
    Map<String, dynamic> variables,
    bool optimistic = true,
  }) =>
      denormalizeFragment(
        reader: (dataId) => optimistic
            ? _optimisticDataStream.value[dataId]
            : _store.get(dataId),
        fragment: document,
        idFields: idFields,
        fragmentName: fragmentName,
        variables: variables,
        typePolicies: typePolicies,
        addTypename: addTypename,
      );

  void writeQuery(
    Request request,
    Map<String, dynamic> data, {
    bool optimistic = false,
    String requestId,
  }) {
    final Map<String, Map<String, dynamic>> normalizedResult = {};
    normalize(
      writer: (dataId, value) => normalizedResult[dataId] = value,
      query: request.operation.document,
      operationName: request.operation.operationName,
      variables: request.variables,
      data: data,
      typePolicies: typePolicies,
      addTypename: addTypename,
    );
    _writeData(normalizedResult, optimistic, requestId);
  }

  void writeFragment({
    @required DocumentNode document,
    @required Map<String, dynamic> idFields,
    @required Map<String, dynamic> data,
    String fragmentName,
    Map<String, dynamic> variables,
    bool optimistic = false,
    String requestId,
  }) {
    final Map<String, Map<String, dynamic>> normalizedResult = {};
    normalizeFragment(
      writer: (dataId, value) => normalizedResult[dataId] = value,
      fragment: document,
      idFields: idFields,
      data: data,
      fragmentName: fragmentName,
      variables: variables,
      typePolicies: typePolicies,
      addTypename: addTypename,
    );
    _writeData(normalizedResult, optimistic, requestId);
  }

  void _writeData(
    Map<String, Map<String, dynamic>> data,
    bool optimistic,
    String requestId,
  ) =>
      optimistic
          ? _optimisticPatchesStream.add(
              {
                ..._optimisticPatchesStream.value,
                requestId: Map.from(
                  deepMerge(
                    _optimisticPatchesStream.value[requestId] ?? {},
                    data,
                  ),
                ),
              },
            )
          : _store.putAll(
              Map.fromEntries(
                data.entries.map(
                  (entry) => MapEntry(
                    entry.key,
                    Map.from(
                      deepMerge(
                        _store.get(entry.key) ?? {},
                        entry.value,
                      ),
                    ),
                  ),
                ),
              ),
            );

  void removeOptimisticPatch(String id) {
    final patches = _optimisticPatchesStream.value;
    if (patches.containsKey(id)) {
      patches.remove(id);
      _optimisticPatchesStream.add(patches);
    }
  }
}
