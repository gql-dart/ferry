import 'package:code_builder/code_builder.dart';

/// Imports only the relevent references from the source, "show"
class PickAllocator implements Allocator {
  final List<String> doNotPick;
  final List<String> include;

  final Map<String, List<String>?> _imports = {};

  PickAllocator({
    this.doNotPick = const [],
    this.include = const [],
  }) {
    for (final url in include) {
      _imports[url] = null;
    }
  }

  static const _doNotImport = [
    'dart:core',
  ];

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol!;
    final url = reference.url;

    if (url == null || _doNotImport.contains(url)) {
      return symbol;
    } else if (doNotPick.contains(url) || include.contains(url)) {
      _imports.putIfAbsent(url, () => null);
      return symbol;
    }

    _imports.update(url, (symbols) => symbols?..add(symbol),
        ifAbsent: () => [symbol]);

    return symbol;
  }

  @override
  Iterable<Directive> get imports => _imports.entries.map(
        (u) => u.value == null
            ? Directive.import(u.key)
            : Directive.import(u.key, show: u.value!),
      );
}
