import "package:code_builder/code_builder.dart";

import "locations.dart";

/// Allocates import prefixes for generated code and normalizes GraphQL URLs
/// into generated Dart output paths.
///
/// This keeps self-references unprefixed, remaps `.graphql` sources to the
/// `__generated__` outputs (or configured output dir), and deduplicates
/// imports via stable `_i#` aliases.
class GeneratorAllocator implements Allocator {
  static const _doNotImport = [
    "dart:core",
  ];

  final String sourceUrl;
  final String sourceExtension;
  final String currentUrl;
  final String outputDir;
  final String? schemaUrl;

  final _imports = <String, int?>{};
  var _keys = 1;

  GeneratorAllocator({
    required this.sourceUrl,
    required this.sourceExtension,
    required this.currentUrl,
    required this.outputDir,
    this.schemaUrl,
  });

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol ?? "";
    final url = reference.url;

    if (symbol.isEmpty) {
      throw StateError("Reference.symbol must not be null");
    }

    if (url == null || _doNotImport.contains(url)) {
      return symbol;
    }

    final uri = _normalizePackageUri(Uri.parse(url));
    final replacedUrl = _mapReferenceUrl(uri);
    final normalizedCurrent = _normalizePackageUrl(currentUrl);
    final normalizedReplaced = _normalizePackageUrl(replacedUrl);

    if (normalizedReplaced == normalizedCurrent) {
      return symbol;
    }

    return "_i${_imports.putIfAbsent(normalizedReplaced, _nextKey)}.$symbol";
  }

  String _mapReferenceUrl(Uri uri) {
    if (uri.path.isEmpty && uri.fragment.isNotEmpty) {
      final baseUrl = uri.fragment == "schema" && schemaUrl != null
          ? schemaUrl!
          : sourceUrl;
      final sourceUri = Uri.parse(baseUrl);
      final mappedPath = replaceSourceExtension(
        outputPath(sourceUri.path, outputDir),
        sourceExtension,
        ".${uri.fragment}.gql.dart",
      );
      final normalizedPath = _normalizePackagePath(
        mappedPath,
        sourceUri.scheme,
      );
      if (sourceUri.scheme == "package") {
        return Uri(
          scheme: sourceUri.scheme,
          path: normalizedPath,
          query: sourceUri.query,
        ).toString();
      }
      return Uri(
        scheme: sourceUri.scheme,
        userInfo: sourceUri.userInfo,
        host: sourceUri.host,
        port: sourceUri.port,
        path: normalizedPath,
        query: sourceUri.query,
      ).toString();
    }

    if (uri.path.endsWith(sourceExtension)) {
      final mappedPath = replaceSourceExtension(
        outputPath(uri.path, outputDir),
        sourceExtension,
        ".${uri.fragment}.gql.dart",
      );
      final normalizedPath = _normalizePackagePath(mappedPath, uri.scheme);
      if (uri.scheme == "package") {
        return Uri(
          scheme: uri.scheme,
          path: normalizedPath,
          query: uri.query,
        ).toString();
      }
      return Uri(
        scheme: uri.scheme,
        userInfo: uri.userInfo,
        host: uri.host,
        port: uri.port,
        path: normalizedPath,
        query: uri.query,
      ).toString();
    }

    return uri.toString();
  }

  Uri _normalizePackageUri(Uri uri) {
    if (uri.scheme != "package") return uri;
    final normalizedPath = _normalizePackagePath(uri.path, uri.scheme);
    final fragment = uri.fragment.isEmpty ? null : uri.fragment;
    final query = uri.query.isEmpty ? null : uri.query;
    return Uri(
      scheme: uri.scheme,
      path: normalizedPath,
      fragment: fragment,
      query: query,
    );
  }

  String _normalizePackageUrl(String url) {
    final uri = Uri.parse(url);
    if (uri.scheme != "package") return url;
    final normalizedPath = _normalizePackagePath(uri.path, uri.scheme);
    final fragment = uri.fragment.isEmpty ? null : uri.fragment;
    final query = uri.query.isEmpty ? null : uri.query;
    return Uri(
      scheme: uri.scheme,
      path: normalizedPath,
      fragment: fragment,
      query: query,
    ).toString();
  }

  String _normalizePackagePath(String path, String scheme) {
    if (scheme != "package") return path;
    if (!path.startsWith("/")) return path;
    return path.replaceFirst(RegExp("^/+"), "");
  }

  int _nextKey() => _keys++;

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => _imports[u] == null
            ? Directive.import(u)
            : Directive.import(u, as: "_i${_imports[u]}"),
      );
}
