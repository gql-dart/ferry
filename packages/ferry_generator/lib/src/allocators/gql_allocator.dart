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
  final String outputDir;

  final _imports = <String, int?>{};
  var _keys = 1;

  GqlAllocator(
    this.sourceUrl,
    this.sourceExtension,
    this.currentUrl,
    this.schemaUrl,
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

      return '_i${_imports.putIfAbsent(replacedUrl, _nextKey)}.$symbol';
    }

    if (uri.path.isEmpty && uri.fragment.isNotEmpty) {
      String replacedUrl;
      if (uri.fragment == 'schema') {
        replacedUrl = schemaUrl;
      } else if (uri.fragment == 'serializer') {
        print('schemaUrl: $schemaUrl');
        replacedUrl = '${p.dirname(schemaUrl)}/serializers.gql.dart';
        print('replacedUrl: $replacedUrl');
      } else {
        replacedUrl = outputPath(sourceUrl, outputDir).replaceAll(
          RegExp(r'.graphql$'),
          '.${uri.fragment}.gql.dart',
        );
      }

      if (replacedUrl == currentUrl) {
        return symbol;
      }

      return '_i${_imports.putIfAbsent(replacedUrl, _nextKey)}.$symbol';
    }

    return '_i${_imports.putIfAbsent(url, _nextKey)}.$symbol';
  }

  int _nextKey() => _keys++;

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => _imports[u] == null
            ? Directive.import(u)
            : Directive.import(u, as: '_i${_imports[u]}'),
      );
}
