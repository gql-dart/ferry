import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.data.gql.dart';
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.req.gql.dart';
import 'package:ferry_test_external_schema/graphql/__generated__/query_from_external_schema.var.gql.dart';
import 'package:test/test.dart';

void main() {
  test('can serialize and deserialize requests', () {
    final req = GHumanQueryReq((b) => b..vars.id = '123');

    final json = req.toJson();

    final reqFromJson = GHumanQueryReq.fromJson(json);

    expect(req, reqFromJson);
  });

  test('can serialize and deserialize responses', () {
    final res = GHumanQueryData((b) => b
      ..human.birthday = DateTime(2021, 1, 1)
      ..human.id = '123');

    final json = res.toJson();

    final resFromJson = GHumanQueryData.fromJson(json);

    expect(res, resFromJson);
  });

  test('can serialize and deserialize fragment data', () {
    final res = GHumanFragData((b) => b
      ..id = '123'
      ..height = 180.0
      ..birthday = DateTime(2021, 1, 1));

    final json = res.toJson();

    final resFromJson = GHumanFragData.fromJson(json);

    expect(res, resFromJson);
  });

  test('can serialize and deserialize vars', () {
    final vars = GHumanQueryVars((b) => b..id = '123');

    final json = vars.toJson();

    final varsFromJson = GHumanQueryVars.fromJson(json);

    expect(vars, varsFromJson);
  });
}
