// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:ferry_test_graphql2/fragments/__generated__/human_fragment.ast.gql.dart'
    as _i4;
import 'package:ferry_test_graphql2/fragments/__generated__/human_fragment.data.gql.dart'
    as _i2;
import 'package:ferry_test_graphql2/fragments/__generated__/human_fragment.var.gql.dart'
    as _i3;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql/ast.dart' as _i5;

part 'human_fragment.req.gql.g.dart';

abstract class GHumanFragmentReq
    implements
        Built<GHumanFragmentReq, GHumanFragmentReqBuilder>,
        _i1.FragmentRequest<_i2.GHumanFragmentData, _i3.GHumanFragmentVars> {
  GHumanFragmentReq._();

  factory GHumanFragmentReq(
          [void Function(GHumanFragmentReqBuilder b) updates]) =
      _$GHumanFragmentReq;

  static void _initializeBuilder(GHumanFragmentReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'HumanFragment';

  @override
  _i3.GHumanFragmentVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GHumanFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GHumanFragmentData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GHumanFragmentData data) => data.toJson();

  static Serializer<GHumanFragmentReq> get serializer =>
      _$gHumanFragmentReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHumanFragmentReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanFragmentReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHumanFragmentReq.serializer,
        json,
      );
}
