import 'package:meta/meta.dart';
import 'package:gql/ast.dart';

export 'package:normalize/normalize.dart' show TypePolicy, AddTypenameVisitor;

class WatchQueryOptions {
  final DocumentNode document;
  final String operationName;
  final Map<String, dynamic> variables;
  final bool optimistic;
  final bool addTypename;

  const WatchQueryOptions({
    @required this.document,
    this.operationName,
    this.variables,
    this.optimistic = true,
    this.addTypename = true,
  });
}

class ReadQueryOptions {
  final DocumentNode document;
  final String operationName;
  final Map<String, dynamic> variables;
  final bool addTypename;
  final bool optimistic;

  const ReadQueryOptions({
    @required this.document,
    this.operationName,
    this.variables,
    this.addTypename = true,
    this.optimistic = true,
  });
}

class ReadFragmentOptions {
  final DocumentNode fragment;
  final Map<String, dynamic> idFields;
  final String fragmentName;
  final Map<String, dynamic> variables;
  final bool addTypename;
  final bool optimistic;

  const ReadFragmentOptions({
    @required this.fragment,
    @required this.idFields,
    this.fragmentName,
    this.variables,
    this.addTypename = true,
    this.optimistic = true,
  });
}

class WriteQueryOptions {
  final DocumentNode document;
  final Map<String, dynamic> data;
  final String operationName;
  final Map<String, dynamic> variables;

  const WriteQueryOptions({
    @required this.document,
    @required this.data,
    this.operationName,
    this.variables,
  });
}

class WriteFragmentOptions {
  final DocumentNode fragment;
  final Map<String, dynamic> idFields;
  final Map<String, dynamic> data;
  final String fragmentName;
  final Map<String, dynamic> variables;

  const WriteFragmentOptions({
    @required this.fragment,
    @required this.idFields,
    @required this.data,
    this.fragmentName,
    this.variables,
  });
}
