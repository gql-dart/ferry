import "diagnostics.dart";

abstract interface class LogSink {
  void emit(LogEvent event);

  LogSink withContext(LogContext context);
}

final class NullLogSink implements LogSink {
  const NullLogSink();

  @override
  void emit(LogEvent event) {}

  @override
  LogSink withContext(LogContext context) => this;
}

final class BufferLogSink implements LogSink {
  final List<LogEvent> events = [];

  @override
  void emit(LogEvent event) {
    events.add(event);
  }

  @override
  LogSink withContext(LogContext context) => ContextualLogSink(this, context);
}

final class ContextualLogSink implements LogSink {
  final LogSink base;
  final LogContext context;

  const ContextualLogSink(this.base, this.context);

  @override
  void emit(LogEvent event) {
    base.emit(event.withContext(context));
  }

  @override
  LogSink withContext(LogContext next) {
    return ContextualLogSink(base, context.merge(next));
  }
}
