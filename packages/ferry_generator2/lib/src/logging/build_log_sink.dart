import "dart:convert";

import "package:build/build.dart";

import "diagnostics.dart";
import "sink.dart";

final class BuildLogSink implements LogSink {
  final LoggingConfig config;
  final String assetId;

  BuildLogSink({
    required this.config,
    required AssetId inputId,
  }) : assetId = inputId.toString();

  @override
  void emit(LogEvent event) {
    if (!config.shouldLog(event)) return;
    final resolved = event.withContext(LogContext(asset: assetId));
    final message = _format(resolved);
    switch (resolved.level) {
      case LogLevel.debug:
      case LogLevel.info:
        log.info(message);
        break;
      case LogLevel.warn:
        log.warning(message);
        break;
      case LogLevel.error:
        log.severe(message);
        break;
      case LogLevel.off:
        break;
    }
  }

  @override
  LogSink withContext(LogContext context) => ContextualLogSink(this, context);

  String _format(LogEvent event) {
    return switch (config.format) {
      LogFormat.text => _formatText(event),
      LogFormat.json => _formatJson(event),
    };
  }

  String _formatText(LogEvent event) {
    final prefix = "[gen2:${event.category.name}]";
    final context = _formatContext(event.context);
    if (context.isEmpty) return "$prefix ${event.message}";
    return "$prefix ${event.message} ($context)";
  }

  String _formatJson(LogEvent event) {
    final context = <String, Object?>{
      "asset": event.context.asset,
      "operation": event.context.operation,
      "fragment": event.context.fragment,
      "file": event.context.file,
      "line": event.context.line,
      "column": event.context.column,
    }..removeWhere((key, value) => value == null);

    return jsonEncode({
      "level": event.level.name,
      "category": event.category.name,
      "message": event.message,
      "context": context,
    });
  }

  String _formatContext(LogContext context) {
    final parts = <String>[];
    if (context.operation != null) {
      parts.add("op=${context.operation}");
    }
    if (context.fragment != null) {
      parts.add("fragment=${context.fragment}");
    }
    if (context.file != null) {
      final location = context.line == null
          ? context.file!
          : "${context.file}:${context.line}:${context.column ?? 1}";
      parts.add(location);
    }
    return parts.join(", ");
  }
}
