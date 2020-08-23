import 'package:built_value/serializer.dart';

class DateSerializer implements PrimitiveSerializer<DateTime> {
  @override
  DateTime deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    assert(serialized is int,
        "DateSerializer expected 'int' but got ${serialized.runtimeType}");
    return DateTime.fromMillisecondsSinceEpoch(serialized);
  }

  @override
  Object serialize(
    Serializers serializers,
    DateTime date, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      date.millisecondsSinceEpoch;

  @override
  Iterable<Type> get types => [DateTime];

  @override
  String get wireName => "Date";
}
