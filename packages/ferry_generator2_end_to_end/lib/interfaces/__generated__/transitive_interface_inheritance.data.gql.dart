// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// The query type for the schema.
class GAThingTransitiveInterfaceInheritanceData {
  const GAThingTransitiveInterfaceInheritanceData({
    this.aThing,
    required this.G__typename,
  });

  factory GAThingTransitiveInterfaceInheritanceData.fromJson(
      Map<String, dynamic> json) {
    return GAThingTransitiveInterfaceInheritanceData(
      aThing: json['aThing'] == null
          ? null
          : GAThingTransitiveInterfaceInheritanceData_aThing.fromJson(
              (json['aThing'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GAThingTransitiveInterfaceInheritanceData_aThing? aThing;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$aThingValue = this.aThing;
    _$result['aThing'] = _$aThingValue == null ? null : _$aThingValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GAThingTransitiveInterfaceInheritanceData copyWith({
    GAThingTransitiveInterfaceInheritanceData_aThing? aThing,
    bool aThingIsSet = false,
    String? G__typename,
  }) {
    return GAThingTransitiveInterfaceInheritanceData(
      aThing: aThingIsSet ? aThing : this.aThing,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAThingTransitiveInterfaceInheritanceData &&
            aThing == other.aThing &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, aThing, G__typename);
  }

  @override
  String toString() {
    return 'GAThingTransitiveInterfaceInheritanceData(aThing: $aThing, G__typename: $G__typename)';
  }
}

sealed class GAThingTransitiveInterfaceInheritanceData_aThing {
  const GAThingTransitiveInterfaceInheritanceData_aThing({
    required this.G__typename,
    required this.id,
  });

  factory GAThingTransitiveInterfaceInheritanceData_aThing.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'John':
        return GAThingTransitiveInterfaceInheritanceData_aThing__asJohn
            .fromJson(json);
      case 'Bar':
      case 'Foo':
        return GAThingTransitiveInterfaceInheritanceData_aThing__asB.fromJson(
            json);
      default:
        return GAThingTransitiveInterfaceInheritanceData_aThing__unknown
            .fromJson(json);
    }
  }

  final String G__typename;

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    _$result['id'] = this.id;
    return _$result;
  }
}

extension GAThingTransitiveInterfaceInheritanceData_aThingWhenExtension
    on GAThingTransitiveInterfaceInheritanceData_aThing {
  _T when<_T>({
    required _T Function(GAThingTransitiveInterfaceInheritanceData_aThing__asB)
        b,
    required _T Function(
            GAThingTransitiveInterfaceInheritanceData_aThing__asJohn)
        john,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'John':
        return john(
            this as GAThingTransitiveInterfaceInheritanceData_aThing__asJohn);
      case 'Bar':
      case 'Foo':
        return b(this as GAThingTransitiveInterfaceInheritanceData_aThing__asB);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAThingTransitiveInterfaceInheritanceData_aThing__asB)? b,
    _T Function(GAThingTransitiveInterfaceInheritanceData_aThing__asJohn)? john,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'John':
        return john == null
            ? orElse()
            : john(this
                as GAThingTransitiveInterfaceInheritanceData_aThing__asJohn);
      case 'Bar':
      case 'Foo':
        return b == null
            ? orElse()
            : b(this as GAThingTransitiveInterfaceInheritanceData_aThing__asB);
      default:
        return orElse();
    }
  }
}

class GAThingTransitiveInterfaceInheritanceData_aThing__asB
    extends GAThingTransitiveInterfaceInheritanceData_aThing {
  GAThingTransitiveInterfaceInheritanceData_aThing__asB({
    required String G__typename,
    required String id,
    required this.bField,
  }) : super(G__typename: G__typename, id: id);

  factory GAThingTransitiveInterfaceInheritanceData_aThing__asB.fromJson(
      Map<String, dynamic> json) {
    return GAThingTransitiveInterfaceInheritanceData_aThing__asB(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      bField: (json['bField'] as String),
    );
  }

  final String bField;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['bField'] = this.bField;
    return _$result;
  }

  GAThingTransitiveInterfaceInheritanceData_aThing__asB copyWith({
    String? G__typename,
    String? id,
    String? bField,
  }) {
    return GAThingTransitiveInterfaceInheritanceData_aThing__asB(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      bField: bField ?? this.bField,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAThingTransitiveInterfaceInheritanceData_aThing__asB &&
            G__typename == other.G__typename &&
            id == other.id &&
            bField == other.bField);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, bField);
  }

  @override
  String toString() {
    return 'GAThingTransitiveInterfaceInheritanceData_aThing__asB(G__typename: $G__typename, id: $id, bField: $bField)';
  }
}

