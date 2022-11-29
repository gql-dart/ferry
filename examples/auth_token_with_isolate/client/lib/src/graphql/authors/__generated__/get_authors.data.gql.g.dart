// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_authors.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAuthorsData> _$gGetAuthorsDataSerializer =
    new _$GGetAuthorsDataSerializer();
Serializer<GGetAuthorsData_authors> _$gGetAuthorsDataAuthorsSerializer =
    new _$GGetAuthorsData_authorsSerializer();
Serializer<GGetAuthorsData_authors_edges>
    _$gGetAuthorsDataAuthorsEdgesSerializer =
    new _$GGetAuthorsData_authors_edgesSerializer();
Serializer<GGetAuthorsData_authors_edges_node>
    _$gGetAuthorsDataAuthorsEdgesNodeSerializer =
    new _$GGetAuthorsData_authors_edges_nodeSerializer();

class _$GGetAuthorsDataSerializer
    implements StructuredSerializer<GGetAuthorsData> {
  @override
  final Iterable<Type> types = const [GGetAuthorsData, _$GGetAuthorsData];
  @override
  final String wireName = 'GGetAuthorsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetAuthorsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.authors;
    if (value != null) {
      result
        ..add('authors')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetAuthorsData_authors)));
    }
    return result;
  }

  @override
  GGetAuthorsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'authors':
          result.authors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetAuthorsData_authors))!
              as GGetAuthorsData_authors);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorsData_authorsSerializer
    implements StructuredSerializer<GGetAuthorsData_authors> {
  @override
  final Iterable<Type> types = const [
    GGetAuthorsData_authors,
    _$GGetAuthorsData_authors
  ];
  @override
  final String wireName = 'GGetAuthorsData_authors';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorsData_authors object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.edges;
    if (value != null) {
      result
        ..add('edges')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetAuthorsData_authors_edges)
            ])));
    }
    return result;
  }

  @override
  GGetAuthorsData_authors deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorsData_authorsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'edges':
          result.edges.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetAuthorsData_authors_edges)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorsData_authors_edgesSerializer
    implements StructuredSerializer<GGetAuthorsData_authors_edges> {
  @override
  final Iterable<Type> types = const [
    GGetAuthorsData_authors_edges,
    _$GGetAuthorsData_authors_edges
  ];
  @override
  final String wireName = 'GGetAuthorsData_authors_edges';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorsData_authors_edges object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.node;
    if (value != null) {
      result
        ..add('node')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetAuthorsData_authors_edges_node)));
    }
    return result;
  }

  @override
  GGetAuthorsData_authors_edges deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorsData_authors_edgesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'node':
          result.node.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetAuthorsData_authors_edges_node))!
              as GGetAuthorsData_authors_edges_node);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorsData_authors_edges_nodeSerializer
    implements StructuredSerializer<GGetAuthorsData_authors_edges_node> {
  @override
  final Iterable<Type> types = const [
    GGetAuthorsData_authors_edges_node,
    _$GGetAuthorsData_authors_edges_node
  ];
  @override
  final String wireName = 'GGetAuthorsData_authors_edges_node';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorsData_authors_edges_node object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetAuthorsData_authors_edges_node deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorsData_authors_edges_nodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorsData extends GGetAuthorsData {
  @override
  final String G__typename;
  @override
  final GGetAuthorsData_authors? authors;

  factory _$GGetAuthorsData([void Function(GGetAuthorsDataBuilder)? updates]) =>
      (new GGetAuthorsDataBuilder()..update(updates))._build();

  _$GGetAuthorsData._({required this.G__typename, this.authors}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorsData', 'G__typename');
  }

  @override
  GGetAuthorsData rebuild(void Function(GGetAuthorsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorsDataBuilder toBuilder() =>
      new GGetAuthorsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorsData &&
        G__typename == other.G__typename &&
        authors == other.authors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), authors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAuthorsData')
          ..add('G__typename', G__typename)
          ..add('authors', authors))
        .toString();
  }
}

