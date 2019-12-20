import './normalized_cache.dart';

abstract class EntityCache implements NormalizedCache {
  final Map<String, Map<String, dynamic>> data = {};

  EntityCache addLayer(String layerId, Function(EntityCache layer) replay);
  EntityCache removeLayer(String layerId);

  // Although the EntityCache class is abstract, it contains concrete
  // implementations of the various NormalizedCache interface methods that
  // are inherited by the Root and Layer subclasses.

  Map<String, Map<String, dynamic>> toObject() {
    return {...data};
  }

  bool has(String dataId) {
    return data.containsKey(dataId);
  }

  Map<String, dynamic> get(String dataId) {
    return data[dataId];
  }

  void set(String dataId, Map<String, dynamic> value) {
    if (!data.containsKey(dataId) || value != data[dataId]) {
      data[dataId] = value;
      _refs.remove(dataId);
    }
  }

  void delete(String dataId) {
    data.remove(dataId);
    _refs.remove(dataId);
  }

  void clear() {
    replace(null);
  }

  void replace(Map<String, Map<String, dynamic>> newData) {
    data.keys.forEach((dataId) {
      if (!(newData != null && newData.containsKey(dataId))) {
        delete(dataId);
      }
    });
    if (newData != null) {
      newData.keys.forEach((dataId) {
        set(dataId, newData[dataId]);
      });
    }
  }

  // Maps root entity IDs to the number of times they have been retained, minus
  // the number of times they have been released. Retained entities keep other
  // entities they reference (even indirectly) from being garbage collected.
  Map<String, int> _rootIds = {};

  int retain(String rootId) {
    return _rootIds[rootId] = (_rootIds[rootId] ?? 0) + 1;
  }

  int release(String rootId) {
    if (_rootIds[rootId] > 0) {
      final count = --_rootIds[rootId];
      if (count == 0) _rootIds.remove(rootId);
      return count;
    }
    return 0;
  }

  // This method will be overridden in the Layer class to merge root IDs for all
  // layers (including the root).
  Set<String> getRootIdSet() {
    return Set.from(_rootIds.keys);
  }

  // The goal of garbage collection is to remove IDs from the Root layer of the
  // cache that are no longer reachable starting from any IDs that have been
  // explicitly retained (see retain and release, above). Returns an array of
  // dataId strings that were removed from the cache.
  List<String> gc() {
    final ids = getRootIdSet();
    final snapshot = toObject();
    ids.forEach((id) {
      if (snapshot.containsKey(id)) {
        // By removing IDs from the snapshot object here, we protect them from
        // getting removed from the root cache layer below.
        snapshot.remove(id);
        findChildRefIds(id).forEach((id) => snapshot.remove(id));
      }
    });
    final idsToRemove = snapshot.keys;
    if (idsToRemove.isNotEmpty) {
      EntityCache root = this;
      while (root is _EntityCacheLayer) {
        root = (root as _EntityCacheLayer).parent;
      }
      idsToRemove.forEach(root.delete);
    }
    return idsToRemove.toList();
  }

  // Lazily tracks { $ref: <dataId> } strings contained by this.data[dataId].
  Map<String, Set<String>> _refs = {};

  Set<String> findChildRefIds(String dataId) {
    if (!_refs.containsKey(dataId)) {
      _refs[dataId] = Set();

      void traverse(Object obj) {
        if (obj is Map && obj.containsKey("\$ref"))
          _refs[dataId].add(obj["\$ref"]);
        else if (obj is List)
          obj.forEach(traverse);
        else if (obj is Map) obj.values.forEach(traverse);
      }

      traverse(data[dataId]);
    }
    return _refs[dataId];
  }
}

class EntityCacheRoot extends EntityCache {
  EntityCacheRoot({Map<String, Map<String, dynamic>> seed}) : super() {
    if (seed != null) replace(seed);
  }

  @override
  EntityCache addLayer(String layerId, Function(EntityCache layer) replay) {
    // The replay function will be called in the Layer constructor.
    return _EntityCacheLayer(id: layerId, parent: this, replay: replay);
  }

  @override
  EntityCache removeLayer(String layerId) {
    // Never remove the root layer.
    return this;
  }
}

class _EntityCacheLayer extends EntityCache {
  final String id;
  final EntityCache parent;
  final Function(EntityCache layer) replay;

  _EntityCacheLayer({this.id, this.parent, this.replay}) : super() {
    replay(this);
  }

  @override
  EntityCache addLayer(String layerId, Function(EntityCache layer) replay) {
    return _EntityCacheLayer(id: layerId, parent: this, replay: replay);
  }

  EntityCache removeLayer(String layerId) {
    // Remove all instances of the given id, not just the first one.
    final parent = this.parent.removeLayer(layerId);

    if (layerId == this.id) {
      return parent;
    }

    // No changes are necessary if the parent chain remains identical.
    if (parent == this.parent) return this;

    // Recreate this layer on top of the new parent.
    return parent.addLayer(this.id, this.replay);
  }
}
