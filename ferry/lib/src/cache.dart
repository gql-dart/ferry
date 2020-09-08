import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart' as utils;
import 'package:ferry_store/ferry_store.dart';

import './helpers/deep_merge.dart';
import './operation_request.dart';
import './fragment_request.dart';

class Cache {
  final Map<String, TypePolicy> typePolicies;
  final bool addTypename;
  final Store store;

  final BehaviorSubject<Map<String, Map<String, Map<String, dynamic>>>>
      _optimisticPatchesStream;

  final _optimisticDataStream =
      BehaviorSubject<Map<String, Map<String, dynamic>>>();

  Cache({
    Store store,
    this.typePolicies = const {},
    this.addTypename = true,
    Map<String, Map<String, Map<String, dynamic>>> seedOptimisticPatches,
  })  : store = store ?? MemoryStore(),
        _optimisticPatchesStream = BehaviorSubject.seeded(
          seedOptimisticPatches ?? {},
        ) {
    /// TODO: is there a way to do this without listenening in the constructor?
    ///
    /// TODO: is there a way to make this have the latest result from [store.valueStream]
    /// and [_optimisticPatchesStream] immediately after a new value is added to either?
    /// If so, we could get rid of [_optimisticData]
    CombineLatestStream.combine2(this.store.valueStream,
            _optimisticPatchesStream, (_, __) => _optimisticData)
        .listen((data) => _optimisticDataStream.add(data));
  }

  Map<String, Map<String, dynamic>> get _optimisticData =>
      _optimisticPatchesStream.value.values
          .fold(store.valueStream.value, (a, b) => Map.from(deepMerge(a, b)));

  Stream<TData> watchQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic = true,
  }) =>
      (optimistic ? _optimisticDataStream : store.valueStream).map((data) {
        final json = denormalizeOperation(
          read: (dataId) => data[dataId],
          document: request.operation.document,
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
    final json = denormalizeOperation(
      read: (dataId) =>
          optimistic ? _optimisticData[dataId] : store.get(dataId),
      document: request.operation.document,
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
      read: (dataId) =>
          optimistic ? _optimisticData[dataId] : store.get(dataId),
      document: request.document,
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
    normalizeOperation(
      read: (dataId) =>
          optimistic ? _optimisticData[dataId] : store.get(dataId),
      write: (dataId, value) => normalizedResult[dataId] = value,
      document: request.operation.document,
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
      read: (dataId) =>
          optimistic ? _optimisticData[dataId] : store.get(dataId),
      write: (dataId, value) => normalizedResult[dataId] = value,
      document: request.document,
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
          : store.putAll(
              Map.fromEntries(
                data.entries.map(
                  (entry) => MapEntry(
                    entry.key,
                    Map.from(
                      deepMerge(
                        store.get(entry.key) ?? {},
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

  /// Returns the canonical ID for a given object or reference.
  String identify<TData>(TData data) => utils.identify(
        // TODO: don't cast to dynamic
        (data as dynamic)?.toJson(),
        typePolicies: typePolicies,
      );

  /// Removes the entity from the [Store] as well as from any optimistic
  /// patches.
  ///
  /// You can retrieve an [entityId] by calling [Cache.identify].
  ///
  /// If a [fieldName] is provided, only that field will be removed. If an
  /// [args] Map is provided, only fields that include matching values for
  /// each arg will be removed.
  void evict(
    String entityId, {
    String fieldName,
    Map<String, dynamic> args = const {},
  }) =>
      fieldName == null
          ? _evictEntity(entityId)
          : _evictField(
              entityId,
              fieldName,
              args,
            );

  /// Removes entity from [Store] and in optimistic patches.
  void _evictEntity(String entityId) {
    store.delete(entityId);

    _optimisticPatchesStream.add(
      _optimisticPatchesStream.value.map(
        (patchKey, patch) => MapEntry(patchKey, patch..remove(entityId)),
      ),
    );
  }

  /// Removes field from entity in [Store] and in optimistic patches.
  void _evictField(
    String entityId,
    String fieldName,
    Map<String, dynamic> args,
  ) {
    _optimisticPatchesStream.add(
      _optimisticPatchesStream.value.map(
        (patchKey, patch) {
          if (!patch.containsKey(entityId)) return MapEntry(patchKey, patch);
          return MapEntry(
            patchKey,
            patch
              ..[entityId].removeWhere(
                (key, value) => _fieldMatch(key, fieldName, args),
              ),
          );
        },
      ),
    );

    final entity = store.get(entityId);
    if (entity != null) {
      store.put(
        entityId,
        entity.map(
          // NOTE: we need to set to null rather than removing altogether
          // to ensure that denormalize doesn't throw a [PartialDataException]
          (key, value) => _fieldMatch(
            key,
            fieldName,
            args,
          )
              ? MapEntry(key, null)
              : MapEntry(key, value),
        ),
      );
    }
  }

  bool _fieldMatch(
    String keyString,
    String fieldName,
    Map<String, dynamic> args,
  ) {
    final fieldKey = utils.FieldKey.parse(keyString);
    return fieldName == fieldKey.fieldName &&
        args.entries.every((arg) => fieldKey.args[arg.key] == arg.value);
  }

  /// Removes all data from the store and from any optimistic patches.
  void clear() {
    _optimisticPatchesStream.add({});
    store.clear();
  }

  void dispose() {
    _optimisticPatchesStream.close();
    _optimisticDataStream.close();
    store.dispose();
  }
}
