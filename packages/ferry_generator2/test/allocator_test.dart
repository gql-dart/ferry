import 'package:code_builder/code_builder.dart';
import 'package:ferry_generator2/src/utils/allocator.dart';
import 'package:test/test.dart';

void main() {
  test('allocator normalizes package imports', () {
    final allocator = GeneratorAllocator(
      sourceUrl: 'package:demo/foo.graphql',
      sourceExtension: '.graphql',
      currentUrl: 'package:demo/__generated__/foo.data.gql.dart',
      outputDir: '__generated__',
    );

    final allocated = allocator.allocate(
      const Reference(
        'GBar',
        'package:demo/bar.graphql#data',
      ),
    );

    expect(allocated, '_i1.GBar');
    final imports = allocator.imports.toList();
    expect(imports, hasLength(1));
    expect(imports.first.url, 'package:demo/__generated__/bar.data.gql.dart');
    expect(imports.first.as, '_i1');
  });

  test('allocator skips self imports', () {
    final allocator = GeneratorAllocator(
      sourceUrl: 'package:demo/foo.graphql',
      sourceExtension: '.graphql',
      currentUrl: 'package:demo/__generated__/foo.data.gql.dart',
      outputDir: '__generated__',
    );

    final allocated = allocator.allocate(
      const Reference(
        'GFooData',
        'package:demo/foo.graphql#data',
      ),
    );

    expect(allocated, 'GFooData');
    expect(allocator.imports, isEmpty);
  });
}
