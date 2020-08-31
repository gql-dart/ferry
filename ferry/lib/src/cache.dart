import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';
import 'package:ferry_store/ferry_store.dart';

import './helpers/deep_merge.dart';
import './operation_request.dart';
import './fragment_request.dart';

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
        ) {
    /// TODO: is there a way to do this without listenening in the constructor?
    ///
    /// TODO: is there a way to make this have the latest result from [store.valueStream]
    /// and [_optimisticPatchesStream] immediately after a new value is added to either?
    /// If so, we could get rid of [_optimisticData]
    CombineLatestStream.combine2(_store.valueStream, _optimisticPatchesStream,
            (_, __) => _optimisticData)
        .listen((data) => _optimisticDataStream.add(data));
  }

  Map<String, Map<String, dynamic>> get _optimisticData =>
      _optimisticPatchesStream.value.values
          .fold(_store.valueStream.value, (a, b) => Map.from(deepMerge(a, b)));

  Stream<TData> watchQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic = true,
  }) =>
      (optimistic ? _optimisticDataStream : _store.valueStream).map((data) {
        final json = denormalize(
          reader: (dataId) => data[dataId],
          query: request.operation.document,
          addTypename: addTypename,
          operationName: request.operation.operationName,
          // TODO: don't cast to dynamic
          variables: (request.vars as dynamic)?.toJson(),
          typePolicies: typePolicies,
        );
        return json == null ? null : request.parseData(json);
      });

  TData readQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic = true,
  }) {
    final json = denormalize(
      reader: (dataId) =>
          optimistic ? _optimisticData[dataId] : _store.get(dataId),
      query: request.operation.document,
      addTypename: addTypename,
      operationName: request.operation.operationName,
      // TODO: don't cast to dynamic
      variables: (request.vars as dynamic)?.toJson(),
      typePolicies: typePolicies,
    );
    return json == null ? null : request.parseData(json);
  }

  TData readFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request, {
    bool optimistic = true,
  }) {
    final json = denormalizeFragment(
      reader: (dataId) =>
          optimistic ? _optimisticData[dataId] : _store.get(dataId),
      fragment: request.document,
      idFields: request.idFields,
      fragmentName: request.fragmentName,
      // TODO: don't cast to dynamic
      variables: (request.vars as dynamic)?.toJson(),
      typePolicies: typePolicies,
      addTypename: addTypename,
    );
    return json == null ? null : request.parseData(json);
  }

  void writeQuery<TData, TVars>(
    OperationRequest<TData, TVars> request,
    TData data, {
    bool optimistic = false,
    String requestId,
  }) {
    final normalizedResult = <String, Map<String, dynamic>>{};
    normalize(
      writer: (dataId, value) => normalizedResult[dataId] = value,
      query: request.operation.document,
      operationName: request.operation.operationName,
      // TODO: don't cast to dynamic
      variables: (request.vars as dynamic)?.toJson(),
      data: (data as dynamic)?.toJson(),
      typePolicies: typePolicies,
      addTypename: addTypename,
    );
    _writeData(normalizedResult, optimistic, requestId ?? request.requestId);
  }

  void writeFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request,
    TData data, {
    bool optimistic = false,
    String requestId,
  }) {
    final normalizedResult = <String, Map<String, dynamic>>{};
    normalizeFragment(
      writer: (dataId, value) => normalizedResult[dataId] = value,
      fragment: request.document,
      idFields: request.idFields,
      fragmentName: request.fragmentName,
      // TODO: don't cast to dynamic
      variables: (request.vars as dynamic)?.toJson(),
      data: (data as dynamic)?.toJson(),
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

  void removeOptimisticPatch(String requestId) {
    final patches = _optimisticPatchesStream.value;
    if (patches.containsKey(requestId)) {
      patches.remove(requestId);
      _optimisticPatchesStream.add(patches);
    }
  }

  void clear() {
    _optimisticPatchesStream.add({});
    _store.clear();
  }

  void dispose() {
    _optimisticPatchesStream.close();
    _optimisticDataStream.close();
    _store.dispose();
  }
}
