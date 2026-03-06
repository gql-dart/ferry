import 'dart:io';

import 'package:test/test.dart';

void main() {
  test(
    'dart analyze passes (no implicit dynamic)',
    () async {
      final result = await Process.run(
        'dart',
        ['analyze'],
        workingDirectory: Directory.current.path,
      );
      expect(
        result.exitCode,
        0,
        reason: 'dart analyze failed: ${result.stderr}\n${result.stdout}',
      );
    },
    timeout: const Timeout(Duration(minutes: 5)),
  );
}
