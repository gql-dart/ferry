import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:test_graphql/date_serializer.dart' show DateSerializer;
import 'package:test_graphql/mutations/scalars/review_with_date.data.gql.dart'
    show GReviewWithDateData, GReviewWithDateData_createReview;
import 'package:test_graphql/mutations/scalars/review_with_date.req.gql.dart'
    show GReviewWithDate;
import 'package:test_graphql/mutations/scalars/review_with_date.var.gql.dart'
    show GReviewWithDateVars;
import 'package:test_graphql/mutations/variables/create_review.data.gql.dart'
    show GCreateReviewData, GCreateReviewData_createReview;
import 'package:test_graphql/mutations/variables/create_review.req.gql.dart'
    show GCreateReview;
import 'package:test_graphql/mutations/variables/create_review.var.gql.dart'
    show GCreateReviewVars;
import 'package:test_graphql/queries/aliases/aliased_hero.data.gql.dart'
    show
        GAliasedHeroData,
        GAliasedHeroData_empireHero,
        GAliasedHeroData_jediHero;
import 'package:test_graphql/queries/aliases/aliased_hero.req.gql.dart'
    show GAliasedHero;
import 'package:test_graphql/queries/aliases/aliased_hero.var.gql.dart'
    show GAliasedHeroVars;
import 'package:test_graphql/queries/fragments/hero_with_fragments.data.gql.dart'
    show
        GHeroWithFragmentsData,
        GHeroWithFragmentsData_hero,
        GHeroWithFragmentsData_hero_friendsConnection,
        GHeroWithFragmentsData_hero_friendsConnection_edges,
        GHeroWithFragmentsData_hero_friendsConnection_edges_node,
        GheroDataData,
        GcomparisonFieldsData,
        GcomparisonFieldsData_friendsConnection,
        GcomparisonFieldsData_friendsConnection_edges,
        GcomparisonFieldsData_friendsConnection_edges_node;
import 'package:test_graphql/queries/fragments/hero_with_fragments.req.gql.dart'
    show GHeroWithFragments, GheroData, GcomparisonFields;
import 'package:test_graphql/queries/fragments/hero_with_fragments.var.gql.dart'
    show GHeroWithFragmentsVars, GheroDataVars, GcomparisonFieldsVars;
import 'package:test_graphql/queries/interfaces/hero_for_episode.data.gql.dart'
    show
        GHeroForEpisodeData,
        GHeroForEpisodeData_hero,
        GHeroForEpisodeData_hero__base,
        GHeroForEpisodeData_hero__asDroid,
        GDroidFragmentData;
import 'package:test_graphql/queries/interfaces/hero_for_episode.req.gql.dart'
    show GHeroForEpisode, GDroidFragment;
import 'package:test_graphql/queries/interfaces/hero_for_episode.var.gql.dart'
    show GHeroForEpisodeVars, GDroidFragmentVars;
import 'package:test_graphql/queries/no_vars/hero_no_vars.data.gql.dart'
    show GHeroNoVarsData, GHeroNoVarsData_hero;
import 'package:test_graphql/queries/no_vars/hero_no_vars.req.gql.dart'
    show GHeroNoVars;
import 'package:test_graphql/queries/no_vars/hero_no_vars.var.gql.dart'
    show GHeroNoVarsVars;
import 'package:test_graphql/queries/variables/human_with_args.data.gql.dart'
    show GHumanWithArgsData, GHumanWithArgsData_human;
import 'package:test_graphql/queries/variables/human_with_args.req.gql.dart'
    show GHumanWithArgs;
import 'package:test_graphql/queries/variables/human_with_args.var.gql.dart'
    show GHumanWithArgsVars;
import 'package:test_graphql/schema/schema.schema.gql.dart'
    show GEpisode, GLengthUnit, GReviewInput, GColorInput, GISODate;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(DateSerializer())
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GHeroWithFragments,
  GheroData,
  GcomparisonFields,
  GHeroNoVars,
  GHumanWithArgs,
  GAliasedHero,
  GHeroForEpisode,
  GDroidFragment,
  GHeroWithFragmentsData,
  GHeroWithFragmentsData_hero,
  GHeroWithFragmentsData_hero_friendsConnection,
  GHeroWithFragmentsData_hero_friendsConnection_edges,
  GHeroWithFragmentsData_hero_friendsConnection_edges_node,
  GheroDataData,
  GcomparisonFieldsData,
  GcomparisonFieldsData_friendsConnection,
  GcomparisonFieldsData_friendsConnection_edges,
  GcomparisonFieldsData_friendsConnection_edges_node,
  GHeroNoVarsData,
  GHeroNoVarsData_hero,
  GHumanWithArgsData,
  GHumanWithArgsData_human,
  GAliasedHeroData,
  GAliasedHeroData_empireHero,
  GAliasedHeroData_jediHero,
  GHeroForEpisodeData,
  GHeroForEpisodeData_hero,
  GHeroForEpisodeData_hero__base,
  GHeroForEpisodeData_hero__asDroid,
  GDroidFragmentData,
  GEpisode,
  GLengthUnit,
  GReviewInput,
  GColorInput,
  GISODate,
  GHeroWithFragmentsVars,
  GheroDataVars,
  GcomparisonFieldsVars,
  GHeroNoVarsVars,
  GHumanWithArgsVars,
  GAliasedHeroVars,
  GHeroForEpisodeVars,
  GDroidFragmentVars,
  GReviewWithDate,
  GCreateReview,
  GReviewWithDateData,
  GReviewWithDateData_createReview,
  GCreateReviewData,
  GCreateReviewData_createReview,
  GReviewWithDateVars,
  GCreateReviewVars
])
final Serializers serializers = _serializersBuilder.build();
