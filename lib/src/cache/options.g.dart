// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReadQueryOptions extends ReadQueryOptions {
  @override
  final bool optimistic;
  @override
  final DocumentNode document;
  @override
  final String operationName;
  @override
  final Map<String, dynamic> variables;

  factory _$ReadQueryOptions(
          [void Function(ReadQueryOptionsBuilder) updates]) =>
      (new ReadQueryOptionsBuilder()..update(updates)).build();

  _$ReadQueryOptions._(
      {this.optimistic, this.document, this.operationName, this.variables})
      : super._() {
    if (document == null) {
      throw new BuiltValueNullFieldError('ReadQueryOptions', 'document');
    }
  }

  @override
  ReadQueryOptions rebuild(void Function(ReadQueryOptionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadQueryOptionsBuilder toBuilder() =>
      new ReadQueryOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadQueryOptions &&
        optimistic == other.optimistic &&
        document == other.document &&
        operationName == other.operationName &&
        variables == other.variables;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, optimistic.hashCode), document.hashCode),
            operationName.hashCode),
        variables.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReadQueryOptions')
          ..add('optimistic', optimistic)
          ..add('document', document)
          ..add('operationName', operationName)
          ..add('variables', variables))
        .toString();
  }
}

class ReadQueryOptionsBuilder
    implements Builder<ReadQueryOptions, ReadQueryOptionsBuilder> {
  _$ReadQueryOptions _$v;

  bool _optimistic;
  bool get optimistic => _$this._optimistic;
  set optimistic(bool optimistic) => _$this._optimistic = optimistic;

  DocumentNode _document;
  DocumentNode get document => _$this._document;
  set document(DocumentNode document) => _$this._document = document;

  String _operationName;
  String get operationName => _$this._operationName;
  set operationName(String operationName) =>
      _$this._operationName = operationName;

  Map<String, dynamic> _variables;
  Map<String, dynamic> get variables => _$this._variables;
  set variables(Map<String, dynamic> variables) =>
      _$this._variables = variables;

  ReadQueryOptionsBuilder();

  ReadQueryOptionsBuilder get _$this {
    if (_$v != null) {
      _optimistic = _$v.optimistic;
      _document = _$v.document;
      _operationName = _$v.operationName;
      _variables = _$v.variables;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadQueryOptions other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReadQueryOptions;
  }

  @override
  void update(void Function(ReadQueryOptionsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReadQueryOptions build() {
    final _$result = _$v ??
        new _$ReadQueryOptions._(
            optimistic: optimistic,
            document: document,
            operationName: operationName,
            variables: variables);
    replace(_$result);
    return _$result;
  }
}

class _$WriteQueryOptions extends WriteQueryOptions {
  @override
  final Map<String, dynamic> data;
  @override
  final DocumentNode document;
  @override
  final String operationName;
  @override
  final Map<String, dynamic> variables;

  factory _$WriteQueryOptions(
          [void Function(WriteQueryOptionsBuilder) updates]) =>
      (new WriteQueryOptionsBuilder()..update(updates)).build();

  _$WriteQueryOptions._(
      {this.data, this.document, this.operationName, this.variables})
      : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('WriteQueryOptions', 'data');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('WriteQueryOptions', 'document');
    }
  }

  @override
  WriteQueryOptions rebuild(void Function(WriteQueryOptionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WriteQueryOptionsBuilder toBuilder() =>
      new WriteQueryOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WriteQueryOptions &&
        data == other.data &&
        document == other.document &&
        operationName == other.operationName &&
        variables == other.variables;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, data.hashCode), document.hashCode),
            operationName.hashCode),
        variables.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WriteQueryOptions')
          ..add('data', data)
          ..add('document', document)
          ..add('operationName', operationName)
          ..add('variables', variables))
        .toString();
  }
}

