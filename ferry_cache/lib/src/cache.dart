import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart' as utils;
import 'package:ferry_store/ferry_store.dart';
import 'package:ferry_exec/ferry_exec.dart';

import './utils/data_ids_change_stream.dart';

class Cache {
  final Map<String, TypePolicy> typePolicies;
  final bool addTypename;
  final Store store;

  @visibleForTesting
  final BehaviorSubject<Map<String, Map<String, Map<String, dynamic>>>>
      optimisticPatchesStream;

  /// A set of entity IDs to retain when the cache is garbage collected.
  final Set<String> _retainedEntityIds = {};

  Cache({
    Store store,
    this.typePolicies = const {},
    this.addTypename = true,
    Map<String, Map<String, Map<String, dynamic>>> seedOptimisticPatches,
  })  : store = store ?? MemoryStore(),
        optimisticPatchesStream = BehaviorSubject.seeded(
          seedOptimisticPatches ?? {},
        );

  /// Reads data for the given [dataId] from the [Store], merging in any data from optimistic patches
  @visibleForTesting
  Map<String, dynamic> optimisticReader(String dataId) =>
      optimisticPatchesStream.value.values.fold<Map<String, dynamic>>(
        {dataId: store.get(dataId)},
        (merged, patch) => patch.containsKey(dataId)
            ? Map.from(
                utils.deepMerge(
                  merged,
                  {dataId: patch[dataId]},
                ),
              )
            : merged,
      )[dataId];

  Stream<TData> watchQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic = true,
  }) =>
      DeferStream(() {
        final data = readQuery(
          request,
          optimistic: optimistic,
        );

        var closed = false;

        final dataChanged = dataIdsChangeStream(
          request,
          data,
          optimistic,
          optimisticPatchesStream,
          optimisticReader,
          store,
          typePolicies,
          addTypename,
        ).doOnDone(() => closed = true);

        return NeverStream<TData>()
            .startWith(data)
            .takeUntil(dataChanged)
            .concatWith([
          DeferStream(
            () => closed
                ? Stream.empty()
                : watchQuery(request, optimistic: optimistic),
          )
        ]);
      });

  TData readQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic = true,
  }) {
    final json = denormalizeOperation(
      read: optimistic ? optimisticReader : (dataId) => store.get(dataId),
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
      read: optimistic ? optimisticReader : (dataId) => store.get(dataId),
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
  }) =>
      normalizeOperation(
        read: optimistic ? optimisticReader : (dataId) => store.get(dataId),
        write: (dataId, value) => _writeData(
          dataId,
          value,
          optimistic,
          requestId ?? request.requestId,
        ),
        document: request.operation.document,
        operationName: request.operation.operationName,
        // TODO: don't cast to dynamic
        variables: (request.vars as dynamic)?.toJson(),
        data: (data as dynamic)?.toJson(),
        typePolicies: typePolicies,
        addTypename: addTypename,
      );

  void writeFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request,
    TData data, {
    bool optimistic = false,
    String requestId,
  }) =>
      normalizeFragment(
        read: optimistic ? optimisticReader : (dataId) => store.get(dataId),
        write: (dataId, value) => _writeData(
          dataId,
          value,
          optimistic,
          requestId,
        ),
        document: request.document,
        idFields: request.idFields,
        fragmentName: request.fragmentName,
        // TODO: don't cast to dynamic
        variables: (request.vars as dynamic)?.toJson(),
        data: (data as dynamic)?.toJson(),
        typePolicies: typePolicies,
        addTypename: addTypename,
      );

  void _writeData(
    String dataId,
    Map<String, dynamic> value,
    bool optimistic,
    String requestId,
  ) =>
      optimistic
          ? optimisticPatchesStream.add(
              {
                ...optimisticPatchesStream.value,
                requestId: {
                  ...optimisticPatchesStream.value[requestId] ?? const {},
                  dataId: value
                },
              },
            )
          : store.put(dataId, value);

  void removeOptimisticPatch(String requestId) {
    final patches = optimisticPatchesStream.value;
    if (patches.containsKey(requestId)) {
      patches.remove(requestId);
      optimisticPatchesStream.add(patches);
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

    optimisticPatchesStream.add(
      optimisticPatchesStream.value.map(
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
    optimisticPatchesStream.add(
      optimisticPatchesStream.value.map(
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

  /// Prevents the entity from being garbage collected.
  void retain(String entityId) => _retainedEntityIds.add(entityId);

  /// Allows the entity to be garbage collected if it no longer has any
  /// references.
  void release(String entityId) => _retainedEntityIds.remove(entityId);

  /// Removes all entities that cannot be reached from one of the root operations.
  Set<String> gc() {
    final reachable = utils.reachableIds(
      (dataId) => store.get(dataId),
      typePolicies,
    );
    final keysToRemove = store.keys
        .where(
          (key) =>
              !reachable.contains(key) && !_retainedEntityIds.contains(key),
        )
        .toSet();
    store.deleteAll(keysToRemove);
    return keysToRemove;
  }

  /// Removes all data from the store and from any optimistic patches.
  void clear() {
    optimisticPatchesStream.add({});
    store.clear();
  }

  Future<void> dispose() => Future.wait([
        optimisticPatchesStream.close(),
        store.dispose(),
      ]);
}
