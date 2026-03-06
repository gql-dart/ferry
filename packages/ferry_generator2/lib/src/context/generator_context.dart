import "../config/builder_config.dart";
import "../logging/sink.dart";

final class GeneratorContext {
  final BuilderConfig config;
  final LogSink log;

  const GeneratorContext({
    required this.config,
    LogSink? log,
  }) : log = log ?? const NullLogSink();

  GeneratorContext withLog(LogSink log) => GeneratorContext(
        config: config,
        log: log,
      );
}