class WriteQueryOptionsBuilder
    implements Builder<WriteQueryOptions, WriteQueryOptionsBuilder> {
  _$WriteQueryOptions _$v;

  Map<String, dynamic> _data;
  Map<String, dynamic> get data => _$this._data;
  set data(Map<String, dynamic> data) => _$this._data = data;

  DocumentNode _document;
  DocumentNode get document => _$this._document;
  set document(DocumentNode document) => _$this._document = document;

  String _operationName;
  String get operationName => _$this._operationName;
  set operationName(String operationName) =>
      _$this._operationName = operationName;

  Map<String, dynamic> _variables;
  Map<String, dynamic> get variables => _$this._variables;
  set variables(Map<String, dynamic> variables) =>
      _$this._variables = variables;

  WriteQueryOptionsBuilder();

  WriteQueryOptionsBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data;
      _document = _$v.document;
      _operationName = _$v.operationName;
      _variables = _$v.variables;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WriteQueryOptions other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WriteQueryOptions;
  }

  @override
  void update(void Function(WriteQueryOptionsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WriteQueryOptions build() {
    final _$result = _$v ??
        new _$WriteQueryOptions._(
            data: data,
            document: document,
            operationName: operationName,
            variables: variables);
    replace(_$result);
    return _$result;
  }
}

class _$ReadFragmentOptions extends ReadFragmentOptions {
  @override
  final bool optimistic;
  @override
  final DocumentNode fragment;
  @override
  final Map<String, dynamic> idFields;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> variables;
  @override
  final DocumentNode document;
  @override
  final String operationName;

  factory _$ReadFragmentOptions(
          [void Function(ReadFragmentOptionsBuilder) updates]) =>
      (new ReadFragmentOptionsBuilder()..update(updates)).build();

  _$ReadFragmentOptions._(
      {this.optimistic,
      this.fragment,
      this.idFields,
      this.fragmentName,
      this.variables,
      this.document,
      this.operationName})
      : super._() {
    if (fragment == null) {
      throw new BuiltValueNullFieldError('ReadFragmentOptions', 'fragment');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('ReadFragmentOptions', 'idFields');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('ReadFragmentOptions', 'document');
    }
    if (operationName == null) {
      throw new BuiltValueNullFieldError(
          'ReadFragmentOptions', 'operationName');
    }
  }

  @override
  ReadFragmentOptions rebuild(
          void Function(ReadFragmentOptionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadFragmentOptionsBuilder toBuilder() =>
      new ReadFragmentOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadFragmentOptions &&
        optimistic == other.optimistic &&
        fragment == other.fragment &&
        idFields == other.idFields &&
        fragmentName == other.fragmentName &&
        variables == other.variables &&
        document == other.document &&
        operationName == other.operationName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, optimistic.hashCode), fragment.hashCode),
                        idFields.hashCode),
                    fragmentName.hashCode),
                variables.hashCode),
            document.hashCode),
        operationName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReadFragmentOptions')
          ..add('optimistic', optimistic)
          ..add('fragment', fragment)
          ..add('idFields', idFields)
          ..add('fragmentName', fragmentName)
          ..add('variables', variables)
          ..add('document', document)
          ..add('operationName', operationName))
        .toString();
  }
}

