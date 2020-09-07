import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_test_graphql/date_serializer.dart' show DateSerializer;
import 'package:ferry_test_graphql/fragments/review_fragment.data.gql.dart'
    show GReviewFragmentData;
import 'package:ferry_test_graphql/fragments/review_fragment.req.gql.dart'
    show GReviewFragmentReq;
import 'package:ferry_test_graphql/fragments/review_fragment.var.gql.dart'
    show GReviewFragmentVars;
import 'package:ferry_test_graphql/mutations/scalars/review_with_date.data.gql.dart'
    show GReviewWithDateData, GReviewWithDateData_createReview;
import 'package:ferry_test_graphql/mutations/scalars/review_with_date.req.gql.dart'
    show GReviewWithDateReq;
import 'package:ferry_test_graphql/mutations/scalars/review_with_date.var.gql.dart'
    show GReviewWithDateVars;
import 'package:ferry_test_graphql/mutations/variables/create_review.data.gql.dart'
    show GCreateReviewData, GCreateReviewData_createReview;
import 'package:ferry_test_graphql/mutations/variables/create_review.req.gql.dart'
    show GCreateReviewReq;
import 'package:ferry_test_graphql/mutations/variables/create_review.var.gql.dart'
    show GCreateReviewVars;
import 'package:ferry_test_graphql/queries/aliases/aliased_hero.data.gql.dart'
    show
        GAliasedHeroData,
        GAliasedHeroData_empireHero,
        GAliasedHeroData_jediHero;
import 'package:ferry_test_graphql/queries/aliases/aliased_hero.req.gql.dart'
    show GAliasedHeroReq;
import 'package:ferry_test_graphql/queries/aliases/aliased_hero.var.gql.dart'
    show GAliasedHeroVars;
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.data.gql.dart'
    show
        GHeroWithFragmentsData,
        GHeroWithFragmentsData_hero,
        GHeroWithFragmentsData_hero_friendsConnection,
        GHeroWithFragmentsData_hero_friendsConnection_edges,
        GHeroWithFragmentsData_hero_friendsConnection_edges_node,
        GcomparisonFieldsData,
        GcomparisonFieldsData_friendsConnection,
        GcomparisonFieldsData_friendsConnection_edges,
        GcomparisonFieldsData_friendsConnection_edges_node,
        GheroDataData;
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.req.gql.dart'
    show GHeroWithFragmentsReq, GcomparisonFieldsReq, GheroDataReq;
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.var.gql.dart'
    show GHeroWithFragmentsVars, GcomparisonFieldsVars, GheroDataVars;
import 'package:ferry_test_graphql/queries/interfaces/hero_for_episode.data.gql.dart'
    show
        GDroidFragmentData,
        GHeroForEpisodeData,
        GHeroForEpisodeData_hero,
        GHeroForEpisodeData_hero__asDroid,
        GHeroForEpisodeData_hero__base;
import 'package:ferry_test_graphql/queries/interfaces/hero_for_episode.req.gql.dart'
    show GDroidFragmentReq, GHeroForEpisodeReq;
import 'package:ferry_test_graphql/queries/interfaces/hero_for_episode.var.gql.dart'
    show GDroidFragmentVars, GHeroForEpisodeVars;
import 'package:ferry_test_graphql/queries/no_vars/hero_no_vars.data.gql.dart'
    show GHeroNoVarsData, GHeroNoVarsData_hero;
import 'package:ferry_test_graphql/queries/no_vars/hero_no_vars.req.gql.dart'
    show GHeroNoVarsReq;
import 'package:ferry_test_graphql/queries/no_vars/hero_no_vars.var.gql.dart'
    show GHeroNoVarsVars;
import 'package:ferry_test_graphql/queries/variables/human_with_args.data.gql.dart'
    show GHumanWithArgsData, GHumanWithArgsData_human;
import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart'
    show GHumanWithArgsReq;
import 'package:ferry_test_graphql/queries/variables/human_with_args.var.gql.dart'
    show GHumanWithArgsVars;
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart'
    show GReviewsData, GReviewsData_reviews;
import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart'
    show GReviewsReq;
import 'package:ferry_test_graphql/queries/variables/reviews.var.gql.dart'
    show GReviewsVars;
import 'package:ferry_test_graphql/schema/schema.schema.gql.dart'
    show GColorInput, GEpisode, GISODate, GLengthUnit, GReviewInput;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(DateSerializer())
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAliasedHeroData,
  GAliasedHeroData_empireHero,
  GAliasedHeroData_jediHero,
  GAliasedHeroReq,
  GAliasedHeroVars,
  GColorInput,
  GCreateReviewData,
  GCreateReviewData_createReview,
  GCreateReviewReq,
  GCreateReviewVars,
  GDroidFragmentData,
  GDroidFragmentReq,
  GDroidFragmentVars,
  GEpisode,
  GHeroForEpisodeData,
  GHeroForEpisodeData_hero,
  GHeroForEpisodeData_hero__asDroid,
  GHeroForEpisodeData_hero__base,
  GHeroForEpisodeReq,
  GHeroForEpisodeVars,
  GHeroNoVarsData,
  GHeroNoVarsData_hero,
  GHeroNoVarsReq,
  GHeroNoVarsVars,
  GHeroWithFragmentsData,
  GHeroWithFragmentsData_hero,
  GHeroWithFragmentsData_hero_friendsConnection,
  GHeroWithFragmentsData_hero_friendsConnection_edges,
  GHeroWithFragmentsData_hero_friendsConnection_edges_node,
  GHeroWithFragmentsReq,
  GHeroWithFragmentsVars,
  GHumanWithArgsData,
  GHumanWithArgsData_human,
  GHumanWithArgsReq,
  GHumanWithArgsVars,
  GISODate,
  GLengthUnit,
  GReviewFragmentData,
  GReviewFragmentReq,
  GReviewFragmentVars,
  GReviewInput,
  GReviewWithDateData,
  GReviewWithDateData_createReview,
  GReviewWithDateReq,
  GReviewWithDateVars,
  GReviewsData,
  GReviewsData_reviews,
  GReviewsReq,
  GReviewsVars,
  GcomparisonFieldsData,
  GcomparisonFieldsData_friendsConnection,
  GcomparisonFieldsData_friendsConnection_edges,
  GcomparisonFieldsData_friendsConnection_edges_node,
  GcomparisonFieldsReq,
  GcomparisonFieldsVars,
  GheroDataData,
  GheroDataReq,
  GheroDataVars
])
final Serializers serializers = _serializersBuilder.build();