class GAThingTransitiveInterfaceInheritanceData_aThing__asJohn
    extends GAThingTransitiveInterfaceInheritanceData_aThing {
  GAThingTransitiveInterfaceInheritanceData_aThing__asJohn({
    required String G__typename,
    required String id,
    required this.johnOnly,
  }) : super(G__typename: G__typename, id: id);

  factory GAThingTransitiveInterfaceInheritanceData_aThing__asJohn.fromJson(
      Map<String, dynamic> json) {
    return GAThingTransitiveInterfaceInheritanceData_aThing__asJohn(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      johnOnly: (json['johnOnly'] as String),
    );
  }

  final String johnOnly;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['johnOnly'] = this.johnOnly;
    return _$result;
  }

  GAThingTransitiveInterfaceInheritanceData_aThing__asJohn copyWith({
    String? G__typename,
    String? id,
    String? johnOnly,
  }) {
    return GAThingTransitiveInterfaceInheritanceData_aThing__asJohn(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      johnOnly: johnOnly ?? this.johnOnly,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAThingTransitiveInterfaceInheritanceData_aThing__asJohn &&
            G__typename == other.G__typename &&
            id == other.id &&
            johnOnly == other.johnOnly);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, johnOnly);
  }

  @override
  String toString() {
    return 'GAThingTransitiveInterfaceInheritanceData_aThing__asJohn(G__typename: $G__typename, id: $id, johnOnly: $johnOnly)';
  }
}

class GAThingTransitiveInterfaceInheritanceData_aThing__unknown
    extends GAThingTransitiveInterfaceInheritanceData_aThing {
  GAThingTransitiveInterfaceInheritanceData_aThing__unknown({
    required String G__typename,
    required String id,
  }) : super(G__typename: G__typename, id: id);

  factory GAThingTransitiveInterfaceInheritanceData_aThing__unknown.fromJson(
      Map<String, dynamic> json) {
    return GAThingTransitiveInterfaceInheritanceData_aThing__unknown(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GAThingTransitiveInterfaceInheritanceData_aThing__unknown copyWith({
    String? G__typename,
    String? id,
  }) {
    return GAThingTransitiveInterfaceInheritanceData_aThing__unknown(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAThingTransitiveInterfaceInheritanceData_aThing__unknown &&
            G__typename == other.G__typename &&
            id == other.id);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id);
  }

  @override
  String toString() {
    return 'GAThingTransitiveInterfaceInheritanceData_aThing__unknown(G__typename: $G__typename, id: $id)';
  }
}

/// The query type for the schema.
class GBThingTransitiveInterfaceInheritanceData {
  const GBThingTransitiveInterfaceInheritanceData({
    this.bThing,
    required this.G__typename,
  });

  factory GBThingTransitiveInterfaceInheritanceData.fromJson(
      Map<String, dynamic> json) {
    return GBThingTransitiveInterfaceInheritanceData(
      bThing: json['bThing'] == null
          ? null
          : GBThingTransitiveInterfaceInheritanceData_bThing.fromJson(
              (json['bThing'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GBThingTransitiveInterfaceInheritanceData_bThing? bThing;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$bThingValue = this.bThing;
    _$result['bThing'] = _$bThingValue == null ? null : _$bThingValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GBThingTransitiveInterfaceInheritanceData copyWith({
    GBThingTransitiveInterfaceInheritanceData_bThing? bThing,
    bool bThingIsSet = false,
    String? G__typename,
  }) {
    return GBThingTransitiveInterfaceInheritanceData(
      bThing: bThingIsSet ? bThing : this.bThing,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GBThingTransitiveInterfaceInheritanceData &&
            bThing == other.bThing &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, bThing, G__typename);
  }

  @override
  String toString() {
    return 'GBThingTransitiveInterfaceInheritanceData(bThing: $bThing, G__typename: $G__typename)';
  }
}

sealed class GBThingTransitiveInterfaceInheritanceData_bThing {
  const GBThingTransitiveInterfaceInheritanceData_bThing({
    required this.G__typename,
    required this.id,
    required this.bField,
  });

  factory GBThingTransitiveInterfaceInheritanceData_bThing.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'Foo':
        return GBThingTransitiveInterfaceInheritanceData_bThing__asFoo.fromJson(
            json);
      case 'Bar':
        return GBThingTransitiveInterfaceInheritanceData_bThing__asBar.fromJson(
            json);
      default:
        return GBThingTransitiveInterfaceInheritanceData_bThing__unknown
            .fromJson(json);
    }
  }

  final String G__typename;

  final String id;

  final String bField;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    _$result['id'] = this.id;
    _$result['bField'] = this.bField;
    return _$result;
  }
}

extension GBThingTransitiveInterfaceInheritanceData_bThingWhenExtension
    on GBThingTransitiveInterfaceInheritanceData_bThing {
  _T when<_T>({
    required _T Function(
            GBThingTransitiveInterfaceInheritanceData_bThing__asFoo)
        foo,
    required _T Function(
            GBThingTransitiveInterfaceInheritanceData_bThing__asBar)
        bar,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Foo':
        return foo(
            this as GBThingTransitiveInterfaceInheritanceData_bThing__asFoo);
      case 'Bar':
        return bar(
            this as GBThingTransitiveInterfaceInheritanceData_bThing__asBar);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBThingTransitiveInterfaceInheritanceData_bThing__asFoo)? foo,
    _T Function(GBThingTransitiveInterfaceInheritanceData_bThing__asBar)? bar,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Foo':
        return foo == null
            ? orElse()
            : foo(this
                as GBThingTransitiveInterfaceInheritanceData_bThing__asFoo);
      case 'Bar':
        return bar == null
            ? orElse()
            : bar(this
                as GBThingTransitiveInterfaceInheritanceData_bThing__asBar);
      default:
        return orElse();
    }
  }
}

class GBThingTransitiveInterfaceInheritanceData_bThing__asFoo
    extends GBThingTransitiveInterfaceInheritanceData_bThing {
  GBThingTransitiveInterfaceInheritanceData_bThing__asFoo({
    required String G__typename,
    required String id,
    required String bField,
    required this.fooOnly,
  }) : super(G__typename: G__typename, id: id, bField: bField);

  factory GBThingTransitiveInterfaceInheritanceData_bThing__asFoo.fromJson(
      Map<String, dynamic> json) {
    return GBThingTransitiveInterfaceInheritanceData_bThing__asFoo(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      bField: (json['bField'] as String),
      fooOnly: (json['fooOnly'] as String),
    );
  }

  final String fooOnly;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['fooOnly'] = this.fooOnly;
    return _$result;
  }

  GBThingTransitiveInterfaceInheritanceData_bThing__asFoo copyWith({
    String? G__typename,
    String? id,
    String? bField,
    String? fooOnly,
  }) {
    return GBThingTransitiveInterfaceInheritanceData_bThing__asFoo(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      bField: bField ?? this.bField,
      fooOnly: fooOnly ?? this.fooOnly,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GBThingTransitiveInterfaceInheritanceData_bThing__asFoo &&
            G__typename == other.G__typename &&
            id == other.id &&
            bField == other.bField &&
            fooOnly == other.fooOnly);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, bField, fooOnly);
  }

  @override
  String toString() {
    return 'GBThingTransitiveInterfaceInheritanceData_bThing__asFoo(G__typename: $G__typename, id: $id, bField: $bField, fooOnly: $fooOnly)';
  }
}

