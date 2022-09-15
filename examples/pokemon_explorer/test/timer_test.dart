import 'package:ferry/ferry.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.req.gql.dart';

final _client = Client(link: HttpLink('http'));

class _MyWidget extends StatefulWidget {
  const _MyWidget({Key? key}) : super(key: key);

  @override
  State<_MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_MyWidget> {
  final _stream = _client.request(GAllPokemonReq((b) => b.vars
    ..limit = 150
    ..offset = 0));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      builder: (context, snapshot) {
        return const SizedBox();
      },
    );
  }
}

void main() {
  testWidgets('Test there is no pending timer', (WidgetTester tester) async {
    await tester.pumpWidget(const _MyWidget());
  });
}
