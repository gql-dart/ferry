// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Songs _$SongsFromJson(Map<String, dynamic> json) {
  return Songs()
    ..Song = (json['Song'] as List)
        ?.map((e) =>
            e == null ? null : SongsSong.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SongsToJson(Songs instance) => <String, dynamic>{
      'Song': instance.Song?.map((e) => e?.toJson())?.toList(),
    };

SongsSong _$SongsSongFromJson(Map<String, dynamic> json) {
  return SongsSong()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$SongsSongToJson(SongsSong instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      '__typename': instance.resolveType,
    };

SongsSearchResult _$SongsSearchResultFromJson(Map<String, dynamic> json) {
  return SongsSearchResult()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$SongsSearchResultToJson(SongsSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      '__typename': instance.resolveType,
    };

SongsArguments _$SongsArgumentsFromJson(Map<String, dynamic> json) {
  return SongsArguments(
    first: json['first'] as int,
    offset: json['offset'] as int,
  );
}

Map<String, dynamic> _$SongsArgumentsToJson(SongsArguments instance) =>
    <String, dynamic>{
      'first': instance.first,
      'offset': instance.offset,
    };

AddSong _$AddSongFromJson(Map<String, dynamic> json) {
  return AddSong()
    ..CreateSong = json['CreateSong'] == null
        ? null
        : AddSongSong.fromJson(json['CreateSong'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AddSongToJson(AddSong instance) => <String, dynamic>{
      'CreateSong': instance.CreateSong?.toJson(),
    };

AddSongSong _$AddSongSongFromJson(Map<String, dynamic> json) {
  return AddSongSong()
    ..id = json['id'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$AddSongSongToJson(AddSongSong instance) =>
    <String, dynamic>{
      'id': instance.id,
      '__typename': instance.resolveType,
    };

AddSongSearchResult _$AddSongSearchResultFromJson(Map<String, dynamic> json) {
  return AddSongSearchResult()
    ..id = json['id'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$AddSongSearchResultToJson(
        AddSongSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      '__typename': instance.resolveType,
    };

AddSongArguments _$AddSongArgumentsFromJson(Map<String, dynamic> json) {
  return AddSongArguments(
    id: json['id'] as String,
    name: json['name'] as String,
    fileName: json['fileName'] as String,
  );
}

Map<String, dynamic> _$AddSongArgumentsToJson(AddSongArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileName': instance.fileName,
    };
