import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";

import "allocator.dart";
import "../config/builder_config.dart";

final _defaultFormatterVersion = DartFormatter.latestShortStyleLanguageVersion;

DartFormatter _formatterFor(BuilderConfig config) => DartFormatter(
      languageVersion:
          config.formatterLanguageVersion ?? _defaultFormatterVersion,
    );

Future<void> writeLibrary({
  required AssetId outputId,
  required Library library,
  required BuildStep buildStep,
  required BuilderConfig config,
  required GeneratorAllocator allocator,
}) {
  final emitter = DartEmitter(
    allocator: allocator,
    orderDirectives: true,
    useNullSafetySyntax: true,
  );
  final generated = library.accept(emitter).toString();
  final formatted =
      config.format ? _formatterFor(config).format(generated) : generated;
  final hasBody = formatted.trim().isNotEmpty;

  final buffer = StringBuffer()
    ..writeln("// GENERATED CODE - DO NOT MODIFY BY HAND")
    ..writeln("// ignore_for_file: type=lint");

  if (config.emitFormatOff) {
    buffer
      ..writeln()
      ..writeln("// dart format off");
    if (hasBody) {
      buffer.writeln();
    }
  } else if (hasBody) {
    buffer.writeln();
  }

  if (hasBody) {
    buffer.write(formatted);
  }

  return buildStep.writeAsString(outputId, buffer.toString());
}
