// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.data.gql.dart'
    show GHumanFragData, GHumanQueryData, GHumanQueryData_human;
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.req.gql.dart'
    show GHumanFragReq, GHumanQueryReq;
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.var.gql.dart'
    show GHumanFragVars, GHumanQueryVars;
import 'package:ferry_test_graphql2/date_serializer.dart' show DateSerializer;
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _$external_serializers;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..addAll(_$external_serializers.serializers.serializers)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GHumanFragData,
  GHumanFragReq,
  GHumanFragVars,
  GHumanQueryData,
  GHumanQueryData_human,
  GHumanQueryReq,
  GHumanQueryVars,
])
final Serializers serializers = _serializersBuilder.build();
