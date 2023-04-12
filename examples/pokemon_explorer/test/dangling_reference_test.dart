import 'package:built_collection/built_collection.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gql_exec/src/response.dart';
import 'package:pokemon_explorer/__generated__/schema.ast.gql.dart';
import 'package:pokemon_explorer/__generated__/schema.schema.gql.dart';
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.data.gql.dart';
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.req.gql.dart';
import 'package:pokemon_explorer/src/graphql/__generated__/all_pokemon.var.gql.dart';

class _MyWidget extends StatelessWidget {
  const _MyWidget({
    required this.client,
    Key? key,
  }) : super(key: key);

  final Client client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Operation<GAllPokemonData, GAllPokemonVars>(
          client: client,
          operationRequest: GAllPokemonReq(
            (req) => req.vars
              ..limit = 3
              ..offset = 0,
          ),
          builder: (context, result, _) {
            final pokemons = result?.data?.pokemons?.results ?? BuiltList();

            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];

                return ListTile(
                  title: Text(pokemon!.name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

void main() {
  testWidgets("test description", (WidgetTester tester) async {
    final client = Client(
      cache: Cache(possibleTypes: possibleTypesMap),
      link: Link.function((request, [forward]) {
        return Stream.value(
          Response(
            response: const {},
            data: GAllPokemonData((data) {
              data.pokemons.results = ListBuilder(List.generate(
                  3,
                  (i) => GAllPokemonData_pokemons_results(
                        (pokemon) {
                          pokemon
                            ..id = i
                            ..name = 'name$i'
                            ..avatar = 'avatar$i'
                            ..height.in_meter = 'height$i'
                            ..weight.in_kg = 'weight$i';
                        },
                      )));
            }).toJson(),
          ),
        );
      }),
    );

    await tester.pumpWidget(_MyWidget(client: client));
    await tester.pump();
    expect(find.byType(ListTile), findsNWidgets(3));
    for (final id in List.generate(3, (index) => index)) {
      expect(find.widgetWithText(ListTile, 'name$id'), findsOneWidget);
    }

    client.cache
      ..evict('${Pokemon.name.value}:1')
      ..gc();
    await tester.runAsync(() => Future.delayed(Duration.zero));
    await tester.pump();

    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.widgetWithText(ListTile, 'name0'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'name1'), findsNothing);
    expect(find.widgetWithText(ListTile, 'name2'), findsOneWidget);
  });
}
