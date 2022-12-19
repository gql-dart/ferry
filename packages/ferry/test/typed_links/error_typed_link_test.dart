import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:rxdart/rxdart.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry/src/error_typed_link.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.data.gql.dart';

import './error_typed_link_test.mocks.dart';

@GenerateMocks([TypedLink])
void main() {
  final req = GHumanWithArgsReq((b) => b..vars.id = '123');
  final mockTypedLink = MockTypedLink();

  late TypedLink client;

  group('Error Catching', () {
    setUpAll(() {
      client = TypedLink.from([
        ErrorTypedLink(),
        mockTypedLink,
      ]);
    });

    test(
      'can catch errors thrown when forwarding the request',
      () async {
        final exception = Exception('something went wrong');
        when(mockTypedLink.request(req, any)).thenThrow(exception);

        expect(
          client.request(req),
          emitsInOrder([
            isA<OperationResponse>()
                .having((resp) => resp.dataSource, 'datasource matches',
                    equals(DataSource.None))
                .having((resp) => resp.operationRequest, 'request matches',
                    equals(req))
                .having(
                  (resp) => resp.linkException,
                  'exception matches',
                  isA<TypedLinkException>().having(
                    (e) => e.originalException,
                    'original exception matches',
                    equals(exception),
                  ),
                ),
            emitsDone,
          ]),
        );
      },
    );

    test(
      'can catch errors events in downstream TypedLinks',
      () async {
        final exception = Exception('something went wrong');
        when(mockTypedLink.request(req, any))
            .thenAnswer((_) => Stream.error(exception));

        expect(
          client.request(req),
          emitsInOrder([
            isA<OperationResponse>()
                .having((resp) => resp.dataSource, 'datasource matches',
                    equals(DataSource.None))
                .having((resp) => resp.operationRequest, 'request matches',
                    equals(req))
                .having(
                  (resp) => resp.linkException,
                  'exception matches',
                  isA<TypedLinkException>().having(
                    (e) => e.originalException,
                    'original exception matches',
                    equals(exception),
                  ),
                ),
            emitsDone,
          ]),
        );
      },
    );

    test(
      'can emit data after emitting errors',
      () async {
        final exception = Exception('something went wrong');

        final dataResponse = OperationResponse(
          operationRequest: req,
          dataSource: DataSource.Link,
          data: GHumanWithArgsData(
            (b) => b
              ..human.id = 'luke'
              ..human.name = 'Luke',
          ),
        );

        when(mockTypedLink.request(req, any)).thenAnswer(
          (_) => MergeStream([
            Stream.error(exception),
            Stream.value(dataResponse),
          ]),
        );

        expect(
          client.request(req),
          emitsInOrder([
            isA<OperationResponse>()
                .having((resp) => resp.dataSource, 'datasource matches',
                    equals(DataSource.None))
                .having((resp) => resp.operationRequest, 'request matches',
                    equals(req))
                .having(
                  (resp) => resp.linkException,
                  'exception matches',
                  isA<TypedLinkException>().having(
                    (e) => e.originalException,
                    'original exception matches',
                    equals(exception),
                  ),
                ),
            dataResponse,
            emitsDone,
          ]),
        );
      },
    );
  });
}
