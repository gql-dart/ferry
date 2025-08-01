import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;

import '../utils/locations.dart';

class GqlAllocator implements Allocator {
  static const _doNotImport = [
    'dart:core',
  ];

  static const _doNotPrefix = [
    'package:built_value/built_value.dart',
    'package:built_value/serializer.dart',
    'package:built_collection/built_collection.dart',
    'package:gql_code_builder/src/utils/non_built_serializer.dart',
  ];

  final String sourceUrl;
  final String sourceExtension;
  final String currentUrl;
  final String schemaUrl;
  final String serializerUrl;
  final String outputDir;

  final _imports = <String, int?>{};
  final _urlsRequiringAliases = <String>[];
  Map<String, int>? _sortedAliasCache;

  GqlAllocator(
    this.sourceUrl,
    this.sourceExtension,
    this.currentUrl,
    this.schemaUrl,
    this.serializerUrl,
    this.outputDir,
  );

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol!;
    final url = reference.url;

    if (url == null || _doNotImport.contains(url)) {
      return symbol;
    } else if (_doNotPrefix.contains(url)) {
      _imports.putIfAbsent(url, () => null);
      return symbol;
    }

    final uri = Uri.parse(url);

    if (uri.path.endsWith(sourceExtension)) {
      final replacedUrl = uri
          .replace(
            path: outputPath(uri.path, outputDir).replaceAll(
              RegExp(r'.graphql$'),
              '.${uri.fragment}.gql.dart',
            ),
          )
          .removeFragment()
          .toString();

      if (replacedUrl == currentUrl) {
        return symbol;
      }

      _recordUrlForAlias(replacedUrl);
      final aliasNumber = _getAliasForUrl(replacedUrl);
      _imports[replacedUrl] = aliasNumber; // Track locally for imports
      return '_i$aliasNumber.$symbol';
    }

    if (uri.path.isEmpty && uri.fragment.isNotEmpty) {
      String replacedUrl;
      if (uri.fragment == 'schema') {
        replacedUrl = schemaUrl;
      } else if (uri.fragment == 'serializer') {
        replacedUrl = '${p.dirname(serializerUrl)}/serializers.gql.dart';
      } else {
        replacedUrl = outputPath(sourceUrl, outputDir).replaceAll(
          RegExp(r'.graphql$'),
          '.${uri.fragment}.gql.dart',
        );
      }

      if (replacedUrl == currentUrl) {
        return symbol;
      }

      _recordUrlForAlias(replacedUrl);
      final aliasNumber = _getAliasForUrl(replacedUrl);
      _imports[replacedUrl] = aliasNumber; // Track locally for imports
      return '_i$aliasNumber.$symbol';
    }

    _recordUrlForAlias(url);
    final aliasNumber = _getAliasForUrl(url);
    _imports[url] = aliasNumber; // Track locally for imports
    return '_i$aliasNumber.$symbol';
  }

  void _recordUrlForAlias(String url) {
    if (!_urlsRequiringAliases.contains(url)) {
      _urlsRequiringAliases.add(url);
      // Invalidate cache when new URL is added
      _sortedAliasCache = null;
    }
  }

  int _getAliasForUrl(String url) {
    // Return cached alias if already computed locally
    final existingAlias = _imports[url];
    if (existingAlias != null) {
      return existingAlias;
    }

    // Build sorted alias cache if not exists or invalidated
    _sortedAliasCache ??= _buildSortedAliasMap();

    final aliasNumber = _sortedAliasCache![url]!;
    _imports[url] = aliasNumber;
    return aliasNumber;
  }

  Map<String, int> _buildSortedAliasMap() {
    final sortedUrls = _urlsRequiringAliases.toList()..sort();
    final aliasMap = <String, int>{};
    for (int i = 0; i < sortedUrls.length; i++) {
      aliasMap[sortedUrls[i]] = i + 1;
    }
    return aliasMap;
  }

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => _imports[u] == null
            ? Directive.import(u)
            : Directive.import(u, as: '_i${_imports[u]}'),
      );
}
