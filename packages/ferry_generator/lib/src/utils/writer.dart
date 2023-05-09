import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

final DartFormatter _dartfmt = DartFormatter();

Future<void> writeDocument(
  AssetId outputId,
  Library library,
  Allocator allocator,
  BuildStep buildStep,
) {
  if (library.body.isEmpty) return Future.value(null);

  print('writeDocument: ${outputId.path}');

  final libString = library
      .accept(
        DartEmitter(
          allocator: allocator,
          orderDirectives: true,
          useNullSafetySyntax: true,
        ),
      )
      .toString();

  final formatted = _dartfmt.format(libString);

  return buildStep.writeAsString(
    outputId,
    '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
            '// ignore_for_file: type=lint\n\n' +
        formatted,
  );
}
