import 'package:gql/ast.dart';
import 'package:built_value/built_value.dart';

export 'package:normalize/normalize.dart' show TypePolicy, AddTypenameVisitor;

part 'options.g.dart';

abstract class BaseQueryOptions {
  DocumentNode get document;
  String get operationName;
  Map<String, dynamic> get variables;
}

abstract class ReadQueryOptions
    implements
        Built<ReadQueryOptions, ReadQueryOptionsBuilder>,
        BaseQueryOptions {
  @nullable
  bool get optimistic;

  DocumentNode get document;

  @nullable
  String get operationName;

  @nullable
  Map<String, dynamic> get variables;

  ReadQueryOptions._();
  factory ReadQueryOptions([void Function(ReadQueryOptionsBuilder) updates]) =
      _$ReadQueryOptions;
}

abstract class WriteQueryOptions
    implements
        Built<WriteQueryOptions, WriteQueryOptionsBuilder>,
        BaseQueryOptions {
  Map<String, dynamic> get data;

  DocumentNode get document;

  @nullable
  String get operationName;

  @nullable
  Map<String, dynamic> get variables;

  WriteQueryOptions._();
  factory WriteQueryOptions([void Function(WriteQueryOptionsBuilder) updates]) =
      _$WriteQueryOptions;
}

abstract class BaseFragmentOptions {
  DocumentNode get fragment;
  Map<String, dynamic> get idFields;
  String get fragmentName;
  Map<String, dynamic> get variables;
}

abstract class ReadFragmentOptions
    implements
        Built<ReadFragmentOptions, ReadFragmentOptionsBuilder>,
        BaseQueryOptions {
  @nullable
  bool get optimistic;

  DocumentNode get fragment;

  Map<String, dynamic> get idFields;

  @nullable
  String get fragmentName;

  @nullable
  Map<String, dynamic> get variables;

  ReadFragmentOptions._();
  factory ReadFragmentOptions(
          [void Function(ReadFragmentOptionsBuilder) updates]) =
      _$ReadFragmentOptions;
}

abstract class WriteFragmentOptions
    implements
        Built<WriteFragmentOptions, WriteFragmentOptionsBuilder>,
        BaseQueryOptions {
  Map<String, dynamic> get data;

  DocumentNode get fragment;

  Map<String, dynamic> get idFields;

  @nullable
  String get fragmentName;

  @nullable
  Map<String, dynamic> get variables;

  WriteFragmentOptions._();
  factory WriteFragmentOptions(
          [void Function(WriteFragmentOptionsBuilder) updates]) =
      _$WriteFragmentOptions;
}
