

import 'dart:convert';

import 'package:ferry/ferry.dart';
import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:gql_exec/gql_exec.dart';


void main() async {


  const responseJson = """
  {
      "getExploreVideos": [
        {
          "__typename": "PositionVideoViewType",
          "id": "2",
          "thumbnail": "https://img.youtube.com/vi/2/mqdefault.jpg",
          "video": "https://www.youtube.com/watch?v=2",
          "likeCount": 2,
          "company": {
            "__typename": "Company",
            "id": "2",
            "name": "Company 2"
          },
          "position": {
            "__typename": "Position",
            "id": "1",
            "title": "Position 1"
          }
        }
      ]
  }
  """;
  final client = Client(
    link: Link.function((request, [forward]) => Stream.value(Response(
        data: json.decode(responseJson),
        response: json.decode(responseJson)))),
    cache: Cache(
      possibleTypes: possibleTypesMap
  ),
  );

  final res = await client.request(GGetExploreVideosReq()).first;



  print(res.graphqlErrors);
  print(res.linkException);
  print(res.data?.toJson());

  final scnd = res.data!.getExploreVideos![0];

  print(scnd.G__typename);
  print(scnd.runtimeType);

  print(scnd.toJson());


}