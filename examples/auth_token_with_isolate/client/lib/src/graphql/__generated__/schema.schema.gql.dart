// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authors_example/src/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schema.schema.gql.g.dart';

abstract class GAuthorsOrder
    implements Built<GAuthorsOrder, GAuthorsOrderBuilder> {
  GAuthorsOrder._();

  factory GAuthorsOrder([void Function(GAuthorsOrderBuilder b) updates]) =
      _$GAuthorsOrder;

  GAuthorsOrderField get field;
  GDirection get direction;
  static Serializer<GAuthorsOrder> get serializer => _$gAuthorsOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorsOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorsOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorsOrder.serializer,
        json,
      );
}

class GAuthorsOrderField extends EnumClass {
  const GAuthorsOrderField._(String name) : super(name);

  static const GAuthorsOrderField ID = _$gAuthorsOrderFieldID;

  static const GAuthorsOrderField FIRST_NAME = _$gAuthorsOrderFieldFIRST_NAME;

  static const GAuthorsOrderField LAST_NAME = _$gAuthorsOrderFieldLAST_NAME;

  static const GAuthorsOrderField CREATED_AT = _$gAuthorsOrderFieldCREATED_AT;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const GAuthorsOrderField gUnknownEnumValue =
      _$gAuthorsOrderFieldgUnknownEnumValue;

  static Serializer<GAuthorsOrderField> get serializer =>
      _$gAuthorsOrderFieldSerializer;

  static BuiltSet<GAuthorsOrderField> get values => _$gAuthorsOrderFieldValues;

  static GAuthorsOrderField valueOf(String name) =>
      _$gAuthorsOrderFieldValueOf(name);
}

abstract class GdeleteAuthorInput
    implements Built<GdeleteAuthorInput, GdeleteAuthorInputBuilder> {
  GdeleteAuthorInput._();

  factory GdeleteAuthorInput(
          [void Function(GdeleteAuthorInputBuilder b) updates]) =
      _$GdeleteAuthorInput;

  int get id;
  static Serializer<GdeleteAuthorInput> get serializer =>
      _$gdeleteAuthorInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GdeleteAuthorInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GdeleteAuthorInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GdeleteAuthorInput.serializer,
        json,
      );
}

class GDirection extends EnumClass {
  const GDirection._(String name) : super(name);

  static const GDirection ASC = _$gDirectionASC;

  static const GDirection DESC = _$gDirectionDESC;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const GDirection gUnknownEnumValue = _$gDirectiongUnknownEnumValue;

  static Serializer<GDirection> get serializer => _$gDirectionSerializer;

  static BuiltSet<GDirection> get values => _$gDirectionValues;

  static GDirection valueOf(String name) => _$gDirectionValueOf(name);
}

abstract class GloginInput implements Built<GloginInput, GloginInputBuilder> {
  GloginInput._();

  factory GloginInput([void Function(GloginInputBuilder b) updates]) =
      _$GloginInput;

  String get username;
  String get password;
  static Serializer<GloginInput> get serializer => _$gloginInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GloginInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GloginInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GloginInput.serializer,
        json,
      );
}

abstract class GNewAuthor implements Built<GNewAuthor, GNewAuthorBuilder> {
  GNewAuthor._();

  factory GNewAuthor([void Function(GNewAuthorBuilder b) updates]) =
      _$GNewAuthor;

  String get firstName;
  String get lastName;
  static Serializer<GNewAuthor> get serializer => _$gNewAuthorSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNewAuthor.serializer,
        this,
      ) as Map<String, dynamic>);

  static GNewAuthor? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNewAuthor.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {};
