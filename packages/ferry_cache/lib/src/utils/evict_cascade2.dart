import 'package:collection/collection.dart';
import 'package:ferry_cache/src/cache.dart';
import 'package:meta/meta.dart';
import 'package:normalize/src/utils/constants.dart';

@internal
abstract class NodeRef {
  void evict(Cache cache);
}

/// A reference to a node in the cache, by id.
@internal
class IdNodeRef extends NodeRef {
  final String id;

  IdNodeRef(this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdNodeRef && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  void evict(Cache cache) {
    cache.store.delete(id);
  }

  @override
  String toString() {
    return 'IdNodeRef{id: $id}';
  }
}

/// A reference to a node in the cache, by id and a path the a field in that node.
@internal
class PathNodeRef extends NodeRef {
  final String id;

  /// The path to the field in the node.
  /// each element in the path is either a String or an int.
  /// if the element is a String, it is the name of a field in the node.
  /// if the element is an int, it is the index of an element in a list.
  final List< /*String | int */ Object> path;

  PathNodeRef(this.id, this.path);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PathNodeRef &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          const ListEquality().equals(path, other.path);

  @override
  int get hashCode => id.hashCode ^ const ListEquality().hash(path);

  @override
  void evict(Cache cache) {
    final data = cache.store.get(id);

    if (data == null) {
      return;
    }

    final copy = data;

    dynamic current = copy;

    for (var i = 0; i < path.length - 2; i++) {
      final key = path[i];
      final next = current[key];
      if (next == null) {
        return;
      }
      current = next;
    }

    final last = path.last;

    if (last is int) {
      final list = current as List;
      if (last >= list.length) {
        return;
      }
      list.removeAt(last);
    } else {
      final map = current as Map;
      if (!map.containsKey(last)) {
        return;
      }
      map.remove(last);
    }

    cache.store.put(id, copy);
  }

  @override
  String toString() {
    return 'PathNodeRef{id: $id, path: $path}';
  }
}

Set<NodeRef> nodesReferencingId(
    Set<String> keys, Map<String, dynamic>? Function(String) read, String id,
    {String refKey = kDefaultReferenceKey}) {
  final visited = <String>{};
  final matches = <NodeRef>{};

  final currentNodePath = <NodeRef>[];

  print('nodesReferencingId $id');

  void fieldEntered(String fieldName) {
    print('fieldEntered $fieldName');
    final last = currentNodePath.removeLast();

    if (last is IdNodeRef) {
      currentNodePath.add(PathNodeRef(last.id, [fieldName]));
    } else if (last is PathNodeRef) {
      currentNodePath.add(PathNodeRef(last.id, [...last.path, fieldName]));
    }

    print('fieldEntered end $currentNodePath');
  }

  void fieldExited() {
    print('fieldExited begin $currentNodePath');
    final last = currentNodePath.removeLast();

    assert(last is PathNodeRef);

    if (last is PathNodeRef) {
      if (last.path.length == 1) {
        currentNodePath.add(IdNodeRef(last.id));
      } else {
        currentNodePath.add(
            PathNodeRef(last.id, last.path.sublist(0, last.path.length - 1)));
      }
    }

    print('fieldExited end $currentNodePath');
  }

  void indexEntered(int index) {
    print('indexEntered $index');
    final last = currentNodePath.removeLast();

    assert(last is PathNodeRef);

    if (last is PathNodeRef) {
      currentNodePath.add(PathNodeRef(last.id, [...last.path, index]));
    }
  }

  void indexExited() {
    print('indexExited $currentNodePath');
    final last = currentNodePath.removeLast();

    assert(last is PathNodeRef);

    if (last is PathNodeRef) {
      currentNodePath.add(
          PathNodeRef(last.id, last.path.sublist(0, last.path.length - 1)));
    }
  }

  void visitKey(String key) {
    print('visiting key $key');

    if (key == id) {
      print('found match $currentNodePath');
      matches.addAll(currentNodePath);
    }

    if (!visited.add(key)) {
      print('already visited $key 1');

      return;
    }
    currentNodePath.add(IdNodeRef(key));

    final data = read(key);

    void visitNode(Map<String, dynamic>? data) {
      print('visiting node $data');
      if (data == null) {
        return;
      }

      if (data[refKey] == id) {
        print('found match $currentNodePath');
        matches.addAll((currentNodePath));
        visitKey(id);
      } else if (data.containsKey(refKey)) {
        /// data is a ref to another node
        final refId = data[refKey];

        if (refId == id) {
          throw ('refId == id unpossible');
        }

        visitKey(refId);
      } else {
        for (final fieldName in data.keys) {
          fieldEntered(fieldName);
          final field = data[fieldName];
          if (field is Map<String, dynamic>) {
            visitNode(field);
          } else if (field is List<dynamic>) {
            for (var i = 0; i < field.length; i++) {
              indexEntered(i);
              final item = field[i];
              if (item is Map<String, dynamic>) {
                visitNode(item);
              }
              indexExited();
            }
          }

          fieldExited();
        }
      }
    }

    visitNode(data);

    print('popping ${currentNodePath.last} from $currentNodePath ');

    currentNodePath.removeLast();
  }

  for (final key in keys) {
    visitKey(key);
  }

  return matches;
}
