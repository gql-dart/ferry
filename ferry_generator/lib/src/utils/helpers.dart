import 'package:analyzer/dart/element/element.dart';

bool hasSerializer(ClassElement c) => c.fields.any((field) =>
    field.isStatic &&
    field.name == 'serializer' &&
    field.type.element?.name == 'Serializer' &&
    field.type.element?.source?.uri.toString() ==
        'package:built_value/serializer.dart');

bool isBuiltValue(ClassElement c) => c.allSupertypes.any((interface) =>
    (interface.element.name == 'Built' ||
        interface.element.name == 'EnumClass') &&
    interface.element.source.uri.toString() ==
        'package:built_value/built_value.dart');
