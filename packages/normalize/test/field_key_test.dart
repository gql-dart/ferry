import 'package:gql/ast.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/src/utils/field_key.dart';
import 'package:test/test.dart';

void main() {
  group('without args', () {
    const field = FieldNode(name: NameNode(value: 'my_field'));
    final key = FieldKey(field, const {}, null);
    test('can be stringified', () {
      expect(key.toString(), equals('my_field'));
    });

    test('can be parsed', () {
      expect(FieldKey.parse(key.toString()), equals(key));
    });
  });

  group('with args', () {
    group('without vars', () {
      const field = FieldNode(name: NameNode(value: 'my_field'), arguments: [
        ArgumentNode(
          name: NameNode(value: 'b'),
          value: IntValueNode(
            value: '0',
          ),
        ),
        ArgumentNode(
          name: NameNode(value: 'a'),
          value: IntValueNode(
            value: '1',
          ),
        ),
      ]);

      final key = FieldKey(field, const {}, null);

      test('can be stringified', () {
        expect(key.toString(), equals('my_field({"a":1,"b":0})'));
      });

      test('can be parsed', () {
        expect(FieldKey.parse(key.toString()), equals(key));
      });
    });

    group('with vars', () {
      const field = FieldNode(name: NameNode(value: 'my_field'), arguments: [
        ArgumentNode(
          name: NameNode(value: 'b'),
          value: VariableNode(name: NameNode(value: 'b')),
        ),
        ArgumentNode(
          name: NameNode(value: 'a'),
          value: VariableNode(name: NameNode(value: 'a')),
        ),
      ]);

      final key = FieldKey(
        field,
        const {
          'b': true,
          'a': 'hi',
        },
        null,
      );

      test('can be stringified', () {
        expect(key.toString(), equals('my_field({"a":"hi","b":true})'));
      });

      test('can be parsed', () {
        expect(FieldKey.parse(key.toString()), equals(key));
      });
    });

    group('with FieldPolicy.keyArgs', () {
      const field = FieldNode(name: NameNode(value: 'my_field'), arguments: [
        ArgumentNode(
          name: NameNode(value: 'b'),
          value: VariableNode(name: NameNode(value: 'b')),
        ),
        ArgumentNode(
          name: NameNode(value: 'a'),
          value: VariableNode(name: NameNode(value: 'a')),
        ),
      ]);

      final key = FieldKey(
        field,
        const {
          'b': true,
          'a': 'hi',
        },
        const FieldPolicy(keyArgs: ['b']),
      );

      test('can be stringified', () {
        expect(key.toString(), equals('my_field({"b":true})'));
      });

      test('can be parsed', () {
        expect(FieldKey.parse(key.toString()), equals(key));
      });
    });
  });
}
