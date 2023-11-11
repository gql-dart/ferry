// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAuthorsOrder.serializer)
      ..add(GAuthorsOrderField.serializer)
      ..add(GCreateAuthorData.serializer)
      ..add(GCreateAuthorData_createAuthor.serializer)
      ..add(GCreateAuthorReq.serializer)
      ..add(GCreateAuthorVars.serializer)
      ..add(GDirection.serializer)
      ..add(GGetAuthorByIdData.serializer)
      ..add(GGetAuthorByIdData_author.serializer)
      ..add(GGetAuthorByIdData_author_quotes.serializer)
      ..add(GGetAuthorByIdData_author_quotes_edges.serializer)
      ..add(GGetAuthorByIdData_author_quotes_edges_node.serializer)
      ..add(GGetAuthorByIdReq.serializer)
      ..add(GGetAuthorByIdVars.serializer)
      ..add(GGetAuthorsData.serializer)
      ..add(GGetAuthorsData_authors.serializer)
      ..add(GGetAuthorsData_authors_edges.serializer)
      ..add(GGetAuthorsData_authors_edges_node.serializer)
      ..add(GGetAuthorsReq.serializer)
      ..add(GGetAuthorsVars.serializer)
      ..add(GLoginData.serializer)
      ..add(GLoginData_login.serializer)
      ..add(GLoginReq.serializer)
      ..add(GLoginVars.serializer)
      ..add(GNewAuthor.serializer)
      ..add(GdeleteAuthorInput.serializer)
      ..add(GloginInput.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetAuthorByIdData_author_quotes_edges)
          ]),
          () => new ListBuilder<GGetAuthorByIdData_author_quotes_edges?>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GGetAuthorsData_authors_edges)]),
          () => new ListBuilder<GGetAuthorsData_authors_edges?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
