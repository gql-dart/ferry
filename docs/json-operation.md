---
id: json-operation
title: "Escape Hatch: untyped JSON Operations"
sidebar_label: JSON Operations
---

Ferry embraces type safety and code generation.
However, if you want to opt-out of this, or if you want to dynamically construct operations at
runtime,
you can use the `JsonOperationRequest` class.

You pass in the Graphql `Operation` object, and the variables as a `Map<String, dynamic>`.
The response will be a `Map<String, dynamic>` as well.

Example:

```dart
import 'package:gql_exec/gql_exec.dart' show Operation;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry/ferry.dart';
import 'package:gql/language.dart' as gql;


Future<Map<String, dynamic>?> jsonOperation(Client client) async {
  final jsonReq = JsonOperationRequest(
    fetchPolicy: FetchPolicy.CacheFirst,
    operation: Operation(
      document: gql.parseString(r'''
          query Reviews {
            reviews(episode: $episode, first: $first, offset: $offset) {
              id
              stars
            }
          }
        '''),
      operationName: 'Reviews',
    ),
    vars: {
      'episode': 'EMPIRE',
      'first': 1,
      'offset': 0,
    },
  );
  final result = await client
      .request(req)
      .first;

  return result.data;
}

```
    

