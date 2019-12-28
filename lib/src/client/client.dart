import 'package:meta/meta.dart';
import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:gql/execution.dart';

import '../cache/core/cache.dart';
import './query_ref.dart';

import './gql_response.dart';

typedef UpdateCacheHandler<T, TVariables extends JsonSerializable>
    = void Function(dynamic proxy, GraphQLResponse<T, TVariables> response,
        [Context context]);

typedef UpdateResponseHandler<T> = void Function(T previousResult, T result,
    [Context context]);

class GQLClient {
  final Link link;

  final Map<String, UpdateCacheHandler> updateCacheHandlers;
  final Map<String, UpdateResponseHandler> updateResponseHandlers;

  GQLClient(
      {@required this.link,
      this.updateCacheHandlers,
      this.updateResponseHandlers});

  QueryRef<T, TVariables> ref<T, TVariables extends JsonSerializable>(
      GraphQLQuery<T, TVariables> query) {
    return QueryRef<T, TVariables>(
      client: this,
      initialQuery: query,
    );
  }
}
