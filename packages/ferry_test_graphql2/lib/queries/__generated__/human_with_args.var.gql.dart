// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i2;
import 'package:gql_exec/value.dart' as _i1;

part 'human_with_args.var.gql.g.dart';

abstract class GHumanWithArgsVars
    implements Built<GHumanWithArgsVars, GHumanWithArgsVarsBuilder> {
  GHumanWithArgsVars._();

  factory GHumanWithArgsVars([Function(GHumanWithArgsVarsBuilder b) updates]) =
      _$GHumanWithArgsVars;

  String get id;
  _i1.Value<String>? get friendsAfter;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHumanWithArgsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHumanWithArgsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHumanWithArgsVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHumanWithArgsVars> get serializer =>
      GHumanWithArgsVarsSerializer();
}

class GHumanWithArgsVarsSerializer
    extends StructuredSerializer<GHumanWithArgsVars> {
  final String wireName = 'GHumanWithArgsVars';

  final Iterable<Type> types = const [GHumanWithArgsVars, _$GHumanWithArgsVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHumanWithArgsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('id');
    result.add(serializers.serialize(object.id,
        specifiedType: const FullType(String)));
    final _$friendsAftervalue = object.friendsAfter;
    if (_$friendsAftervalue != null) {
      result.add('friendsAfter');
      result.add(serializers.serialize(_$friendsAftervalue!.value,
          specifiedType: const FullType(String)));
    }
    return result;
  }

  GHumanWithArgsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHumanWithArgsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.id = fieldValue;
          break;
        case 'friendsAfter':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.friendsAfter = _i1.Value(fieldValue);
          break;
      }
    }
    return builder.build();
  }
}
