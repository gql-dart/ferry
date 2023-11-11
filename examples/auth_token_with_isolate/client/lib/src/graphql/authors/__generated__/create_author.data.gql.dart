// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_author.data.gql.g.dart';

abstract class GCreateAuthorData
    implements Built<GCreateAuthorData, GCreateAuthorDataBuilder> {
  GCreateAuthorData._();

  factory GCreateAuthorData([Function(GCreateAuthorDataBuilder b) updates]) =
      _$GCreateAuthorData;

  static void _initializeBuilder(GCreateAuthorDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateAuthorData_createAuthor? get createAuthor;
  static Serializer<GCreateAuthorData> get serializer =>
      _$gCreateAuthorDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAuthorData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAuthorData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAuthorData.serializer,
        json,
      );
}

abstract class GCreateAuthorData_createAuthor
    implements
        Built<GCreateAuthorData_createAuthor,
            GCreateAuthorData_createAuthorBuilder> {
  GCreateAuthorData_createAuthor._();

  factory GCreateAuthorData_createAuthor(
          [Function(GCreateAuthorData_createAuthorBuilder b) updates]) =
      _$GCreateAuthorData_createAuthor;

  static void _initializeBuilder(GCreateAuthorData_createAuthorBuilder b) =>
      b..G__typename = 'Author';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get firstName;
  String get lastName;
  static Serializer<GCreateAuthorData_createAuthor> get serializer =>
      _$gCreateAuthorDataCreateAuthorSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAuthorData_createAuthor.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAuthorData_createAuthor? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAuthorData_createAuthor.serializer,
        json,
      );
}
