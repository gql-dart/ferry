import 'package:ferry/ferry.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.req.gql.dart';

class _MyWidget extends StatefulWidget {
  const _MyWidget(this.client, {Key? key}) : super(key: key);
  final Client client;
  @override
  State<_MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_MyWidget> {
  late final _stream = widget.client.request(GAllPokemonReq((b) => b.vars
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
  final policies = ValueVariant(FetchPolicy.values.toSet());
  testWidgets(
    'Test there is no pending timer',
    (WidgetTester tester) async {
      final client = Client(
        link: HttpLink('http'),
        defaultFetchPolicies: {
          OperationType.query: policies.currentValue!,
        },
      );
      await tester.pumpWidget(_MyWidget(client));
      await tester.runAsync(() {
        return tester.pump(Duration.zero);
      });
    },
    variant: policies,
  );
}
