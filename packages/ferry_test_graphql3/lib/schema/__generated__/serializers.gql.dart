// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_test_graphql3/date_serializer.dart' show DateSerializer;
import 'package:ferry_test_graphql3/schema/__generated__/schema.schema.gql.dart'
    show GColorInput, GEpisode, GISODate, GLengthUnit, GReviewInput;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GColorInput,
  GEpisode,
  GISODate,
  GLengthUnit,
  GReviewInput,
])
final Serializers serializers = _serializersBuilder.build();
