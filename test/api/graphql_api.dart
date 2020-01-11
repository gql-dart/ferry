// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Songs with EquatableMixin {
  Songs();

  factory Songs.fromJson(Map<String, dynamic> json) => _$SongsFromJson(json);

  List<SongsSong> Song;

  @override
  List<Object> get props => [Song];
  Map<String, dynamic> toJson() => _$SongsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SongsSong with EquatableMixin implements SongsSearchResult {
  SongsSong();

  factory SongsSong.fromJson(Map<String, dynamic> json) =>
      _$SongsSongFromJson(json);

  @override
  String id;

  @override
  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, name, resolveType];
  Map<String, dynamic> toJson() => _$SongsSongToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SongsSearchResult with EquatableMixin {
  SongsSearchResult();

  factory SongsSearchResult.fromJson(Map<String, dynamic> json) =>
      _$SongsSearchResultFromJson(json);

  String id;

  String name;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, name, resolveType];
  Map<String, dynamic> toJson() => _$SongsSearchResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SongsArguments extends JsonSerializable with EquatableMixin {
  SongsArguments({this.first, this.offset});

  factory SongsArguments.fromJson(Map<String, dynamic> json) =>
      _$SongsArgumentsFromJson(json);

  final int first;

  final int offset;

  @override
  List<Object> get props => [first, offset];
  Map<String, dynamic> toJson() => _$SongsArgumentsToJson(this);
}

class SongsQuery extends GraphQLQuery<Songs, SongsArguments> {
  SongsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Songs'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'first')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'offset')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'Song'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: VariableNode(name: NameNode(value: 'first'))),
                ArgumentNode(
                    name: NameNode(value: 'offset'),
                    value: VariableNode(name: NameNode(value: 'offset')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ])),
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateSong'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'name')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'fileName')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'CreateSong'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id'))),
                ArgumentNode(
                    name: NameNode(value: 'name'),
                    value: VariableNode(name: NameNode(value: 'name'))),
                ArgumentNode(
                    name: NameNode(value: 'fileName'),
                    value: VariableNode(name: NameNode(value: 'fileName')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Songs';

  @override
  final SongsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Songs parse(Map<String, dynamic> json) => Songs.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddSong with EquatableMixin {
  AddSong();

  factory AddSong.fromJson(Map<String, dynamic> json) =>
      _$AddSongFromJson(json);

  AddSongSong CreateSong;

  @override
  List<Object> get props => [CreateSong];
  Map<String, dynamic> toJson() => _$AddSongToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddSongSong with EquatableMixin implements AddSongSearchResult {
  AddSongSong();

  factory AddSongSong.fromJson(Map<String, dynamic> json) =>
      _$AddSongSongFromJson(json);

  @override
  String id;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, resolveType];
  Map<String, dynamic> toJson() => _$AddSongSongToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddSongSearchResult with EquatableMixin {
  AddSongSearchResult();

  factory AddSongSearchResult.fromJson(Map<String, dynamic> json) =>
      _$AddSongSearchResultFromJson(json);

  String id;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, resolveType];
  Map<String, dynamic> toJson() => _$AddSongSearchResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddSongArguments extends JsonSerializable with EquatableMixin {
  AddSongArguments({this.id, this.name, this.fileName});

  factory AddSongArguments.fromJson(Map<String, dynamic> json) =>
      _$AddSongArgumentsFromJson(json);

  final String id;

  final String name;

  final String fileName;

  @override
  List<Object> get props => [id, name, fileName];
  Map<String, dynamic> toJson() => _$AddSongArgumentsToJson(this);
}

class AddSongQuery extends GraphQLQuery<AddSong, AddSongArguments> {
  AddSongQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'AddSong'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'name')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'fileName')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'CreateSong'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id'))),
                ArgumentNode(
                    name: NameNode(value: 'name'),
                    value: VariableNode(name: NameNode(value: 'name'))),
                ArgumentNode(
                    name: NameNode(value: 'fileName'),
                    value: VariableNode(name: NameNode(value: 'fileName')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'AddSong';

  @override
  final AddSongArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AddSong parse(Map<String, dynamic> json) => AddSong.fromJson(json);
}
