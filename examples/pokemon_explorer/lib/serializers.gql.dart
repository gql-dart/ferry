import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:pokemon_explorer/schema.schema.gql.dart'
    show
        GAddAttackInput,
        GAddPokemonAttackInput,
        GAddPokemonDimensionInput,
        GAddPokemonEvolutionRequirementInput,
        GAddPokemonInput,
        GAttackOrder,
        GAttackOrderable,
        GAttackRef,
        GAuthRule,
        GCustomHTTP,
        GDateTime,
        GDateTimeFilter,
        GDgraphIndex,
        GFloatFilter,
        GHTTPMethod,
        GIntFilter,
        GMode,
        GPokemonAttackRef,
        GPokemonDimensionOrder,
        GPokemonDimensionOrderable,
        GPokemonDimensionRef,
        GPokemonEvolutionRequirementOrder,
        GPokemonEvolutionRequirementOrderable,
        GPokemonEvolutionRequirementRef,
        GPokemonFilter,
        GPokemonOrder,
        GPokemonOrderable,
        GPokemonPatch,
        GPokemonRef,
        GStringExactFilter,
        GStringFullTextFilter,
        GStringHashFilter,
        GStringRegExpFilter,
        GStringTermFilter,
        GUpdatePokemonInput;
import 'package:pokemon_explorer/src/graphql/all_pokemon.data.gql.dart'
    show GAllPokemonData, GAllPokemonData_queryPokemon;
import 'package:pokemon_explorer/src/graphql/all_pokemon.req.gql.dart'
    show GAllPokemon;
import 'package:pokemon_explorer/src/graphql/all_pokemon.var.gql.dart'
    show GAllPokemonVars;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.data.gql.dart'
    show GNestedFragmentData, GPokemonCardData;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.req.gql.dart'
    show GNestedFragment, GPokemonCard;
import 'package:pokemon_explorer/src/graphql/pokemon_card_fragment.var.gql.dart'
    show GNestedFragmentVars, GPokemonCardVars;
import 'package:pokemon_explorer/src/graphql/pokemon_detail.data.gql.dart'
    show
        GPokemonDetailData,
        GPokemonDetailData_getPokemon,
        GPokemonDetailData_getPokemon_weight,
        GPokemonDetailData_getPokemon_height;
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
  GNestedFragment,
  GPokemonCard,
  GPokemonDetail,
  GAllPokemonData,
  GAllPokemonData_queryPokemon,
  GNestedFragmentData,
  GPokemonCardData,
  GPokemonDetailData,
  GPokemonDetailData_getPokemon,
  GPokemonDetailData_getPokemon_weight,
  GPokemonDetailData_getPokemon_height,
  GAddAttackInput,
  GAddPokemonAttackInput,
  GAddPokemonDimensionInput,
  GAddPokemonEvolutionRequirementInput,
  GAddPokemonInput,
  GAttackOrder,
  GAttackOrderable,
  GAttackRef,
  GAuthRule,
  GCustomHTTP,
  GDateTime,
  GDateTimeFilter,
  GDgraphIndex,
  GFloatFilter,
  GHTTPMethod,
  GIntFilter,
  GMode,
  GPokemonAttackRef,
  GPokemonDimensionOrder,
  GPokemonDimensionOrderable,
  GPokemonDimensionRef,
  GPokemonEvolutionRequirementOrder,
  GPokemonEvolutionRequirementOrderable,
  GPokemonEvolutionRequirementRef,
  GPokemonFilter,
  GPokemonOrder,
  GPokemonOrderable,
  GPokemonPatch,
  GPokemonRef,
  GStringExactFilter,
  GStringFullTextFilter,
  GStringHashFilter,
  GStringRegExpFilter,
  GStringTermFilter,
  GUpdatePokemonInput,
  GAllPokemonVars,
  GNestedFragmentVars,
  GPokemonCardVars,
  GPokemonDetailVars
])
final Serializers serializers = _serializersBuilder.build();
