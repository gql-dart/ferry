import 'package:ferry_store/src/json_equals.dart';
import 'package:test/test.dart';

void main() {
  group('jsonMapEquals', () {
    test('should return true for equal maps', () {
      expect(jsonMapEquals({'a': 1}, {'a': 1}), isTrue);
    });

    test('should return false for unequal maps', () {
      expect(jsonMapEquals({'a': 1}, {'a': 2}), isFalse);
    });

    test('should return true for equal lists', () {
      expect(jsonMapEquals([1, 2], [1, 2]), isTrue);
    });

    test('should return false for unequal lists', () {
      expect(jsonMapEquals([1, 2], [1, 3]), isFalse);
    });

    test('should return true for equal nested maps', () {
      expect(
          jsonMapEquals({
            'a': {'b': 1}
          }, {
            'a': {'b': 1}
          }),
          isTrue);
    });

    test('should return false for unequal nested maps', () {
      expect(
          jsonMapEquals({
            'a': {'b': 1}
          }, {
            'a': {'b': 2}
          }),
          isFalse);
    });

    test('should return true for equal nested lists', () {
      expect(
          jsonMapEquals([
            {'a': 1}
          ], [
            {'a': 1}
          ]),
          isTrue);
    });

    test('should return false for unequal nested lists', () {
      expect(
          jsonMapEquals([
            {'a': 1}
          ], [
            {'a': 2}
          ]),
          isFalse);
    });

    test('should return true for equal nested maps and lists', () {
      expect(
          jsonMapEquals({
            'a': [1]
          }, {
            'a': [1]
          }),
          isTrue);
    });

    test('should return false for unequal nested maps and lists', () {
      expect(
          jsonMapEquals({
            'a': [1]
          }, {
            'a': [2]
          }),
          isFalse);
    });

    test('should return true equal complex nested json map', () {
      expect(
          jsonMapEquals({
            'a': {
              'b': [1, 2, 3],
              'c': {
                'd': '4',
                'e': 5,
                'f': [6, 7, 8],
                'g': null,
                'h': true,
                'i': false,
                'j': 0.3
              }
            }
          }, {
            'a': {
              'b': [1, 2, 3],
              'c': {
                'd': '4',
                'e': 5,
                'f': [6, 7, 8],
                'g': null,
                'h': true,
                'i': false,
                'j': 0.3
              }
            }
          }),
          isTrue);
    });

    test('should return false for unequal complex nested json map', () {
      expect(
          jsonMapEquals({
            'a': {
              'b': [1, 2, 3],
              'c': {
                'd': '4',
                'e': 5,
                'f': [6, 7, 8],
                'g': null,
                'h': true,
                'i': false,
                'j': 0.3
              }
            }
          }, {
            'a': {
              'b': [1, 2, 3],
              'c': {
                'd': '4',
                'e': 5,
                'f': [6, 7, 8],
                'g': null,
                'h': true,
                'i': false,
                'j': 0.4
              }
            }
          }),
          isFalse);
    });
  });
}
