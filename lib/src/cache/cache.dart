import 'package:meta/meta.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';
import 'package:gql/ast.dart';

export 'package:normalize/normalize.dart' show TypePolicy, AddTypenameVisitor;

import '../helpers/deep_merge.dart';

class GQLCache {
  final BehaviorSubject<Map<String, Map<String, dynamic>>> _dataStream;
  final BehaviorSubject<Map<String, Map<String, Map<String, dynamic>>>>
      _optimisticPatchesStream;
  final _optimisticDataStream =
      BehaviorSubject<Map<String, Map<String, dynamic>>>();

  GQLCache(
      {Map<String, Map<String, dynamic>> seedData,
      Map<String, Map<String, Map<String, dynamic>>> seedOptimisticPatches})
      : _dataStream = BehaviorSubject.seeded(seedData ?? {}),
        _optimisticPatchesStream =
            BehaviorSubject.seeded(seedOptimisticPatches ?? {}) {
    // TODO: can this be done without listening in the constructor?
    CombineLatestStream.combine2<
            Map<String, Map<String, dynamic>>,
            Map<String, Map<String, Map<String, dynamic>>>,
            Map<String, Map<String, dynamic>>>(
        _dataStream, _optimisticPatchesStream, (data, optimisticPatches) {
      return optimisticPatches.values
          .fold(data, (a, b) => Map.from(deepMerge(a, b)));
    }).listen((data) => _optimisticDataStream.add(data));
  }

  Map<String, dynamic> get data {
    return _dataStream.value;
  }

  Map<String, dynamic> get optimisticData {
    return _optimisticDataStream.value;
  }

  Stream<Map<String, dynamic>> watchQuery(
      {@required DocumentNode document,
      @required String operationName,
      Map<String, dynamic> variables,
      bool optimistic = true,
      bool addTypename = true,
      Map<String, TypePolicy> typePolicies = const {}}) {
    final stream = optimistic ? _optimisticDataStream : _dataStream;
    return stream.map((data) => denormalize(
        query: document,
        addTypename: addTypename,
        operationName: operationName,
        normalizedMap: data,
        variables: variables,
        typePolicies: typePolicies));
  }

  Map<String, dynamic> readQuery(
      {@required DocumentNode document,
      @required String operationName,
      Map<String, dynamic> variables,
      bool optimistic = true,
      bool addTypename = true,
      Map<String, TypePolicy> typePolicies = const {}}) {
    return denormalize(
        query: document,
        addTypename: addTypename,
        operationName: operationName,
        normalizedMap: optimistic ? optimisticData : data,
        variables: variables,
        typePolicies: typePolicies);
  }

  void writeQuery(
      {@required String queryId,
      @required DocumentNode document,
      @required String operationName,
      Map<String, dynamic> variables,
      @required Map<String, dynamic> data,
      bool optimistic = false,
      Map<String, TypePolicy> typePolicies = const {}}) {
    final result = normalize(
        query: document,
        operationName: operationName,
        variables: variables,
        data: data,
        typePolicies: typePolicies);
    optimistic
        ? _optimisticPatchesStream
            .add({..._optimisticPatchesStream.value, queryId: result})
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
