import 'package:meta/meta.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

class Query<TVariables> {
  /// The GraphQL query shape to be used constructed using the [parseString] function.
  DocumentNode query;

  /// Any variables that the GraphQL query may depend on.
  TVariables variables;

  Query({@required this.query, this.variables});
}

class Fragment<TVariables> {
  /// The root id to be used, as defined by your [TypePolicy] or
  /// [dataIdFromObject] function.
  ///
  /// If a value with your id does not exist in the store, [null] will be returned.
  Map<String, Object> idFields;

  /// The GraphQL query shape to be used constructed using the [parseString] function.
  DocumentNode fragment;

  /// The name of the fragment in your GraphQL document to be used.
  ///
  /// If you do not provide a [fragmentName] and there is only one fragment
  /// in your [fragment] document then that fragment will be used.
  String fragmentName;

  /// Any variables that your GraphQL fragments depend on.
  TVariables variables;

  Fragment(
      {@required this.idFields,
      @required this.fragment,
      this.fragmentName,
      this.variables});
}

class WriteQueryOptions<TData, TVariables> extends Query<TVariables> {
  /// The data you will be writing to the store.
  TData data;

  WriteQueryOptions({@required this.data});
}

class WriteFragmentOptions<TData, TVariables> extends Fragment<TVariables> {
  /// The data you will be writing to the store.
  TData data;

  WriteFragmentOptions({@required this.data});
}

class WriteDataOptions<TData> {
  /// The data you will be writing to the store.
  ///
  /// It also takes an optional id property.
  /// The id is used to write a fragment to an existing object in the store.
  TData data;
  String id;

  WriteDataOptions({@required this.data, this.id});
}

class DiffResult<T> {
  T result;
  bool complete;

  DiffResult({this.result, this.complete});
}

abstract class DataProxy {
  /// Reads a GraphQL query from the root query id.
  QueryType readQuery<QueryType, TVariables>(Query<TVariables> options,
      [bool optimistic]);

  /// Reads a GraphQL fragment from any arbitrary id. If there is more than
  /// one fragment in the provided document then a [fragmentName] must be
  /// provided to select the correct fragment.
  FragmentType readFragment<FragmentType, TVariables>(Fragment options,
      [bool optimistic]);

  /// Writes a GraphQL query to the root query id.
  void writeQuery<TData, TVariables>(
      WriteQueryOptions<TData, TVariables> options);

  /// Writes a GraphQL fragment to any arbitrary id. If there is more than
  /// one fragment in the provided document then a [fragmentName] must be
  /// provided to select the correct fragment.
  void writeFragment<TData, TVariables>(
      WriteFragmentOptions<TData, TVariables> options);

  /// Sugar for writeQuery & writeFragment.
  /// Writes data to the store without passing in a query.
  /// If you supply an id, the data will be written as a fragment to an existing object.
  /// Otherwise, the data is written to the root of the store.
  void writeData<TData>(WriteDataOptions<TData> options);
}
