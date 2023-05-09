// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'aliased_hero.var.gql.g.dart';

abstract class GAliasedHeroVars
    implements Built<GAliasedHeroVars, GAliasedHeroVarsBuilder> {
  GAliasedHeroVars._();

  factory GAliasedHeroVars([Function(GAliasedHeroVarsBuilder b) updates]) =
      _$GAliasedHeroVars;

  _i1.GEpisode get ep;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GAliasedHeroVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAliasedHeroVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GAliasedHeroVars.serializer,
        json,
      );
  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GAliasedHeroVars> get serializer =>
      GAliasedHeroVarsSerializer();
}

class GAliasedHeroVarsSerializer
    extends StructuredSerializer<GAliasedHeroVars> {
  final String wireName = 'GAliasedHeroVars';

  final Iterable<Type> types = const [GAliasedHeroVars, _$GAliasedHeroVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GAliasedHeroVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('ep');
    result.add(serializers.serialize(object.ep,
        specifiedType: const FullType(_i1.GEpisode)));
    return result;
  }

  GAliasedHeroVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GAliasedHeroVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ep':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode;
          builder.ep = fieldValue;
          break;
      }
    }
    return builder.build();
  }
}
