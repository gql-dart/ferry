import "dart:convert";

List<String> docLines(String? description) {
  if (description == null) return const [];
  final trimmed = description.trim();
  if (trimmed.isEmpty) return const [];
  return LineSplitter.split(trimmed)
      .map((line) => line.isEmpty ? "///" : "/// $line")
      .toList();
}
