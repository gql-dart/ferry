// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_author.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAuthorByIdData> _$gGetAuthorByIdDataSerializer =
    new _$GGetAuthorByIdDataSerializer();
Serializer<GGetAuthorByIdData_author> _$gGetAuthorByIdDataAuthorSerializer =
    new _$GGetAuthorByIdData_authorSerializer();
Serializer<GGetAuthorByIdData_author_quotes>
    _$gGetAuthorByIdDataAuthorQuotesSerializer =
    new _$GGetAuthorByIdData_author_quotesSerializer();
Serializer<GGetAuthorByIdData_author_quotes_edges>
    _$gGetAuthorByIdDataAuthorQuotesEdgesSerializer =
    new _$GGetAuthorByIdData_author_quotes_edgesSerializer();
Serializer<GGetAuthorByIdData_author_quotes_edges_node>
    _$gGetAuthorByIdDataAuthorQuotesEdgesNodeSerializer =
    new _$GGetAuthorByIdData_author_quotes_edges_nodeSerializer();

class _$GGetAuthorByIdDataSerializer
    implements StructuredSerializer<GGetAuthorByIdData> {
  @override
  final Iterable<Type> types = const [GGetAuthorByIdData, _$GGetAuthorByIdData];
  @override
  final String wireName = 'GGetAuthorByIdData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorByIdData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetAuthorByIdData_author)));
    }
    return result;
  }

  @override
  GGetAuthorByIdData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorByIdDataBuilder();

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
        case 'author':
          result.author.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetAuthorByIdData_author))!
              as GGetAuthorByIdData_author);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorByIdData_authorSerializer
    implements StructuredSerializer<GGetAuthorByIdData_author> {
  @override
  final Iterable<Type> types = const [
    GGetAuthorByIdData_author,
    _$GGetAuthorByIdData_author
  ];
  @override
  final String wireName = 'GGetAuthorByIdData_author';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorByIdData_author object,
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
    Object? value;
    value = object.quotes;
    if (value != null) {
      result
        ..add('quotes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetAuthorByIdData_author_quotes)));
    }
    return result;
  }

  @override
  GGetAuthorByIdData_author deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorByIdData_authorBuilder();

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
        case 'quotes':
          result.quotes.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetAuthorByIdData_author_quotes))!
              as GGetAuthorByIdData_author_quotes);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorByIdData_author_quotesSerializer
    implements StructuredSerializer<GGetAuthorByIdData_author_quotes> {
  @override
  final Iterable<Type> types = const [
    GGetAuthorByIdData_author_quotes,
    _$GGetAuthorByIdData_author_quotes
  ];
  @override
  final String wireName = 'GGetAuthorByIdData_author_quotes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorByIdData_author_quotes object,
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
              const FullType.nullable(GGetAuthorByIdData_author_quotes_edges)
            ])));
    }
    return result;
  }

  @override
  GGetAuthorByIdData_author_quotes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorByIdData_author_quotesBuilder();

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
                const FullType.nullable(GGetAuthorByIdData_author_quotes_edges)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorByIdData_author_quotes_edgesSerializer
    implements StructuredSerializer<GGetAuthorByIdData_author_quotes_edges> {
  @override
  final Iterable<Type> types = const [
    GGetAuthorByIdData_author_quotes_edges,
    _$GGetAuthorByIdData_author_quotes_edges
  ];
  @override
  final String wireName = 'GGetAuthorByIdData_author_quotes_edges';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAuthorByIdData_author_quotes_edges object,
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
            specifiedType:
                const FullType(GGetAuthorByIdData_author_quotes_edges_node)));
    }
    return result;
  }

  @override
  GGetAuthorByIdData_author_quotes_edges deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorByIdData_author_quotes_edgesBuilder();

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
                  specifiedType: const FullType(
                      GGetAuthorByIdData_author_quotes_edges_node))!
              as GGetAuthorByIdData_author_quotes_edges_node);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorByIdData_author_quotes_edges_nodeSerializer
    implements
        StructuredSerializer<GGetAuthorByIdData_author_quotes_edges_node> {
  @override
  final Iterable<Type> types = const [
    GGetAuthorByIdData_author_quotes_edges_node,
    _$GGetAuthorByIdData_author_quotes_edges_node
  ];
  @override
  final String wireName = 'GGetAuthorByIdData_author_quotes_edges_node';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetAuthorByIdData_author_quotes_edges_node object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      '_id',
      serializers.serialize(object.G_id, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetAuthorByIdData_author_quotes_edges_node deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAuthorByIdData_author_quotes_edges_nodeBuilder();

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
        case '_id':
          result.G_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAuthorByIdData extends GGetAuthorByIdData {
  @override
  final String G__typename;
  @override
  final GGetAuthorByIdData_author? author;

  factory _$GGetAuthorByIdData(
          [void Function(GGetAuthorByIdDataBuilder)? updates]) =>
      (new GGetAuthorByIdDataBuilder()..update(updates))._build();

  _$GGetAuthorByIdData._({required this.G__typename, this.author}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorByIdData', 'G__typename');
  }

  @override
  GGetAuthorByIdData rebuild(
          void Function(GGetAuthorByIdDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorByIdDataBuilder toBuilder() =>
      new GGetAuthorByIdDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorByIdData &&
        G__typename == other.G__typename &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAuthorByIdData')
          ..add('G__typename', G__typename)
          ..add('author', author))
        .toString();
  }
}

class GGetAuthorByIdDataBuilder
    implements Builder<GGetAuthorByIdData, GGetAuthorByIdDataBuilder> {
  _$GGetAuthorByIdData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetAuthorByIdData_authorBuilder? _author;
  GGetAuthorByIdData_authorBuilder get author =>
      _$this._author ??= new GGetAuthorByIdData_authorBuilder();
  set author(GGetAuthorByIdData_authorBuilder? author) =>
      _$this._author = author;

  GGetAuthorByIdDataBuilder() {
    GGetAuthorByIdData._initializeBuilder(this);
  }

  GGetAuthorByIdDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _author = $v.author?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorByIdData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorByIdData;
  }

  @override
  void update(void Function(GGetAuthorByIdDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorByIdData build() => _build();

  _$GGetAuthorByIdData _build() {
    _$GGetAuthorByIdData _$result;
    try {
      _$result = _$v ??
          new _$GGetAuthorByIdData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetAuthorByIdData', 'G__typename'),
              author: _author?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        _author?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAuthorByIdData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAuthorByIdData_author extends GGetAuthorByIdData_author {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final GGetAuthorByIdData_author_quotes? quotes;

  factory _$GGetAuthorByIdData_author(
          [void Function(GGetAuthorByIdData_authorBuilder)? updates]) =>
      (new GGetAuthorByIdData_authorBuilder()..update(updates))._build();

  _$GGetAuthorByIdData_author._(
      {required this.G__typename,
      required this.id,
      required this.firstName,
      required this.lastName,
      this.quotes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorByIdData_author', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GGetAuthorByIdData_author', 'id');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'GGetAuthorByIdData_author', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'GGetAuthorByIdData_author', 'lastName');
  }

  @override
  GGetAuthorByIdData_author rebuild(
          void Function(GGetAuthorByIdData_authorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorByIdData_authorBuilder toBuilder() =>
      new GGetAuthorByIdData_authorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorByIdData_author &&
        G__typename == other.G__typename &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        quotes == other.quotes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                firstName.hashCode),
            lastName.hashCode),
        quotes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAuthorByIdData_author')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('quotes', quotes))
        .toString();
  }
}

class GGetAuthorByIdData_authorBuilder
    implements
        Builder<GGetAuthorByIdData_author, GGetAuthorByIdData_authorBuilder> {
  _$GGetAuthorByIdData_author? _$v;

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

  GGetAuthorByIdData_author_quotesBuilder? _quotes;
  GGetAuthorByIdData_author_quotesBuilder get quotes =>
      _$this._quotes ??= new GGetAuthorByIdData_author_quotesBuilder();
  set quotes(GGetAuthorByIdData_author_quotesBuilder? quotes) =>
      _$this._quotes = quotes;

  GGetAuthorByIdData_authorBuilder() {
    GGetAuthorByIdData_author._initializeBuilder(this);
  }

  GGetAuthorByIdData_authorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _quotes = $v.quotes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorByIdData_author other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorByIdData_author;
  }

  @override
  void update(void Function(GGetAuthorByIdData_authorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorByIdData_author build() => _build();

  _$GGetAuthorByIdData_author _build() {
    _$GGetAuthorByIdData_author _$result;
    try {
      _$result = _$v ??
          new _$GGetAuthorByIdData_author._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetAuthorByIdData_author', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GGetAuthorByIdData_author', 'id'),
              firstName: BuiltValueNullFieldError.checkNotNull(
                  firstName, r'GGetAuthorByIdData_author', 'firstName'),
              lastName: BuiltValueNullFieldError.checkNotNull(
                  lastName, r'GGetAuthorByIdData_author', 'lastName'),
              quotes: _quotes?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'quotes';
        _quotes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAuthorByIdData_author', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAuthorByIdData_author_quotes
    extends GGetAuthorByIdData_author_quotes {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetAuthorByIdData_author_quotes_edges?>? edges;

  factory _$GGetAuthorByIdData_author_quotes(
          [void Function(GGetAuthorByIdData_author_quotesBuilder)? updates]) =>
      (new GGetAuthorByIdData_author_quotesBuilder()..update(updates))._build();

  _$GGetAuthorByIdData_author_quotes._({required this.G__typename, this.edges})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorByIdData_author_quotes', 'G__typename');
  }

  @override
  GGetAuthorByIdData_author_quotes rebuild(
          void Function(GGetAuthorByIdData_author_quotesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorByIdData_author_quotesBuilder toBuilder() =>
      new GGetAuthorByIdData_author_quotesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorByIdData_author_quotes &&
        G__typename == other.G__typename &&
        edges == other.edges;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), edges.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAuthorByIdData_author_quotes')
          ..add('G__typename', G__typename)
          ..add('edges', edges))
        .toString();
  }
}

class GGetAuthorByIdData_author_quotesBuilder
    implements
        Builder<GGetAuthorByIdData_author_quotes,
            GGetAuthorByIdData_author_quotesBuilder> {
  _$GGetAuthorByIdData_author_quotes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetAuthorByIdData_author_quotes_edges?>? _edges;
  ListBuilder<GGetAuthorByIdData_author_quotes_edges?> get edges =>
      _$this._edges ??=
          new ListBuilder<GGetAuthorByIdData_author_quotes_edges?>();
  set edges(ListBuilder<GGetAuthorByIdData_author_quotes_edges?>? edges) =>
      _$this._edges = edges;

  GGetAuthorByIdData_author_quotesBuilder() {
    GGetAuthorByIdData_author_quotes._initializeBuilder(this);
  }

  GGetAuthorByIdData_author_quotesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _edges = $v.edges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorByIdData_author_quotes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorByIdData_author_quotes;
  }

  @override
  void update(void Function(GGetAuthorByIdData_author_quotesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorByIdData_author_quotes build() => _build();

  _$GGetAuthorByIdData_author_quotes _build() {
    _$GGetAuthorByIdData_author_quotes _$result;
    try {
      _$result = _$v ??
          new _$GGetAuthorByIdData_author_quotes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetAuthorByIdData_author_quotes', 'G__typename'),
              edges: _edges?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'edges';
        _edges?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAuthorByIdData_author_quotes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAuthorByIdData_author_quotes_edges
    extends GGetAuthorByIdData_author_quotes_edges {
  @override
  final String G__typename;
  @override
  final GGetAuthorByIdData_author_quotes_edges_node? node;

  factory _$GGetAuthorByIdData_author_quotes_edges(
          [void Function(GGetAuthorByIdData_author_quotes_edgesBuilder)?
              updates]) =>
      (new GGetAuthorByIdData_author_quotes_edgesBuilder()..update(updates))
          ._build();

  _$GGetAuthorByIdData_author_quotes_edges._(
      {required this.G__typename, this.node})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAuthorByIdData_author_quotes_edges', 'G__typename');
  }

  @override
  GGetAuthorByIdData_author_quotes_edges rebuild(
          void Function(GGetAuthorByIdData_author_quotes_edgesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorByIdData_author_quotes_edgesBuilder toBuilder() =>
      new GGetAuthorByIdData_author_quotes_edgesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorByIdData_author_quotes_edges &&
        G__typename == other.G__typename &&
        node == other.node;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), node.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetAuthorByIdData_author_quotes_edges')
          ..add('G__typename', G__typename)
          ..add('node', node))
        .toString();
  }
}

class GGetAuthorByIdData_author_quotes_edgesBuilder
    implements
        Builder<GGetAuthorByIdData_author_quotes_edges,
            GGetAuthorByIdData_author_quotes_edgesBuilder> {
  _$GGetAuthorByIdData_author_quotes_edges? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetAuthorByIdData_author_quotes_edges_nodeBuilder? _node;
  GGetAuthorByIdData_author_quotes_edges_nodeBuilder get node =>
      _$this._node ??= new GGetAuthorByIdData_author_quotes_edges_nodeBuilder();
  set node(GGetAuthorByIdData_author_quotes_edges_nodeBuilder? node) =>
      _$this._node = node;

  GGetAuthorByIdData_author_quotes_edgesBuilder() {
    GGetAuthorByIdData_author_quotes_edges._initializeBuilder(this);
  }

  GGetAuthorByIdData_author_quotes_edgesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _node = $v.node?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorByIdData_author_quotes_edges other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorByIdData_author_quotes_edges;
  }

  @override
  void update(
      void Function(GGetAuthorByIdData_author_quotes_edgesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorByIdData_author_quotes_edges build() => _build();

  _$GGetAuthorByIdData_author_quotes_edges _build() {
    _$GGetAuthorByIdData_author_quotes_edges _$result;
    try {
      _$result = _$v ??
          new _$GGetAuthorByIdData_author_quotes_edges._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetAuthorByIdData_author_quotes_edges', 'G__typename'),
              node: _node?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'node';
        _node?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAuthorByIdData_author_quotes_edges',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAuthorByIdData_author_quotes_edges_node
    extends GGetAuthorByIdData_author_quotes_edges_node {
  @override
  final String G__typename;
  @override
  final String G_id;
  @override
  final String id;
  @override
  final String text;

  factory _$GGetAuthorByIdData_author_quotes_edges_node(
          [void Function(GGetAuthorByIdData_author_quotes_edges_nodeBuilder)?
              updates]) =>
      (new GGetAuthorByIdData_author_quotes_edges_nodeBuilder()
            ..update(updates))
          ._build();

  _$GGetAuthorByIdData_author_quotes_edges_node._(
      {required this.G__typename,
      required this.G_id,
      required this.id,
      required this.text})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetAuthorByIdData_author_quotes_edges_node', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        G_id, r'GGetAuthorByIdData_author_quotes_edges_node', 'G_id');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GGetAuthorByIdData_author_quotes_edges_node', 'id');
    BuiltValueNullFieldError.checkNotNull(
        text, r'GGetAuthorByIdData_author_quotes_edges_node', 'text');
  }

  @override
  GGetAuthorByIdData_author_quotes_edges_node rebuild(
          void Function(GGetAuthorByIdData_author_quotes_edges_nodeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAuthorByIdData_author_quotes_edges_nodeBuilder toBuilder() =>
      new GGetAuthorByIdData_author_quotes_edges_nodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAuthorByIdData_author_quotes_edges_node &&
        G__typename == other.G__typename &&
        G_id == other.G_id &&
        id == other.id &&
        text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), G_id.hashCode), id.hashCode),
        text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetAuthorByIdData_author_quotes_edges_node')
          ..add('G__typename', G__typename)
          ..add('G_id', G_id)
          ..add('id', id)
          ..add('text', text))
        .toString();
  }
}

class GGetAuthorByIdData_author_quotes_edges_nodeBuilder
    implements
        Builder<GGetAuthorByIdData_author_quotes_edges_node,
            GGetAuthorByIdData_author_quotes_edges_nodeBuilder> {
  _$GGetAuthorByIdData_author_quotes_edges_node? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _G_id;
  String? get G_id => _$this._G_id;
  set G_id(String? G_id) => _$this._G_id = G_id;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  GGetAuthorByIdData_author_quotes_edges_nodeBuilder() {
    GGetAuthorByIdData_author_quotes_edges_node._initializeBuilder(this);
  }

  GGetAuthorByIdData_author_quotes_edges_nodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _G_id = $v.G_id;
      _id = $v.id;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAuthorByIdData_author_quotes_edges_node other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAuthorByIdData_author_quotes_edges_node;
  }

  @override
  void update(
      void Function(GGetAuthorByIdData_author_quotes_edges_nodeBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAuthorByIdData_author_quotes_edges_node build() => _build();

  _$GGetAuthorByIdData_author_quotes_edges_node _build() {
    final _$result = _$v ??
        new _$GGetAuthorByIdData_author_quotes_edges_node._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetAuthorByIdData_author_quotes_edges_node', 'G__typename'),
            G_id: BuiltValueNullFieldError.checkNotNull(
                G_id, r'GGetAuthorByIdData_author_quotes_edges_node', 'G_id'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetAuthorByIdData_author_quotes_edges_node', 'id'),
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'GGetAuthorByIdData_author_quotes_edges_node', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
