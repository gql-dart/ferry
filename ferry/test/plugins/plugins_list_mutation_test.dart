import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:ferry/ferry.dart';
import 'package:test/test.dart';

class MockLink extends Mock implements Link {}

void main() {
  final mockLink = MockLink();

  test(
      'modifying the plugins of a client does not mutate the global defaultPlugins variable',
      () {
    final defaultPluginsAtBeginning = List.of(defaultPlugins);

    final client1 = Client(
      link: mockLink,
    )..plugins.removeAt(0);

    expect(defaultPluginsAtBeginning, equals(defaultPlugins));
    expect(client1.plugins, isNot(defaultPluginsAtBeginning));

    final client2 = Client(
      link: mockLink,
    );

    expect(client2.plugins, equals(defaultPluginsAtBeginning));
  });
}