class GBThingTransitiveInterfaceInheritanceData_bThing__asBar
    extends GBThingTransitiveInterfaceInheritanceData_bThing {
  GBThingTransitiveInterfaceInheritanceData_bThing__asBar({
    required String G__typename,
    required String id,
    required String bField,
    required this.barOnly,
  }) : super(G__typename: G__typename, id: id, bField: bField);

  factory GBThingTransitiveInterfaceInheritanceData_bThing__asBar.fromJson(
      Map<String, dynamic> json) {
    return GBThingTransitiveInterfaceInheritanceData_bThing__asBar(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      bField: (json['bField'] as String),
      barOnly: (json['barOnly'] as String),
    );
  }

  final String barOnly;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['barOnly'] = this.barOnly;
    return _$result;
  }

  GBThingTransitiveInterfaceInheritanceData_bThing__asBar copyWith({
    String? G__typename,
    String? id,
    String? bField,
    String? barOnly,
  }) {
    return GBThingTransitiveInterfaceInheritanceData_bThing__asBar(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      bField: bField ?? this.bField,
      barOnly: barOnly ?? this.barOnly,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GBThingTransitiveInterfaceInheritanceData_bThing__asBar &&
            G__typename == other.G__typename &&
            id == other.id &&
            bField == other.bField &&
            barOnly == other.barOnly);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, bField, barOnly);
  }

  @override
  String toString() {
    return 'GBThingTransitiveInterfaceInheritanceData_bThing__asBar(G__typename: $G__typename, id: $id, bField: $bField, barOnly: $barOnly)';
  }
}

class GBThingTransitiveInterfaceInheritanceData_bThing__unknown
    extends GBThingTransitiveInterfaceInheritanceData_bThing {
  GBThingTransitiveInterfaceInheritanceData_bThing__unknown({
    required String G__typename,
    required String id,
    required String bField,
  }) : super(G__typename: G__typename, id: id, bField: bField);

  factory GBThingTransitiveInterfaceInheritanceData_bThing__unknown.fromJson(
      Map<String, dynamic> json) {
    return GBThingTransitiveInterfaceInheritanceData_bThing__unknown(
      G__typename: (json['__typename'] as String),
      id: (json['id'] as String),
      bField: (json['bField'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GBThingTransitiveInterfaceInheritanceData_bThing__unknown copyWith({
    String? G__typename,
    String? id,
    String? bField,
  }) {
    return GBThingTransitiveInterfaceInheritanceData_bThing__unknown(
      G__typename: G__typename ?? this.G__typename,
      id: id ?? this.id,
      bField: bField ?? this.bField,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GBThingTransitiveInterfaceInheritanceData_bThing__unknown &&
            G__typename == other.G__typename &&
            id == other.id &&
            bField == other.bField);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, id, bField);
  }

  @override
  String toString() {
    return 'GBThingTransitiveInterfaceInheritanceData_bThing__unknown(G__typename: $G__typename, id: $id, bField: $bField)';
  }
}
