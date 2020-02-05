class SongsQueryVarBuilder {
  final Map<String, dynamic> variables = <String, dynamic>{};

  set first(int value) => variables['first'] = value;
  set offset(int value) => variables['offset'] = value;
}
