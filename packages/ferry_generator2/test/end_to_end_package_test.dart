import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  test(
    'end-to-end package builds and runs runtime tests',
    () async {
      final packageRoot = Directory.current.path;
      final endToEndRoot = p.join(
        packageRoot,
        '..',
        'ferry_generator2_end_to_end',
      );

      final pubGet = await Process.run(
        'dart',
        ['pub', 'get'],
        workingDirectory: endToEndRoot,
      );
      expect(
        pubGet.exitCode,
        0,
        reason: 'dart pub get failed: ${pubGet.stderr}',
      );

      final buildResult = await Process.run(
        'dart',
        ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
        workingDirectory: endToEndRoot,
      );
      expect(
        buildResult.exitCode,
        0,
        reason: 'build_runner failed: ${buildResult.stderr}\n'
            '${buildResult.stdout}',
      );

      final testResult = await Process.run(
        'dart',
        ['test'],
        workingDirectory: endToEndRoot,
      );
      expect(
        testResult.exitCode,
        0,
        reason: 'end-to-end runtime tests failed: ${testResult.stderr}\n'
            '${testResult.stdout}',
      );

      final analyzeResult = await Process.run(
        'dart',
        ['analyze'],
        workingDirectory: endToEndRoot,
      );
      expect(
        analyzeResult.exitCode,
        0,
        reason: 'dart analyze failed: ${analyzeResult.stderr}\n'
            '${analyzeResult.stdout}',
      );
    },
    timeout: const Timeout(Duration(minutes: 15)),
  );
}
