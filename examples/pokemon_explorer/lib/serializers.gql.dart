import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:pokemon_explorer/src/graphql/all_pokemon.data.gql.dart'
    show GAllPokemonData, GAllPokemonData_pokemons;
import 'package:pokemon_explorer/src/graphql/all_pokemon.req.gql.dart'
    show GAllPokemon;
import 'package:pokemon_explorer/src/graphql/all_pokemon.var.gql.dart'
    show GAllPokemonVars;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.data.gql.dart'
    show
        GPokemonDetailData,
        GPokemonDetailData_pokemon,
        GPokemonDetailData_pokemon_weight,
        GPokemonDetailData_pokemon_height;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.req.gql.dart'
    show GPokemonDetail;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.var.gql.dart'
    show GPokemonDetailVars;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAllPokemon,
  GPokemonDetail,
  GAllPokemonData,
  GAllPokemonData_pokemons,
  GPokemonDetailData,
  GPokemonDetailData_pokemon,
  GPokemonDetailData_pokemon_weight,
  GPokemonDetailData_pokemon_height,
  GAllPokemonVars,
  GPokemonDetailVars
])
final Serializers serializers = _serializersBuilder.build();
