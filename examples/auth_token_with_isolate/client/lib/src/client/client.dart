import 'dart:io';
import 'dart:isolate';

import 'package:authors_example/src/client/cache_handlers/create_author_update_cache.dart';
import 'package:authors_example/src/client/links/add_auth_header_link.dart';
import 'package:authors_example/src/client/cache_handlers/update_cache_handlers.dart';
import 'package:authors_example/src/store.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry/ferry_isolate.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// riverpod provider for accessing the client from anywhere in the app
// in a real app, you might want to consider not accessing the ferry client directly in the ui
// but for the purposes of this example, it will do
final clientProvider = Provider<IsolateClient>((ref) {
  // will be overridden in main.dart after creating the client asynchronously
  throw UnimplementedError();
});

// this will create and initialize the client from the main isolate
Future<IsolateClient> createClient(
    {required PersistentTokenStore tokenStore,
    required String endpoint}) async {
  return IsolateClient.create(
    _initClientInIsolate,
    params: _InitParams(
      endpoint: endpoint,
      hivePath: (await _getCacheDir()).path,
    ),
    messageHandler: (msg) async {
      debugPrint('Received message from isolate: $msg');
      if (msg is _RequestTokenMsg) {
        final token = tokenStore.getToken();

        msg.replyPort.send(token);
      } else {
        debugPrint('Unhandled message: $msg');
      }
    },
  );
}

Future<Directory> _getCacheDir() async {
  try {
    return await getApplicationDocumentsDirectory();
  } on MissingPlatformDirectoryException {
    return await getTemporaryDirectory();
  }
}

/// params for initializing the client in the isolate
class _InitParams {
  /// the graphql endpoint
  final String endpoint;

  /// the path to the hive cache. needed because in the isolate
  /// we can't call path_provider's getApplicationDocumentsDirectory()
  final String hivePath;

  _InitParams({required this.endpoint, required this.hivePath});
}

/// this function will run on a separate isolate and will create the
/// standard ferry client there
/// it will receive the necessary [_InitParams] as a parameter
/// and a [SendPort] to send messages to the main isolate
Future<Client> _initClientInIsolate(
    _InitParams params, SendPort? sendPort) async {
  // initFlutter() does not work in the isolate
  Hive.init(params.hivePath);

  // function the request the current auth token from the main isolate
  // it works the following way:
  // 1. create a ReceivePort to receive the token from the main isolate
  // 2. send a [_RequestTokenMsg] to the main isolate with the ReceivePort's sendPort
  // 3. the _RequestTokenMsg will be received in the main isolate in the messageHandler parameter of IsolateClient.create() above
  // 4. wait for the token to be received
  // 5. return the token and close the ReceivePort
  Future<String?> getToken() async {
    final port = ReceivePort();
    sendPort!.send(_RequestTokenMsg(port.sendPort));
    return await port.first.whenComplete(port.close);
  }

  return Client(
      updateCacheHandlers: {
        // unrelated to the isolate: update the list of authors in the cache when a new author is created
        UpdateCacheHandlerKeys.createAuthor: createAuthorUpdateCacheHandler,
      },
      link: Link.concat(
          AddAuthHeaderLink(getToken),
          HttpLink(
            params.endpoint,
          )),
      cache: Cache(
        store: HiveStore(
          await _openCacheBox(),
        ),
      ));
}

// util function to open the cache box or recreate it if it is corrupted
Future<Box<dynamic>> _openCacheBox() async {
  const boxName = 'ferry';
  try {
    return await Hive.openBox(boxName);
  } catch (e, s) {
    debugPrintStack(stackTrace: s, label: e.toString());
    await Hive.deleteBoxFromDisk(boxName);
    return await Hive.openBox(boxName);
  }
}

/// a message to request the current token from the main isolate
/// it contains a SendPort to send the token back to the isolate
class _RequestTokenMsg {
  final SendPort replyPort;

  _RequestTokenMsg(this.replyPort);
}
