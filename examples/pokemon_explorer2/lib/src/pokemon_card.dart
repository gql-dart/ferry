import 'package:flutter/material.dart';

import '../graphql/__generated__/pokemon_card_fragment.data.gql.dart';

class PokemonCardView extends StatelessWidget {
  const PokemonCardView({super.key, required this.pokemon, this.onTap});

  final GPokemonCard pokemon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final spriteUrl = _spriteUrl(pokemon);
    final typeNames = _typeNames(pokemon);
    final subtitleStyle = Theme.of(context).textTheme.bodySmall;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SpriteImage(url: spriteUrl),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}  ${pokemon.name}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Height: ${pokemon.height ?? '-'}  Weight: ${pokemon.weight ?? '-'}',
                      style: subtitleStyle,
                    ),
                    if (typeNames.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final typeName in typeNames)
                            Chip(
                              label: Text(typeName),
                              visualDensity: VisualDensity.compact,
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (onTap != null)
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String? _spriteUrl(GPokemonCard pokemon) {
  if (pokemon.pokemonsprites.isEmpty) {
    return null;
  }
  return _spriteUrlFromJson(pokemon.pokemonsprites.first.sprites);
}

String? _spriteUrlFromJson(Map<String, dynamic> sprites) {
  final other = sprites['other'];
  if (other is Map<String, dynamic>) {
    final official = other['official-artwork'];
    if (official is Map<String, dynamic>) {
      final url = official['front_default'];
      if (url is String && url.isNotEmpty) {
        return url;
      }
    }
  }
  final frontDefault = sprites['front_default'];
  if (frontDefault is String && frontDefault.isNotEmpty) {
    return frontDefault;
  }
  return null;
}

List<String> _typeNames(GPokemonCard pokemon) {
  final names = <String>[];
  for (final entry in pokemon.pokemontypes) {
    final name = entry.type?.name;
    if (name != null) {
      names.add(name);
    }
  }
  return names;
}

class _SpriteImage extends StatelessWidget {
  const _SpriteImage({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return const _SpritePlaceholder();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url!,
        width: 72,
        height: 72,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const _SpritePlaceholder(),
      ),
    );
  }
}

class _SpritePlaceholder extends StatelessWidget {
  const _SpritePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.image_not_supported_outlined),
    );
  }
}
