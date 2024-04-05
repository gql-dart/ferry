import 'package:authors_example/src/client/client.dart';
import 'package:authors_example/src/create_author/create_author_page.dart';
import 'package:authors_example/src/login/login_screen.dart';
import 'package:authors_example/src/store.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/graphql/authors/__generated__/get_authors.req.gql.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final store = SharedPrefsStore(await SharedPreferences.getInstance());

  final client =
      await createClient(tokenStore: store, endpoint: _getEndpoint());

  runApp(ProviderScope(overrides: [
    clientProvider.overrideWithValue(client),
    storeProvider.overrideWithValue(store),
  ], child: const MyApp()));
}

// returns the graphql endpoint, defaults to the standard localhost used by the server
// when running docker compose up, but can be overridden by setting the ENDPOINT via --dart-define
String _getEndpoint() {
  return const String.fromEnvironment('ENDPOINT',
      defaultValue: 'http://localhost:3010/graphql');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authors"),
        actions: const [_LogoutAction()],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: _Authors()),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) => FloatingActionButton(
          onPressed: () async {
            if (ref.read(storeProvider).getToken() != null) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CreateAuthorPage()));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            }
          },
          tooltip: 'New Author',
          child: const Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final authorsProvider = StreamProvider.autoDispose((ref) {
  final client = ref.watch(clientProvider);

  return client.request(GGetAuthorsReq(
    (b) => b..fetchPolicy = FetchPolicy.CacheAndNetwork,
  ));
});

class _Authors extends ConsumerWidget {
  const _Authors();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authors = ref.watch(authorsProvider);

    return authors.when(
      data: (authors) {
        return RefreshIndicator(
          onRefresh: () {
            final res = ref.refresh(authorsProvider.future);
            return res;
          },
          child: (authors.data?.authors?.edges?.isEmpty ?? true)
              ? const SingleChildScrollView(
                  child: Center(
                    child: Text("No authors"),
                  ),
                )
              : ListView.builder(
                  itemCount: authors.data?.authors?.edges?.length ?? 0,
                  itemBuilder: (context, index) {
                    final author = authors.data?.authors?.edges?[index]?.node;

                    if (author == null) {
                      return const SizedBox();
                    }

                    return ListTile(
                      title: Text(author.lastName),
                      subtitle: Text(author.firstName),
                    );
                  },
                ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Column(
        children: [
          Text(error.toString()),
          TextButton(
              onPressed: () {
                ref.invalidate(authorsProvider);
              },
              child: const Text('Retry')),
        ],
      ),
    );
  }
}

class _LogoutAction extends StatelessWidget {
  const _LogoutAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return AnimatedBuilder(
          animation: ref.watch(storeProvider),
          builder: (context, _) {
            final token = ref.watch(storeProvider).getToken();

            return token == null
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.logout),
                    tooltip: 'Logout',
                    onPressed: () {
                      ref.read(storeProvider).setToken(null);
                    });
          });
    });
  }
}
