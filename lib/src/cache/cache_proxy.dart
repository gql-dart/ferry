import './options.dart';
import './cache.dart';

class CacheProxy {
  final GQLCache _cache;
  final bool _optimistic;
  final String _queryId;

  CacheProxy(
    GQLCache cache,
    bool optimistic,
    String queryId,
  )   : _cache = cache,
        _optimistic = optimistic,
        _queryId = queryId;

  Map<String, dynamic> readQuery(
    ReadQueryOptions options,
  ) =>
      _cache.readQuery(options);

  Map<String, dynamic> readFragment(
    ReadFragmentOptions options,
  ) =>
      _cache.readFragment(options);

  void writeQuery(
    WriteQueryOptions options,
  ) =>
      _cache.writeQuery(options, _optimistic, _queryId);

  void writeFragment(
    WriteFragmentOptions options,
  ) =>
      _cache.writeFragment(options, _optimistic, _queryId);
}
