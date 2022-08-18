import 'dart:async';

import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_store/ferry_store.dart';
import 'package:meta/meta.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart' as utils;
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

import './fragment_data_change_stream.dart';
import './operation_data_change_stream.dart';

class Cache {
  final Map<String, TypePolicy> typePolicies;
  final Map<String, Set<String>> possibleTypes;
  final bool addTypename;
  final Store store;
  final utils.DataIdResolver? dataIdFromObject;

  @visibleForTesting
  final BehaviorSubject<
          Map<OperationRequest, Map<String, Map<String, dynamic>?>>?>
      optimisticPatchesStream;

  /// A set of entity IDs to retain when the cache is garbage collected.
  final Set<String> _retainedEntityIds = {};

  Cache({
    Store? store,
    this.dataIdFromObject,
    this.typePolicies = const {},
    this.possibleTypes = const {},
    this.addTypename = true,
    Map<OperationRequest, Map<String, Map<String, dynamic>?>>
        seedOptimisticPatches = const {},
  })  : store = store ?? MemoryStore(),
        optimisticPatchesStream = BehaviorSubject.seeded(seedOptimisticPatches);

  /// Reads data for the given [dataId] from the [Store], merging in any data from optimistic patches
  @visibleForTesting
  Future<Map<String, dynamic>?> optimisticReader(String dataId) async =>
      (await optimisticPatchesStream.value!.values
          .fold<Future<Map<String, dynamic>>>(
        Future.value({dataId: await store.get(dataId)}),
        (merged, patch) async {
          final toMerge = await merged;
          return patch.containsKey(dataId)
              ? Map.from(
                  utils.deepMerge(
                    toMerge,
                    {dataId: patch[dataId]},
                  ),
                )
              : toMerge;
        },
      ))[dataId];

