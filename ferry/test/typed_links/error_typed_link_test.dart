import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:ferry/ferry.dart';
import 'package:ferry/src/error_typed_link.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';

class MockTypedLink extends Mock implements TypedLink {}

void main() {
  final req = GHumanWithArgsReq((b) => b..vars.id = '123');

  test(
      'Returns a stream that emits an error if any typed link in chain throws an exception',
      () async {
    final mockTypedLink = MockTypedLink();
    final exception = Exception('something went wrong');
    when(mockTypedLink.request(req, any)).thenThrow(exception);

    final typedLink = TypedLink.from([
      ErrorTypedLink(),
      mockTypedLink,
    ]);

    expect(
        typedLink.request(req), emitsError(TypeMatcher<TypedLinkException>()));
  });
}
