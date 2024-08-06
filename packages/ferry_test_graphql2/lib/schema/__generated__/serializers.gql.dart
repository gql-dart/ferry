// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_test_graphql2/date_serializer.dart' show DateSerializer;
import 'package:ferry_test_graphql2/fragments/__generated__/human_fragment.data.gql.dart'
    show
        GHumanFragmentData,
        GHumanFragmentData_friendsConnection,
        GHumanFragmentData_friendsConnection_friends;
import 'package:ferry_test_graphql2/fragments/__generated__/human_fragment.req.gql.dart'
    show GHumanFragmentReq;
import 'package:ferry_test_graphql2/fragments/__generated__/human_fragment.var.gql.dart'
    show GHumanFragmentVars;
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.data.gql.dart'
    show GReviewFragmentData;
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.req.gql.dart'
    show GReviewFragmentReq;
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.var.gql.dart'
    show GReviewFragmentVars;
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.data.gql.dart'
    show GCreateReviewData, GCreateReviewData_createReview;
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.req.gql.dart'
    show GCreateReviewReq;
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.var.gql.dart'
    show GCreateReviewVars;
import 'package:ferry_test_graphql2/mutations/__generated__/review_with_date_scalar.data.gql.dart'
    show GReviewWithDateData, GReviewWithDateData_createReview;
import 'package:ferry_test_graphql2/mutations/__generated__/review_with_date_scalar.req.gql.dart'
    show GReviewWithDateReq;
import 'package:ferry_test_graphql2/mutations/__generated__/review_with_date_scalar.var.gql.dart'
    show GReviewWithDateVars;
import 'package:ferry_test_graphql2/queries/__generated__/aliased_hero.data.gql.dart'
    show
        GAliasedHeroData,
        GAliasedHeroData_empireHero,
        GAliasedHeroData_jediHero;
import 'package:ferry_test_graphql2/queries/__generated__/aliased_hero.req.gql.dart'
    show GAliasedHeroReq;
import 'package:ferry_test_graphql2/queries/__generated__/aliased_hero.var.gql.dart'
    show GAliasedHeroVars;
import 'package:ferry_test_graphql2/queries/__generated__/hero_no_vars.data.gql.dart'
    show GHeroNoVarsData, GHeroNoVarsData_hero;
import 'package:ferry_test_graphql2/queries/__generated__/hero_no_vars.req.gql.dart'
    show GHeroNoVarsReq;
import 'package:ferry_test_graphql2/queries/__generated__/hero_no_vars.var.gql.dart'
    show GHeroNoVarsVars;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_fragments.data.gql.dart'
    show
        GHeroWithFragmentsData,
        GHeroWithFragmentsData_hero,
        GHeroWithFragmentsData_hero_friendsConnection,
        GHeroWithFragmentsData_hero_friendsConnection_edges,
        GcomparisonFieldsData,
        GcomparisonFieldsData_friendsConnection,
        GcomparisonFieldsData_friendsConnection_edges,
        GheroDataData;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_fragments.req.gql.dart'
    show GHeroWithFragmentsReq, GcomparisonFieldsReq, GheroDataReq;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_fragments.var.gql.dart'
    show GHeroWithFragmentsVars, GcomparisonFieldsVars, GheroDataVars;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_inline_fragment.data.gql.dart'
    show
        GHeroForEpisodeData_hero,
        GDroidFragmentData,
        GHeroForEpisodeData,
        GHeroForEpisodeData_hero__asDroid,
        GHeroForEpisodeData_hero__base;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_inline_fragment.req.gql.dart'
    show GDroidFragmentReq, GHeroForEpisodeReq;
import 'package:ferry_test_graphql2/queries/__generated__/hero_with_inline_fragment.var.gql.dart'
    show GDroidFragmentVars, GHeroForEpisodeVars;
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.data.gql.dart'
    show
        GHumanWithArgsData,
        GHumanWithArgsData_human,
        GHumanWithArgsData_human_friendsConnection,
        GHumanWithArgsData_human_friendsConnection_friends;
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.req.gql.dart'
    show GHumanWithArgsReq;
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.var.gql.dart'
    show GHumanWithArgsVars;
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.data.gql.dart'
    show GReviewsByIDData, GReviewsByIDData_review;
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.req.gql.dart'
    show GReviewsByIDReq;
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.var.gql.dart'
    show GReviewsByIDVars;
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart'
    show GReviewsData, GReviewsData_reviews;
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart'
    show GReviewsReq;
import 'package:ferry_test_graphql2/queries/__generated__/reviews.var.gql.dart'
    show GReviewsVars;
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart'
    show GColorInput, GEpisode, GISODate, GLengthUnit, GReviewInput;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..add(GHeroForEpisodeData_hero.serializer)
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
  GHeroWithFragmentsReq,
  GHeroWithFragmentsVars,
  GHumanFragmentData,
  GHumanFragmentData_friendsConnection,
  GHumanFragmentData_friendsConnection_friends,
  GHumanFragmentReq,
  GHumanFragmentVars,
  GHumanWithArgsData,
  GHumanWithArgsData_human,
  GHumanWithArgsData_human_friendsConnection,
  GHumanWithArgsData_human_friendsConnection_friends,
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
  GReviewsByIDData,
  GReviewsByIDData_review,
  GReviewsByIDReq,
  GReviewsByIDVars,
  GReviewsData,
  GReviewsData_reviews,
  GReviewsReq,
  GReviewsVars,
  GcomparisonFieldsData,
  GcomparisonFieldsData_friendsConnection,
  GcomparisonFieldsData_friendsConnection_edges,
  GcomparisonFieldsReq,
  GcomparisonFieldsVars,
  GheroDataData,
  GheroDataReq,
  GheroDataVars,
])
final Serializers serializers = _serializersBuilder.build();