  /// Watches for changes to data in the Cache for the given operation.
  Stream<TData?> watchQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic = true,
  }) =>
      _watch(
        getChangeStream: () => operationDataChangeStream(
          request,
          optimistic,
          optimisticPatchesStream,
          optimisticReader,
          store,
          typePolicies,
          addTypename,
          dataIdFromObject,
          possibleTypes,
        ),
        getData: () => readQuery(request, optimistic: optimistic),
      );

  /// Watches for changes to data in the Cache for the given fragment.
  Stream<TData?> watchFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request, {
    bool optimistic = true,
  }) =>
      _watch(
        getChangeStream: () => fragmentDataChangeStream(
          request,
          optimistic,
          optimisticPatchesStream,
          optimisticReader,
          store,
          typePolicies,
          addTypename,
          dataIdFromObject,
          possibleTypes,
        ),
        getData: () => readFragment(request, optimistic: optimistic),
      );

  Stream<TData?> _watch<TData>({
    required Future<Stream> Function() getChangeStream,
    required Future<TData?> Function() getData,
  }) {
    late StreamController<TData?> sc;

    Future<void> addNext() async {
      try {
        if (sc.isClosed) return;

        sc.add(await getData());
        if (await (await getChangeStream()).isEmpty) {
          unawaited(sc.close());
          return;
        }

        unawaited(addNext());
      } catch (err, st) {
        if (!sc.isClosed) {
          sc.addError(err, st);
          unawaited(addNext());
        }
      }
    }

    sc = StreamController<TData?>(
      onListen: () => addNext(),
      onCancel: () => unawaited(sc.close()),
    );

    return sc.stream;
  }

  /// Reads denormalized data from the Cache for the given operation.
  Future<TData?> readQuery<TData, TVars>(
    OperationRequest<TData, TVars> request, {
    bool optimistic = true,
  }) async {
    final json = await denormalizeOperation(
      read: optimistic ? optimisticReader : (dataId) => store.get(dataId),
      document: request.operation.document,
      addTypename: addTypename,
      operationName: request.operation.operationName,
      // TODO: don't cast to dynamic
      variables: (request.vars as dynamic)?.toJson(),
      typePolicies: typePolicies,
      dataIdFromObject: dataIdFromObject,
      possibleTypes: possibleTypes,
    );
    return json == null ? null : request.parseData(json);
  }

  /// Reads denormalized data from the Cache for the given fragment.
  Future<TData?> readFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request, {
    bool optimistic = true,
  }) async {
    final json = await denormalizeFragment(
      read: optimistic ? optimisticReader : (dataId) => store.get(dataId),
      document: request.document,
      idFields: request.idFields,
      fragmentName: request.fragmentName,
      // TODO: don't cast to dynamic
      variables: (request.vars as dynamic)?.toJson(),
      typePolicies: typePolicies,
      addTypename: addTypename,
      dataIdFromObject: dataIdFromObject,
      possibleTypes: possibleTypes,
    );
    return json == null ? null : request.parseData(json);
  }

  /// Normalizes [data] for the given operation and writes it to the [Store].
  ///
  /// If an [optimisticRequest] is provided, the changes will be written as an
  /// optimistic patch and will be reverted once a non-optimistic response is
  /// received for the [optimisticRequest].
  Future<void> writeQuery<TData, TVars>(
    OperationRequest<TData, TVars> request,
    TData data, {
    OperationRequest? optimisticRequest,
  }) =>
      normalizeOperation(
        read: optimisticRequest != null
            ? optimisticReader
            : (dataId) => store.get(dataId),
        write: (dataId, value) => _writeData(
          dataId,
          value,
          optimisticRequest,
        ),
        document: request.operation.document,
        operationName: request.operation.operationName,
        // TODO: don't cast to dynamic
        variables: (request.vars as dynamic)?.toJson(),
        data: (data as dynamic)?.toJson(),
        typePolicies: typePolicies,
        addTypename: addTypename,
        dataIdFromObject: dataIdFromObject,
        possibleTypes: possibleTypes,
      );

  /// Normalizes [data] for the given fragment and writes it to the [Store].
  ///
  /// If an [optimisticRequest] is provided, the changes will be written as an
  /// optimistic patch and will be reverted once a non-optimistic response is
  /// received for the [optimisticRequest].
  Future<void> writeFragment<TData, TVars>(
    FragmentRequest<TData, TVars> request,
    TData data, {
    OperationRequest? optimisticRequest,
  }) =>
      normalizeFragment(
        read: optimisticRequest != null
            ? optimisticReader
            : (dataId) => store.get(dataId),
        write: (dataId, value) => _writeData(
          dataId,
          value,
          optimisticRequest,
        ),
        document: request.document,
        idFields: request.idFields,
        fragmentName: request.fragmentName,
        // TODO: don't cast to dynamic
        variables: (request.vars as dynamic)?.toJson(),
        data: (data as dynamic)?.toJson(),
        typePolicies: typePolicies,
        addTypename: addTypename,
        dataIdFromObject: dataIdFromObject,
        possibleTypes: possibleTypes,
      );

  Future<void> _writeData(
    String dataId,
    Map<String, dynamic>? value,
    OperationRequest? optimisticRequest,
  ) async =>
      optimisticRequest != null
          ? optimisticPatchesStream.add(
              {
                ...optimisticPatchesStream.value!,
                optimisticRequest: {
                  ...optimisticPatchesStream.value![optimisticRequest] ??
                      const {},
                  dataId: value,
                }
              },
            )
          : store.put(dataId, value);

  void removeOptimisticPatch(OperationRequest request) {
    optimisticPatchesStream.add(
      Map.from(optimisticPatchesStream.value!)..remove(request),
    );
  }

  /// Returns the canonical ID for a given object or reference.
  String? identify<TData>(TData data) => utils.identify(
        // TODO: don't cast to dynamic
        (data as dynamic)?.toJson(),
        typePolicies: typePolicies,
        dataIdFromObject: dataIdFromObject,
      );

  /// Removes the entity from the [Store] as well as from any optimistic
  /// patches.
  ///
  /// You can retrieve an [entityId] by calling [Cache.identify].
  ///
  /// If a [fieldName] is provided, only that field will be removed. If an
  /// [args] Map is provided, only fields that include matching values for
  /// each arg will be removed.
  ///
  /// If an [optimisticRequest] is provided, the changes will be written as an
  /// optimistic patch and will be reverted once a non-optimistic response is
  /// received for the [optimisticRequest].
  Future<void> evict(
    String entityId, {
    String? fieldName,
    Map<String, dynamic> args = const {},
    OperationRequest? optimisticRequest,
  }) =>
      fieldName == null
          ? _evictEntity(
              entityId,
              optimisticRequest,
            )
          : _evictField(
              entityId,
              fieldName,
              args,
              optimisticRequest,
            );

  Future<void> _evictEntity(
    String entityId,
    OperationRequest? optimisticRequest,
  ) async {
    if (optimisticRequest != null) {
      /// Set entity to `null` in optimistic patch
      optimisticPatchesStream.add({
        ...optimisticPatchesStream.value!,
        optimisticRequest: {
          ...(optimisticPatchesStream.value![optimisticRequest] ?? const {}),
          entityId: null,
        }
      });
    } else {
      /// Remove entity from [Store] and in optimistic patches.
      await store.delete(entityId);

      optimisticPatchesStream.add(
        optimisticPatchesStream.value!.map(
          (patchKey, patch) => MapEntry(patchKey, patch..remove(entityId)),
        ),
      );
    }
  }

  Future<void> _evictField(
    String entityId,
    String fieldName,
    Map<String, dynamic> args,
    OperationRequest? optimisticRequest,
  ) async {
    if (optimisticRequest != null) {
      /// Set field to `null` in optimistic patch
      optimisticPatchesStream.add({
        ...optimisticPatchesStream.value!,
        optimisticRequest: {
          ...(optimisticPatchesStream.value![optimisticRequest] ?? {}),
          entityId: {
            ...((optimisticPatchesStream.value![optimisticRequest] ??
                    {})[entityId]) ??
                {},
            utils.FieldKey.from(fieldName, args).toString(): null
          },
        }
      });
    } else {
      /// Remove field from entity in [Store] and in optimistic patches.
      optimisticPatchesStream.add(
        optimisticPatchesStream.value!.map(
          (patchKey, patch) {
            if (!patch.containsKey(entityId)) return MapEntry(patchKey, patch);
            return MapEntry(
              patchKey,
              patch
                ..[entityId]!.removeWhere(
                  (key, value) => _fieldMatch(key, fieldName, args),
                ),
            );
          },
        ),
      );

      final entity = await store.get(entityId);
      if (entity != null) {
        await store.put(
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
  Future<Set<String>> gc() async {
    final reachable = await utils.reachableIds(
      (dataId) => store.get(dataId),
      typePolicies,
    );
    final keysToRemove = store.keys
        .where(
          (key) =>
              !reachable.contains(key) && !_retainedEntityIds.contains(key),
        )
        .toSet();
    await store.deleteAll(keysToRemove);
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
