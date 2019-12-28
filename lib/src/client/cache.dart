import 'package:meta/meta.dart';
import 'dart:async';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:normalize/normalize.dart';

import '../helpers/deep_merge.dart';

class GQLCache {
  final _dataStream =
      BehaviorSubject<Map<String, Map<String, Object>>>.seeded({});
  final _optimisticPatchesStream =
      BehaviorSubject<List<Map<String, Map<String, Object>>>>.seeded([]);

  Stream<Map<String, Map<String, Object>>> _optimisticDataStream;

  GQLCache() {
    _optimisticDataStream = CombineLatestStream.combine2<
            Map<String, Map<String, Object>>,
            List<Map<String, Map<String, Object>>>,
            Map<String, Map<String, Object>>>(
        _dataStream, _optimisticPatchesStream, (data, optimisticPatches) {
      final result = optimisticPatches.fold(data, deepMerge);
      return result;
    });
  }

  Stream<T> watchQuery<T, TVariables extends JsonSerializable>(
      GraphQLQuery<T, TVariables> query,
      {bool optimistic = true,
      Map<String, TypePolicy> typePolicies = const {}}) {
    final stream = optimistic ? _optimisticDataStream : _dataStream;
    return stream.map((data) {
      final result = denormalize(
          query: query.document,
          normalizedMap: data,
          variables: query.getVariablesMap(),
          typePolicies: typePolicies);
      return query.parse(result);
    });
  }
}
