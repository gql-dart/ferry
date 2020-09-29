// test('Returns a stream that emits an error if link throws an exception',
//     () async {
//   final mockLink = MockLink();

//   final req = GHumanWithArgsReq((b) => b..vars.id = '123');

//   final exception = ServerException(parsedResponse: Response());

//   when(mockLink.request(req.execRequest, any)).thenThrow(exception);

//   final responder = LinkResponder(mockLink);

//   expect(responder.request(req), emitsError(equals(exception)));
// });
