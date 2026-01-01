import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../graphql/__generated__/all_pokemon.data.gql.dart';
import '../graphql/__generated__/all_pokemon.req.gql.dart';
import '../graphql/__generated__/all_pokemon.var.gql.dart';
import '../graphql/__generated__/pokemon_card_fragment.data.gql.dart';
import 'pokemon_card.dart';
import 'pokemon_detail.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key, required this.client});

  final Client client;

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  static const _pageSize = 30;
  static const _requestId = 'AllPokemonPagination';

  late final ScrollController _scrollController;
  late final GAllPokemonReq _initialRequest;

  bool _isFetching = false;
  bool _hasReachedEnd = false;
  int _lastItemCount = 0;
  int _pendingOffset = 0;

  @override
  void initState() {
    super.initState();
    _initialRequest = GAllPokemonReq(
      vars: const GAllPokemonVars(limit: _pageSize, offset: 0),
      requestId: _requestId,
    );
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    if (_isFetching || _hasReachedEnd) {
      return;
    }
    final position = _scrollController.position;
    if (position.extentAfter < 300) {
      _fetchMore();
    }
  }

  void _fetchMore() {
    if (_isFetching || _hasReachedEnd) {
      return;
    }
    final nextOffset = _lastItemCount;
    _pendingOffset = nextOffset;
    setState(() {
      _isFetching = true;
    });
    _log('paging: request offset=$nextOffset limit=$_pageSize');
    widget.client.requestController.add(
      GAllPokemonReq(
        vars: GAllPokemonVars(limit: _pageSize, offset: nextOffset),
        requestId: _requestId,
        updateResult: _mergeResults,
      ),
    );
  }

  GAllPokemonData? _mergeResults(
    GAllPokemonData? previous,
    GAllPokemonData? result,
  ) {
    if (result == null) {
      return previous;
    }
    if (previous == null) {
      return result;
    }
    return GAllPokemonData(
      pokemon: <GPokemonCardData>[
        ...previous.pokemon,
        ...result.pokemon,
      ],
      G__typename: previous.G__typename,
    );
  }

  void _syncPagingState(
    OperationResponse<GAllPokemonData, GAllPokemonVars> response,
    GAllPokemonData data,
  ) {
    final currentCount = data.pokemon.length;
    if (!_isFetching) {
      _lastItemCount = currentCount;
      return;
    }
    if (response.operationRequest.vars.offset != _pendingOffset) {
      _log(
        'paging: ignore response offset=${response.operationRequest.vars.offset}',
      );
      return;
    }
    final newItems = currentCount - _lastItemCount;
    final reachedEnd = newItems < _pageSize;
    _log(
      'paging: response offset=${response.operationRequest.vars.offset} '
      'items=$newItems total=$currentCount reachedEnd=$reachedEnd',
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _lastItemCount = currentCount;
        _isFetching = false;
        _hasReachedEnd = reachedEnd;
      });
    });
  }

  void _syncPagingError() {
    if (!_isFetching) {
      return;
    }
    _log('paging: error received, reset fetch state');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isFetching = false;
      });
    });
  }

  void _log(String message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Explorer 2'),
      ),
      body: Operation<GAllPokemonData, GAllPokemonVars>(
        client: widget.client,
        operationRequest: _initialRequest,
        builder: (context, response, error) {
          if (response == null || response.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (response.hasErrors) {
            _syncPagingError();
            return _ErrorState(message: _errorMessage(response, error));
          }

          final data = response.data;
          if (data != null) {
            _syncPagingState(response, data);
          }

          final items = data?.pokemon ?? const [];
          final pokemonList = items.whereType<GPokemonCard>().toList();
          if (pokemonList.isEmpty) {
            return const _EmptyState();
          }

          final showLoading = _isFetching && !_hasReachedEnd;
          final showEnd = _hasReachedEnd && pokemonList.isNotEmpty;
          final extraCount = (showLoading ? 1 : 0) + (showEnd ? 1 : 0);

          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: pokemonList.length + extraCount,
            itemBuilder: (context, index) {
              if (index >= pokemonList.length) {
                if (showLoading && index == pokemonList.length) {
                  return const _PagingIndicator();
                }
                return const _EndOfList();
              }
              final pokemon = pokemonList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: PokemonCardView(
                  pokemon: pokemon,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PokemonDetailScreen(
                          client: widget.client,
                          id: pokemon.id,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String _errorMessage(
  OperationResponse<GAllPokemonData, GAllPokemonVars> response,
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
      child: Text('No Pokemon found.'),
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

class _PagingIndicator extends StatelessWidget {
  const _PagingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _EndOfList extends StatelessWidget {
  const _EndOfList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Text(
          'You made it to the end.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
