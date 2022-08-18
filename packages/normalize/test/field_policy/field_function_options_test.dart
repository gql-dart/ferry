import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

import '../shared_data.dart';

void main() {
  group('FieldFunctionOptions', () {
    final query = parseString('''
      query TestQuery {
        posts {
          id
          author {
            id
            name
          }
          title
          comments {
            id
            commenter {
              id
              name
            }
          }
        }
      }
    ''');

    test('helper methods work correctly', () async {
      expect(
        await denormalizeOperation(
          addTypename: true,
          document: query,
          read: (dataId) async => sharedNormalizedMap[dataId],
          typePolicies: {
            'Query': TypePolicy(
              queryType: true,
              fields: {
                'posts': FieldPolicy(
                  read: (existing, options) async {
                    expect(options.isReference(existing[0]), equals(true));
                    final posts =
                        await options.readField(options.field, existing ?? []);
                    expect(options.toReference(posts[0]), equals(existing[0]));
                    return posts;
                  },
                )
              },
            ),
          },
        ),
        equals(sharedResponse),
      );
    });
  });
}
