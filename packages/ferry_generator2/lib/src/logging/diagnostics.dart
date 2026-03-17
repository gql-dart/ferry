enum LogLevel { off, error, warn, info, debug }

enum LogFormat { text, json }

enum LogCategory {
  config,
  validation,
  schema,
  ir,
  data,
  vars,
  req,
  emit,
  build,
}

final class LogContext {
  final String? asset;
  final String? operation;
  final String? fragment;
  final String? file;
  final int? line;
  final int? column;

  const LogContext({
    this.asset,
    this.operation,
    this.fragment,
    this.file,
    this.line,
    this.column,
  });

  LogContext merge(LogContext other) => LogContext(
        asset: other.asset ?? asset,
        operation: other.operation ?? operation,
        fragment: other.fragment ?? fragment,
        file: other.file ?? file,
        line: other.line ?? line,
        column: other.column ?? column,
      );
}

final class LogEvent {
  final LogLevel level;
  final LogCategory category;
  final String message;
  final LogContext context;

  const LogEvent({
    required this.level,
    required this.category,
    required this.message,
    this.context = const LogContext(),
  });

  LogEvent withContext(LogContext base) => LogEvent(
        level: level,
        category: category,
        message: message,
        context: base.merge(context),
      );
}

final class LoggingConfig {
  final LogLevel level;
  final LogFormat format;
  final Set<LogCategory> categories;

  const LoggingConfig({
    required this.level,
    required this.format,
    required this.categories,
  });

  bool shouldLog(LogEvent event) {
    if (!_allows(event.level)) return false;
    if (event.level == LogLevel.warn || event.level == LogLevel.error) {
      return true;
    }
    if (categories.isEmpty) return true;
    return categories.contains(event.category);
  }

  bool _allows(LogLevel eventLevel) {
    if (level == LogLevel.off) return false;
    return _levelPriority(eventLevel) >= _levelPriority(level);
  }

  int _levelPriority(LogLevel value) => switch (value) {
        LogLevel.debug => 0,
        LogLevel.info => 1,
        LogLevel.warn => 2,
        LogLevel.error => 3,
        LogLevel.off => 4,
      };
}
