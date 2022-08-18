import 'package:normalize/src/config/normalization_config.dart';

/// Determines whether the given [data] is a reference that points to a non-existent object.
Future<bool> isDanglingReference(
  Object? data,
  NormalizationConfig config,
) async {
  if (data == null) return false;
  if (data is Map && data.containsKey(config.referenceKey)) {
    final referencedData = await config.read(data[config.referenceKey]);
    if (referencedData == null) return true;
  }
  return false;
}
