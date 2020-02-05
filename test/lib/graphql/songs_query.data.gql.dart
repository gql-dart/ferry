class $SongsQuery {
  const $SongsQuery(this.data);

  final Map<String, dynamic> data;

  List<$SongsQuery$Song> get Song => (data['Song'] as List)
      .map((dynamic e) => $SongsQuery$Song((e as Map<String, dynamic>)))
      .toList();
}

class $SongsQuery$Song {
  const $SongsQuery$Song(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
}