class GGetAuthorsDataBuilder
    implements Builder<GGetAuthorsData, GGetAuthorsDataBuilder> {
  _$GGetAuthorsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetAuthorsData_authorsBuilder? _authors;
  GGetAuthorsData_authorsBuilder get authors =>
      _$this._authors ??= new GGetAuthorsData_authorsBuilder();
  set authors(GGetAuthorsData_authorsBuilder? authors) =>
      _$this._authors = authors;

  GGetAuthorsDataBuilder() {
    GGetAuthorsData._initializeBuilder(this);
  }

  GGetAuthorsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _authors = $v.authors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorsData;
  }

  @override
  void update(void Function(GGetAuthorsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorsData build() => _build();

  _$GGetAuthorsData _build() {
    _$GGetAuthorsData _$result;
    try {
      _$result = _$v ??
          new _$GGetAuthorsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetAuthorsData', 'G__typename'),
              authors: _authors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'authors';
        _authors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAuthorsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAuthorsData_authors extends GGetAuthorsData_authors {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetAuthorsData_authors_edges?>? edges;

  factory _$GGetAuthorsData_authors(
          [void Function(GGetAuthorsData_authorsBuilder)? updates]) =>
      (new GGetAuthorsData_authorsBuilder()..update(updates))._build();

  _$GGetAuthorsData_authors._({required this.G__typename, this.edges})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorsData_authors', 'G__typename');
  }

  @override
  GGetAuthorsData_authors rebuild(
          void Function(GGetAuthorsData_authorsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorsData_authorsBuilder toBuilder() =>
      new GGetAuthorsData_authorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorsData_authors &&
        G__typename == other.G__typename &&
        edges == other.edges;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), edges.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAuthorsData_authors')
          ..add('G__typename', G__typename)
          ..add('edges', edges))
        .toString();
  }
}

class GGetAuthorsData_authorsBuilder
    implements
        Builder<GGetAuthorsData_authors, GGetAuthorsData_authorsBuilder> {
  _$GGetAuthorsData_authors? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetAuthorsData_authors_edges?>? _edges;
  ListBuilder<GGetAuthorsData_authors_edges?> get edges =>
      _$this._edges ??= new ListBuilder<GGetAuthorsData_authors_edges?>();
  set edges(ListBuilder<GGetAuthorsData_authors_edges?>? edges) =>
      _$this._edges = edges;

  GGetAuthorsData_authorsBuilder() {
    GGetAuthorsData_authors._initializeBuilder(this);
  }

  GGetAuthorsData_authorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _edges = $v.edges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorsData_authors other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorsData_authors;
  }

  @override
  void update(void Function(GGetAuthorsData_authorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorsData_authors build() => _build();

  _$GGetAuthorsData_authors _build() {
    _$GGetAuthorsData_authors _$result;
    try {
      _$result = _$v ??
          new _$GGetAuthorsData_authors._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetAuthorsData_authors', 'G__typename'),
              edges: _edges?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'edges';
        _edges?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAuthorsData_authors', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAuthorsData_authors_edges extends GGetAuthorsData_authors_edges {
  @override
  final String G__typename;
  @override
  final GGetAuthorsData_authors_edges_node? node;

  factory _$GGetAuthorsData_authors_edges(
          [void Function(GGetAuthorsData_authors_edgesBuilder)? updates]) =>
      (new GGetAuthorsData_authors_edgesBuilder()..update(updates))._build();

  _$GGetAuthorsData_authors_edges._({required this.G__typename, this.node})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorsData_authors_edges', 'G__typename');
  }

  @override
  GGetAuthorsData_authors_edges rebuild(
          void Function(GGetAuthorsData_authors_edgesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorsData_authors_edgesBuilder toBuilder() =>
      new GGetAuthorsData_authors_edgesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorsData_authors_edges &&
        G__typename == other.G__typename &&
        node == other.node;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), node.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAuthorsData_authors_edges')
          ..add('G__typename', G__typename)
          ..add('node', node))
        .toString();
  }
}

class GGetAuthorsData_authors_edgesBuilder
    implements
        Builder<GGetAuthorsData_authors_edges,
            GGetAuthorsData_authors_edgesBuilder> {
  _$GGetAuthorsData_authors_edges? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetAuthorsData_authors_edges_nodeBuilder? _node;
  GGetAuthorsData_authors_edges_nodeBuilder get node =>
      _$this._node ??= new GGetAuthorsData_authors_edges_nodeBuilder();
  set node(GGetAuthorsData_authors_edges_nodeBuilder? node) =>
      _$this._node = node;

  GGetAuthorsData_authors_edgesBuilder() {
    GGetAuthorsData_authors_edges._initializeBuilder(this);
  }

  GGetAuthorsData_authors_edgesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _node = $v.node?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorsData_authors_edges other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorsData_authors_edges;
  }

  @override
  void update(void Function(GGetAuthorsData_authors_edgesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorsData_authors_edges build() => _build();

  _$GGetAuthorsData_authors_edges _build() {
    _$GGetAuthorsData_authors_edges _$result;
    try {
      _$result = _$v ??
          new _$GGetAuthorsData_authors_edges._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetAuthorsData_authors_edges', 'G__typename'),
              node: _node?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'node';
        _node?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAuthorsData_authors_edges', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAuthorsData_authors_edges_node
    extends GGetAuthorsData_authors_edges_node {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$GGetAuthorsData_authors_edges_node(
          [void Function(GGetAuthorsData_authors_edges_nodeBuilder)?
              updates]) =>
      (new GGetAuthorsData_authors_edges_nodeBuilder()..update(updates))
          ._build();

  _$GGetAuthorsData_authors_edges_node._(
      {required this.G__typename,
      required this.id,
      required this.firstName,
      required this.lastName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorsData_authors_edges_node', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GGetAuthorsData_authors_edges_node', 'id');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'GGetAuthorsData_authors_edges_node', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'GGetAuthorsData_authors_edges_node', 'lastName');
  }

  @override
  GGetAuthorsData_authors_edges_node rebuild(
          void Function(GGetAuthorsData_authors_edges_nodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorsData_authors_edges_nodeBuilder toBuilder() =>
      new GGetAuthorsData_authors_edges_nodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorsData_authors_edges_node &&
        G__typename == other.G__typename &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), firstName.hashCode),
        lastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAuthorsData_authors_edges_node')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class GGetAuthorsData_authors_edges_nodeBuilder
    implements
        Builder<GGetAuthorsData_authors_edges_node,
            GGetAuthorsData_authors_edges_nodeBuilder> {
  _$GGetAuthorsData_authors_edges_node? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GGetAuthorsData_authors_edges_nodeBuilder() {
    GGetAuthorsData_authors_edges_node._initializeBuilder(this);
  }

  GGetAuthorsData_authors_edges_nodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorsData_authors_edges_node other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorsData_authors_edges_node;
  }

  @override
  void update(
      void Function(GGetAuthorsData_authors_edges_nodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorsData_authors_edges_node build() => _build();

  _$GGetAuthorsData_authors_edges_node _build() {
    final _$result = _$v ??
        new _$GGetAuthorsData_authors_edges_node._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetAuthorsData_authors_edges_node', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetAuthorsData_authors_edges_node', 'id'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'GGetAuthorsData_authors_edges_node', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'GGetAuthorsData_authors_edges_node', 'lastName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
