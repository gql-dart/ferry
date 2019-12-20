import '../core/cache.dart';
import './entity_cache.dart';
import './policies.dart';

class InMemoryCacheConfig {
  Map<String, List<String>> possibleTypes;
  Map<String, TypePolicy> typePolicies;

  InMemoryCacheConfig({this.possibleTypes, this.typePolicies});
}

// TODO: add proper type argument
class InMemoryCache extends GQLCache {
  EntityCache _data;
  EntityCache _optimisticData;

  InMemoryCacheConfig config;
  final watches = Set<WatchOptions>();
  bool addTypename;
}
