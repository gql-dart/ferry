import 'package:rxdart/rxdart.dart';

enum FetchPolicy {
  /// Return result from cache. Only fetch from network if cached result is not available.
  ///
  /// Default
  CacheFirst,

  /// Return result from cache first (if it exists), then return network result once it's available.
  CacheAndNetwork,

  /// Return result from network, fail if network call doesn't succeed, save to cache
  NetworkOnly,

  /// Return result from cache if available, fail otherwise.
  CacheOnly,

  /// Return result from network, fail if network call doesn't succeed, don't save to cache
  NoCache,

  /// Only for queries that aren't actively watched, but should be available for refetch and updateQueries.
  Standby,
}

class Mutation {
  final Function() update;
  final Object optimisticResponse;

  Mutation({this.update, this.optimisticResponse});
}

// everything should be derived from an observable active query map
class QueryManager {
  final BehaviorSubject<Map<String, Mutation>> mutationStore =
      BehaviorSubject();

  // TODO: get actual
  Observable<Map<dynamic, dynamic>> cacheData;

  Observable<List<Mutation>> optimisticMutations;
  Observable<Map<dynamic, dynamic>> reducedCache;

  QueryManager() {
    optimisticMutations = mutationStore.flatMap((mutationMap) =>
        Observable.just(mutationMap.values
            .where((mutation) => mutation.optimisticResponse != null)
            .toList()));

    reducedCache = Observable.combineLatest2(
        cacheData, optimisticMutations, (data, optimistic) {});
  }
}