class ReadFragmentOptionsBuilder
    implements Builder<ReadFragmentOptions, ReadFragmentOptionsBuilder> {
  _$ReadFragmentOptions _$v;

  bool _optimistic;
  bool get optimistic => _$this._optimistic;
  set optimistic(bool optimistic) => _$this._optimistic = optimistic;

  DocumentNode _fragment;
  DocumentNode get fragment => _$this._fragment;
  set fragment(DocumentNode fragment) => _$this._fragment = fragment;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _variables;
  Map<String, dynamic> get variables => _$this._variables;
  set variables(Map<String, dynamic> variables) =>
      _$this._variables = variables;

  DocumentNode _document;
  DocumentNode get document => _$this._document;
  set document(DocumentNode document) => _$this._document = document;

  String _operationName;
  String get operationName => _$this._operationName;
  set operationName(String operationName) =>
      _$this._operationName = operationName;

  ReadFragmentOptionsBuilder();

  ReadFragmentOptionsBuilder get _$this {
    if (_$v != null) {
      _optimistic = _$v.optimistic;
      _fragment = _$v.fragment;
      _idFields = _$v.idFields;
      _fragmentName = _$v.fragmentName;
      _variables = _$v.variables;
      _document = _$v.document;
      _operationName = _$v.operationName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadFragmentOptions other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReadFragmentOptions;
  }

  @override
  void update(void Function(ReadFragmentOptionsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReadFragmentOptions build() {
    final _$result = _$v ??
        new _$ReadFragmentOptions._(
            optimistic: optimistic,
            fragment: fragment,
            idFields: idFields,
            fragmentName: fragmentName,
            variables: variables,
            document: document,
            operationName: operationName);
    replace(_$result);
    return _$result;
  }
}

class _$WriteFragmentOptions extends WriteFragmentOptions {
  @override
  final Map<String, dynamic> data;
  @override
  final DocumentNode fragment;
  @override
  final Map<String, dynamic> idFields;
  @override
  final String fragmentName;
  @override
  final Map<String, dynamic> variables;
  @override
  final DocumentNode document;
  @override
  final String operationName;

  factory _$WriteFragmentOptions(
          [void Function(WriteFragmentOptionsBuilder) updates]) =>
      (new WriteFragmentOptionsBuilder()..update(updates)).build();

  _$WriteFragmentOptions._(
      {this.data,
      this.fragment,
      this.idFields,
      this.fragmentName,
      this.variables,
      this.document,
      this.operationName})
      : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('WriteFragmentOptions', 'data');
    }
    if (fragment == null) {
      throw new BuiltValueNullFieldError('WriteFragmentOptions', 'fragment');
    }
    if (idFields == null) {
      throw new BuiltValueNullFieldError('WriteFragmentOptions', 'idFields');
    }
    if (document == null) {
      throw new BuiltValueNullFieldError('WriteFragmentOptions', 'document');
    }
    if (operationName == null) {
      throw new BuiltValueNullFieldError(
          'WriteFragmentOptions', 'operationName');
    }
  }

  @override
  WriteFragmentOptions rebuild(
          void Function(WriteFragmentOptionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WriteFragmentOptionsBuilder toBuilder() =>
      new WriteFragmentOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WriteFragmentOptions &&
        data == other.data &&
        fragment == other.fragment &&
        idFields == other.idFields &&
        fragmentName == other.fragmentName &&
        variables == other.variables &&
        document == other.document &&
        operationName == other.operationName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, data.hashCode), fragment.hashCode),
                        idFields.hashCode),
                    fragmentName.hashCode),
                variables.hashCode),
            document.hashCode),
        operationName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WriteFragmentOptions')
          ..add('data', data)
          ..add('fragment', fragment)
          ..add('idFields', idFields)
          ..add('fragmentName', fragmentName)
          ..add('variables', variables)
          ..add('document', document)
          ..add('operationName', operationName))
        .toString();
  }
}

class WriteFragmentOptionsBuilder
    implements Builder<WriteFragmentOptions, WriteFragmentOptionsBuilder> {
  _$WriteFragmentOptions _$v;

  Map<String, dynamic> _data;
  Map<String, dynamic> get data => _$this._data;
  set data(Map<String, dynamic> data) => _$this._data = data;

  DocumentNode _fragment;
  DocumentNode get fragment => _$this._fragment;
  set fragment(DocumentNode fragment) => _$this._fragment = fragment;

  Map<String, dynamic> _idFields;
  Map<String, dynamic> get idFields => _$this._idFields;
  set idFields(Map<String, dynamic> idFields) => _$this._idFields = idFields;

  String _fragmentName;
  String get fragmentName => _$this._fragmentName;
  set fragmentName(String fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic> _variables;
  Map<String, dynamic> get variables => _$this._variables;
  set variables(Map<String, dynamic> variables) =>
      _$this._variables = variables;

  DocumentNode _document;
  DocumentNode get document => _$this._document;
  set document(DocumentNode document) => _$this._document = document;

  String _operationName;
  String get operationName => _$this._operationName;
  set operationName(String operationName) =>
      _$this._operationName = operationName;

  WriteFragmentOptionsBuilder();

  WriteFragmentOptionsBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data;
      _fragment = _$v.fragment;
      _idFields = _$v.idFields;
      _fragmentName = _$v.fragmentName;
      _variables = _$v.variables;
      _document = _$v.document;
      _operationName = _$v.operationName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WriteFragmentOptions other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WriteFragmentOptions;
  }

  @override
  void update(void Function(WriteFragmentOptionsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WriteFragmentOptions build() {
    final _$result = _$v ??
        new _$WriteFragmentOptions._(
            data: data,
            fragment: fragment,
            idFields: idFields,
            fragmentName: fragmentName,
            variables: variables,
            document: document,
            operationName: operationName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
