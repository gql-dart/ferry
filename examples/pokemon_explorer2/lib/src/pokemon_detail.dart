import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';

import '../graphql/__generated__/pokemon_detail.data.gql.dart';
import '../graphql/__generated__/pokemon_detail.req.gql.dart';
import '../graphql/__generated__/pokemon_detail.var.gql.dart';
import 'pokemon_card.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen(
      {super.key, required this.client, required this.id});

  final Client client;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon #${id.toString().padLeft(3, '0')}'),
      ),
      body: Operation<GPokemonDetailData, GPokemonDetailVars>(
        client: client,
        operationRequest: GPokemonDetailReq(
          vars: GPokemonDetailVars(id: id),
        ),
        builder: (context, response, error) {
          if (response == null || response.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (response.hasErrors) {
            return _ErrorState(message: _errorMessage(response, error));
          }

          final pokemon = _firstOrNull(response.data?.pokemon ?? const []);
          if (pokemon == null) {
            return const _EmptyState();
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              PokemonCardView(pokemon: pokemon),
              const SizedBox(height: 16),
              _StatRow(
                label: 'Base experience',
                value: pokemon.base_experience?.toString() ?? 'Unknown',
              ),
            ],
          );
        },
      ),
    );
  }
}

T? _firstOrNull<T>(Iterable<T> items) {
  for (final item in items) {
    return item;
  }
  return null;
}

String _errorMessage(
  OperationResponse<GPokemonDetailData, GPokemonDetailVars> response,
  Object? error,
) {
  if (error != null) {
    return error.toString();
  }
  final linkException = response.linkException;
  if (linkException != null) {
    return linkException.toString();
  }
  final graphqlErrors = response.graphqlErrors;
  if (graphqlErrors != null && graphqlErrors.isNotEmpty) {
    return graphqlErrors.map((entry) => entry.message).join('\n');
  }
  return 'Unknown error.';
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pokemon not found.'),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
