import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';

export 'package:normalize/normalize.dart' show TypePolicy, AddTypenameVisitor;

import '../helpers/deep_merge.dart';
import './options.dart';

class GQLCache {
  final Map<String, TypePolicy> typePolicies;

  final BehaviorSubject<Map<String, Map<String, dynamic>>> _dataStream;
  final BehaviorSubject<Map<String, Map<String, Map<String, dynamic>>>>
      _optimisticPatchesStream;
  final _optimisticDataStream =
      BehaviorSubject<Map<String, Map<String, dynamic>>>();

  GQLCache({
    this.typePolicies = const {},
    Map<String, Map<String, dynamic>> seedData,
    Map<String, Map<String, Map<String, dynamic>>> seedOptimisticPatches,
  })  : _dataStream = BehaviorSubject.seeded(seedData ?? {}),
        _optimisticPatchesStream = BehaviorSubject.seeded(
          seedOptimisticPatches ?? {},
        ) {
    // TODO: can this be done without listening in the constructor?
    CombineLatestStream.combine2<
        Map<String, Map<String, dynamic>>,
        Map<String, Map<String, Map<String, dynamic>>>,
        Map<String, Map<String, dynamic>>>(
      _dataStream,
      _optimisticPatchesStream,
      (data, optimisticPatches) {
        return optimisticPatches.values
            .fold(data, (a, b) => Map.from(deepMerge(a, b)));
      },
    ).listen((data) => _optimisticDataStream.add(data));
  }

  Map<String, dynamic> get data {
    return _dataStream.value;
  }

  Map<String, dynamic> get optimisticData {
    return _optimisticDataStream.value;
  }

  Stream<Map<String, dynamic>> watchQuery(
    WatchQueryOptions options,
  ) =>
      (options.optimistic ? _optimisticDataStream : _dataStream)
          .map((data) => denormalize(
                query: options.document,
                addTypename: options.addTypename,
                operationName: options.operationName,
                normalizedMap: data,
                variables: options.variables,
                typePolicies: typePolicies,
              ));

  Map<String, dynamic> readQuery(
    ReadQueryOptions options,
  ) =>
      denormalize(
        query: options.document,
        addTypename: options.addTypename,
        operationName: options.operationName,
        normalizedMap: options.optimistic ? optimisticData : data,
        variables: options.variables,
        typePolicies: typePolicies,
      );

  Map<String, dynamic> readFragment(
    ReadFragmentOptions options,
  ) =>
      denormalizeFragment(
        fragment: options.fragment,
        idFields: options.idFields,
        normalizedMap: options.optimistic ? optimisticData : data,
        fragmentName: options.fragmentName,
        variables: options.variables,
        typePolicies: typePolicies,
        addTypename: options.addTypename,
      );

  void writeQuery(
    WriteQueryOptions options, [
    bool optimistic = false,
    String queryId,
  ]) {
    final result = normalize(
      query: options.document,
      operationName: options.operationName,
      variables: options.variables,
      data: options.data,
      typePolicies: typePolicies,
    );
    optimistic
        ? _optimisticPatchesStream.add({
            ..._optimisticPatchesStream.value,
            queryId: Map.from(deepMerge(
                _optimisticPatchesStream.value[queryId] ?? {}, result)),
          })
        : _dataStream.add(Map.from(deepMerge(_dataStream.value, result)));
  }

  void writeFragment(
    WriteFragmentOptions options, [
    bool optimistic = false,
    String queryId,
  ]) {
    final result = normalizeFragment(
      fragment: options.fragment,
      idFields: options.idFields,
      data: options.data,
      fragmentName: options.fragmentName,
      variables: options.variables,
      typePolicies: typePolicies,
    );
    optimistic
        ? _optimisticPatchesStream.add({
            ..._optimisticPatchesStream.value,
            queryId: Map.from(deepMerge(
                _optimisticPatchesStream.value[queryId] ?? {}, result)),
          })
        : _dataStream.add(Map.from(deepMerge(_dataStream.value, result)));
  }

  void removeOptimisticPatch(String id) {
    final patches = _optimisticPatchesStream.value;
    if (patches.containsKey(id)) {
      patches.remove(id);
      _optimisticPatchesStream.add(patches);
    }
  }
}
