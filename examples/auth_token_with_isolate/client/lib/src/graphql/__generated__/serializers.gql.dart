// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:authors_example/src/graphql/__generated__/schema.schema.gql.dart'
    show
        GAuthorsOrder,
        GAuthorsOrderField,
        GDirection,
        GNewAuthor,
        GdeleteAuthorInput,
        GloginInput;
import 'package:authors_example/src/graphql/auth/__generated__/login.data.gql.dart'
    show GLoginData, GLoginData_login;
import 'package:authors_example/src/graphql/auth/__generated__/login.req.gql.dart'
    show GLoginReq;
import 'package:authors_example/src/graphql/auth/__generated__/login.var.gql.dart'
    show GLoginVars;
import 'package:authors_example/src/graphql/authors/__generated__/create_author.data.gql.dart'
    show GCreateAuthorData, GCreateAuthorData_createAuthor;
import 'package:authors_example/src/graphql/authors/__generated__/create_author.req.gql.dart'
    show GCreateAuthorReq;
import 'package:authors_example/src/graphql/authors/__generated__/create_author.var.gql.dart'
    show GCreateAuthorVars;
import 'package:authors_example/src/graphql/authors/__generated__/get_author.data.gql.dart'
    show
        GGetAuthorByIdData,
        GGetAuthorByIdData_author,
        GGetAuthorByIdData_author_quotes,
        GGetAuthorByIdData_author_quotes_edges,
        GGetAuthorByIdData_author_quotes_edges_node;
import 'package:authors_example/src/graphql/authors/__generated__/get_author.req.gql.dart'
    show GGetAuthorByIdReq;
import 'package:authors_example/src/graphql/authors/__generated__/get_author.var.gql.dart'
    show GGetAuthorByIdVars;
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.data.gql.dart'
    show
        GGetAuthorsData,
        GGetAuthorsData_authors,
        GGetAuthorsData_authors_edges,
        GGetAuthorsData_authors_edges_node;
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.req.gql.dart'
    show GGetAuthorsReq;
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.var.gql.dart'
    show GGetAuthorsVars;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAuthorsOrder,
  GAuthorsOrderField,
  GCreateAuthorData,
  GCreateAuthorData_createAuthor,
  GCreateAuthorReq,
  GCreateAuthorVars,
  GDirection,
  GGetAuthorByIdData,
  GGetAuthorByIdData_author,
  GGetAuthorByIdData_author_quotes,
  GGetAuthorByIdData_author_quotes_edges,
  GGetAuthorByIdData_author_quotes_edges_node,
  GGetAuthorByIdReq,
  GGetAuthorByIdVars,
  GGetAuthorsData,
  GGetAuthorsData_authors,
  GGetAuthorsData_authors_edges,
  GGetAuthorsData_authors_edges_node,
  GGetAuthorsReq,
  GGetAuthorsVars,
  GLoginData,
  GLoginData_login,
  GLoginReq,
  GLoginVars,
  GNewAuthor,
  GdeleteAuthorInput,
  GloginInput,
])
final Serializers serializers = _serializersBuilder.build();
