// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login.data.gql.g.dart';

abstract class GLoginData implements Built<GLoginData, GLoginDataBuilder> {
  GLoginData._();

  factory GLoginData([void Function(GLoginDataBuilder b) updates]) =
      _$GLoginData;

  static void _initializeBuilder(GLoginDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLoginData_login? get login;
  static Serializer<GLoginData> get serializer => _$gLoginDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLoginData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLoginData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLoginData.serializer,
        json,
      );
}

abstract class GLoginData_login
    implements Built<GLoginData_login, GLoginData_loginBuilder> {
  GLoginData_login._();

  factory GLoginData_login([void Function(GLoginData_loginBuilder b) updates]) =
      _$GLoginData_login;

  static void _initializeBuilder(GLoginData_loginBuilder b) =>
      b..G__typename = 'jwtToken';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get token;
  static Serializer<GLoginData_login> get serializer =>
      _$gLoginDataLoginSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLoginData_login.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLoginData_login? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLoginData_login.serializer,
        json,
      );
}
