import 'package:normalize/src/config/normalization_config.dart';

/// Determines whether the given [data] is a reference that points to a non-existent object.
bool isDanglingReference(
  Object data,
  NormalizationConfig config,
) {
  if (data is Map && data.containsKey(config.referenceKey)) {
    final referencedData =
        config.read(data[config.referenceKey] ?? ''); // TODO: Remove
    if (referencedData == null) return true;
  }
  return false;
}
